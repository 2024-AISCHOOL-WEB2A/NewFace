package com.spring.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.spring.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    boolean existsByUserId(String userId);
    boolean existsByUserEmail(String userEmail);

    Optional<User> findByUserId(String userId);
    Optional<User> findByUserEmail(String userEmail);    // 이메일로 사용자 찾기

}
