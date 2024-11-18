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

    Optional<User> findByUserEmail(String userEmail); // 이메일로 사용자 찾기

    @Modifying(clearAutomatically = true)
    @Transactional
    @Query("UPDATE User u SET u.userNickname = :nickname, u.userProfilePicture = :profilePicture WHERE u.userIdx = :userIdx")
    void updateProfileInfo(@Param("userIdx") int userIdx,
            @Param("nickname") String nickname,
            @Param("profilePicture") String profilePicture);

    // 회원가입 시 비밀번호 암호화
    @Query(value = "INSERT INTO tb_user (user_id, user_pw, user_nickname, user_email, user_role, user_is_active, user_point, user_signup_date, user_profile_picture) "
            +
            "VALUES (:#{#user.userId}, SHA2(:#{#user.userPw}, 256), :#{#user.userNickname}, :#{#user.userEmail}, :#{#user.userRole}, :#{#user.userIsActive}, :#{#user.userPoint}, :#{#user.userSignupDate}, :#{#user.userProfilePicture})", nativeQuery = true)
    @Modifying
    @Transactional
    void saveWithEncryption(@Param("user") User user);

    // 로그인 체크용 쿼리 추가
    @Query(value = "SELECT * FROM tb_user WHERE user_id = :userId AND user_pw = SHA2(:userPw, 256)", nativeQuery = true)
    Optional<User> findByUserIdAndEncryptedPw(@Param("userId") String userId, @Param("userPw") String userPw);

}
