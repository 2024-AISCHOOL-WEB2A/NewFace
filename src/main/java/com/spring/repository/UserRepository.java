package com.spring.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.spring.entity.User;

import jakarta.transaction.Transactional;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    boolean existsByUserId(String userId);
    boolean existsByUserEmail(String userEmail);

    Optional<User> findByUserId(String userId);
    Optional<User> findByUserEmail(String userEmail);    // 이메일로 사용자 찾기

@Modifying(clearAutomatically = true)
@Transactional
@Query("UPDATE User u SET u.userNickname = :nickname, u.userProfilePicture = :profilePicture WHERE u.userIdx = :userIdx")
void updateProfileInfo(@Param("userIdx") int userIdx, 
                      @Param("nickname") String nickname, 
                      @Param("profilePicture") String profilePicture);

}
