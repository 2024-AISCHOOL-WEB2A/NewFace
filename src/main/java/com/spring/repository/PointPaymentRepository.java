package com.spring.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.spring.entity.PointPayment;

@Repository
public interface PointPaymentRepository extends JpaRepository<PointPayment, Integer>{
    List<PointPayment> findByUserIdxOrderByPointDateDesc(int userIdx);
}
