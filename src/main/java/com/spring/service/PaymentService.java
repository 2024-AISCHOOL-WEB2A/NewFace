package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.entity.Payment;
import com.spring.repository.PaymentRepository;
@Service
public class PaymentService {

    @Autowired
    private PaymentRepository paymentRepository;
    
    public List<Payment> getPaymentsByUserIdx(int userIdx) {
        return paymentRepository.findByUserIdxOrderByPaymentDateDesc(userIdx);
    }

}
