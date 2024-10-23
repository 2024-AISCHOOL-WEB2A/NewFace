package com.spring.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.spring.entity.Payment;

@Repository
public interface PaymentRepository extends JpaRepository<Payment, Integer>{
    List<Payment> findByUserIdxOrderByPaymentDateDesc(int userIdx);
}
