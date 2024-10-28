package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.entity.PointPayment;
import com.spring.repository.PointPaymentRepository;
import java.time.LocalDateTime;

import java.util.List;

@Service
public class PointPaymentService {
    
    @Autowired
    private PointPaymentRepository pointPaymentRepository;
    
    public List<PointPayment> getPointPaymentsByUserIdx(int userIdx) {
        return pointPaymentRepository.findByUserIdxOrderByPointDateDesc(userIdx);
    }
    
    @Transactional
    public PointPayment savePointPayment(PointPayment pointPayment) {
         // 포인트 사용 시 (음수일 때) 렌탈 정보 설정
         if (pointPayment.getPointAmount() < 0) {
            pointPayment.setRentalEndDate(LocalDateTime.now().plusDays(1));
            pointPayment.setRentalStatus("ACTIVE");
        }
        return pointPaymentRepository.save(pointPayment);
    }
    public PointPayment getActiveRental(int userId, int characterIdx) {
        return pointPaymentRepository.findActiveRental(userId, characterIdx);
    }
}