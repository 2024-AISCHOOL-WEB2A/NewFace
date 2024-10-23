package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.entity.PointPayment;
import com.spring.repository.PointPaymentRepository;

@Service
public class PointPaymentService {
    @Autowired
    private PointPaymentRepository pointPaymentRepository;
    
    public List<PointPayment> getPointPaymentsByUserIdx(int userIdx) {
        return pointPaymentRepository.findByUserIdxOrderByPointDateDesc(userIdx);
    }
}
