package com.spring.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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

        List<Payment> payments = paymentService.getPaymentsByUserIdx(loginUser.getUserIdx());
        List<PointPayment> pointPayments = pointPaymentService.getPointPaymentsByUserIdx(loginUser.getUserIdx());
        
        // 모든 포인트 내역을 날짜 역순으로 정렬 (reversed() 추가)
        List<PointPayment> allPayments = pointPayments.stream()
            .sorted(Comparator.comparing(PointPayment::getPointDate).reversed())  // 역순 정렬
            .collect(Collectors.toList());
            
        // 충전 내역과 사용 내역 분리 (날짜 역순 정렬 유지)
        List<PointPayment> chargePayments = allPayments.stream()
            .filter(p -> p.getPointAmount() > 0)
            .collect(Collectors.toList());
            
        List<PointPayment> usePayments = allPayments.stream()
            .filter(p -> p.getPointAmount() < 0)
            .collect(Collectors.toList());

        // 누적 포인트는 여전히 날짜 순서대로 계산
        List<PointPayment> forCalculation = new ArrayList<>(pointPayments);
        forCalculation.sort(Comparator.comparing(PointPayment::getPointDate));  // 날짜순 정렬
        
        int runningTotal = 0;
        for(PointPayment payment : forCalculation) {
            runningTotal += payment.getPointAmount();
            payment.setTotalPoints(runningTotal);
        }
        
        // 역순 정렬된 리스트의 totalPoints 설정
        for(PointPayment payment : allPayments) {
            int index = forCalculation.indexOf(payment);
            payment.setTotalPoints(forCalculation.get(index).getTotalPoints());
        }
        
        model.addAttribute("payments", payments);
        model.addAttribute("chargePayments", chargePayments);
        model.addAttribute("usePayments", usePayments);
        model.addAttribute("currentTotal", runningTotal);
       
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
                    userService.updateUserPoint(userIdx, points);
                    
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

    @PostMapping("/point/use")
    @ResponseBody
    @Transactional
    public ResponseEntity<?> usePoint(@RequestParam Map<String, String> pointInfo) {
        try {
            int points = Integer.parseInt(pointInfo.get("points"));
            int userIdx = Integer.parseInt(pointInfo.get("userId"));
            int characterIdx = Integer.parseInt(pointInfo.get("characterIdx"));
            
            User user = userService.getUserById(userIdx);
            if(user == null) {
                return ResponseEntity.badRequest().body("사용자를 찾을 수 없습니다.");
        }
        
        // 포인트 잔액 확인
        if(user.getUserPoint() < points) {
            return ResponseEntity.badRequest().body("포인트가 부족합니다.");
        }

        // 포인트 사용 내역 저장
        PointPayment pointPayment = new PointPayment();
        pointPayment.setUserIdx(userIdx);
        pointPayment.setCharacterIdx(characterIdx);
        pointPayment.setPointAmount(-points);  // 사용은 음수로 저장
        pointPayment.setPointDate(LocalDateTime.now());
        pointPayment.setUser(user);
        PointPayment savedPointPayment = pointPaymentService.savePointPayment(pointPayment);
        
        if(savedPointPayment != null) {
            // 사용자 포인트 차감
            userService.updateUserPoint(userIdx, -points);  // 차감이므로 음수
            return ResponseEntity.ok().body("success");
        } else {
            throw new RuntimeException("포인트 사용 내역 저장 실패");
        }
        
    } catch (Exception e) {
        return ResponseEntity.badRequest().body(e.getMessage());
    }
}




}
