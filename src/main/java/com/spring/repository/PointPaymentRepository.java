package com.spring.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.spring.entity.PointPayment;

@Repository
public interface PointPaymentRepository extends JpaRepository<PointPayment, Integer> {
    List<PointPayment> findByUserIdxOrderByPointDateDesc(int userIdx);

    @Query("SELECT p FROM PointPayment p WHERE p.userIdx = :userId " +
            "AND p.characterIdx = :characterIdx " +
            "AND p.rentalStatus = 'ACTIVE' " +
            "AND p.rentalEndDate > CURRENT_TIMESTAMP " +
            "ORDER BY p.rentalEndDate DESC")
    PointPayment findActiveRental(@Param("userId") int userId,
            @Param("characterIdx") int characterIdx);

    // 캐릭터 idx가 많이 등장한 상위 5개의 캐릭터 idx 조회
    @Query("SELECT pp.characterIdx, COUNT(pp.characterIdx) FROM PointPayment pp GROUP BY pp.characterIdx ORDER BY COUNT(pp.characterIdx) DESC LIMIT 10")
    List<Object[]> findTop10CharacterIdxByUsage();


}
