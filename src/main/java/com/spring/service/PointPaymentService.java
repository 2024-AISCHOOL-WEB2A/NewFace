package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.entity.PointPayment;
import com.spring.repository.PointPaymentRepository;

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
        return pointPaymentRepository.save(pointPayment);
    }
}