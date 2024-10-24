package com.spring.controller;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.spring.entity.Payment;
import com.spring.entity.PointPayment;
import com.spring.entity.User;
import com.spring.service.PaymentService;
import com.spring.service.PointPaymentService;
import com.spring.service.UserService;

import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class PaymentController {
    
    @Autowired
    private UserService userService;
    @Autowired 
    private PaymentService paymentService;
    @Autowired
    private PointPaymentService pointPaymentService;  
    
    @GetMapping("/payment")
    public String payment(Model model, HttpSession session) {
        User loginUser = (User) session.getAttribute("loginUser");
        
        if(loginUser != null) {
            model.addAttribute("user", loginUser);

            // 사용자의 결제/포인트 내역 조회
            List<Payment> payments = paymentService.getPaymentsByUserIdx(loginUser.getUserIdx());
            List<PointPayment> pointPayments = pointPaymentService.getPointPaymentsByUserIdx(loginUser.getUserIdx());
            
            model.addAttribute("payments", payments);
            model.addAttribute("pointPayments", pointPayments);
            return "Payment";  
        } else {
            return "redirect:/loginForm";  
        } 
        
    }

    @PostMapping("payment/complete")
    @ResponseBody
    @Transactional
    public ResponseEntity<?> paymentComplete(@RequestParam Map<String, String> paymentInfo) {
        try {
            int amount = Integer.parseInt(paymentInfo.get("amount"));
            int userIdx = Integer.parseInt(paymentInfo.get("userId"));
            String paymentId = paymentInfo.get("paymentId");
            int points = Integer.parseInt(paymentInfo.get("points"));
            int characterIdx = 1;
            
            User user = userService.getUserById(userIdx);
            if(user == null) {
                return ResponseEntity.badRequest().body("사용자를 찾을 수 없습니다.");
            }
    
            // 1. 결제 내역 저장
            Payment payment = new Payment();
            payment.setUser(user);
            payment.setPaymentContent("스마일 충전 (" + amount + "원)");
            payment.setPaymentDate(LocalDateTime.now());
            Payment savedPayment = paymentService.savePayment(payment);
            
            if(savedPayment != null) {
                // 2. 포인트 내역 저장
                PointPayment pointPayment = new PointPayment();
                pointPayment.setUserIdx(userIdx);
                pointPayment.setCharacterIdx(characterIdx);
                pointPayment.setPointAmount(points);
                pointPayment.setPointDate(LocalDateTime.now());
                pointPayment.setUser(user);
                PointPayment savedPointPayment = pointPaymentService.savePointPayment(pointPayment);
                
                if(savedPointPayment != null) {
                    // 3. 사용자 포인트 업데이트
                    user.setUserPoint(user.getUserPoint() + points);
                    userService.updateUserPoint(userIdx, user.getUserPoint());
                    
                    return ResponseEntity.ok().body("success");
                } else {
                    throw new RuntimeException("포인트 내역 저장 실패");
                }
            } else {
                throw new RuntimeException("결제 내역 저장 실패");
            }
            
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
}
