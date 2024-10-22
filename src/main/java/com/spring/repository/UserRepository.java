package com.spring.repository;

import com.spring.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    // userIdx가 Integer 타입이므로 JpaRepository<User, Integer>를 사용
    
    // 필요한 쿼리 메서드들 추가
    User findByUserId(String userId);
    User findByUserEmail(String userEmail);
    boolean existsByUserId(String userId);
    boolean existsByUserEmail(String userEmail);
}