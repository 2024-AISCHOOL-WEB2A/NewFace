package com.spring.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.HashMap;


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

        List<PointPayment> pointPayments = pointPaymentService.getPointPaymentsByUserIdx(loginUser.getUserIdx());
        
        // 모든 포인트 내역을 날짜 역순으로 정렬
        List<PointPayment> allPayments = new ArrayList<>(pointPayments);
        allPayments.sort((a, b) -> b.getPointDate().compareTo(a.getPointDate()));
        
        // 누적 포인트 계산을 위해 날짜순 정렬된 리스트 생성
        List<PointPayment> forCalculation = new ArrayList<>(pointPayments);
        forCalculation.sort(Comparator.comparing(PointPayment::getPointDate));
        
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
        
        model.addAttribute("allPayments", allPayments);  // 하나의 리스트로 전달
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

         // 현재 활성화된 렌탈이 있는지 확인
         PointPayment activeRental = pointPaymentService.getActiveRental(userIdx, characterIdx);
         if(activeRental != null) {
             return ResponseEntity.badRequest().body("이미 대여 중인 캐릭터입니다.");
         }

        // 포인트 사용 내역 저장
        PointPayment pointPayment = new PointPayment();
        pointPayment.setUserIdx(userIdx);
        pointPayment.setCharacterIdx(characterIdx);
        pointPayment.setPointAmount(-points);  // 사용은 음수로 저장
        pointPayment.setPointDate(LocalDateTime.now());
        pointPayment.setRentalEndDate(LocalDateTime.now().plusDays(1));
        pointPayment.setRentalStatus("ACTIVE");
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
    @GetMapping("/checkRentalStatus")
    @ResponseBody
    public Map<String, Object> checkRentalStatus(
            @RequestParam("characterIdx") int characterIdx,
            @RequestParam("userId") int userId) {
        
        Map<String, Object> response = new HashMap<>();
        
        // 현재 활성화된 렌탈 정보 조회
        PointPayment activeRental = pointPaymentService.getActiveRental(userId, characterIdx);
        
        if (activeRental != null) {
            response.put("isRented", true);
            response.put("endDate", activeRental.getFormattedRentalEndDate());
        } else {
            response.put("isRented", false);
        }
        
        return response;
    }




}
