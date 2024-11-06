package com.spring.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.sql.Timestamp;

@Data
@Entity
@Table(name = "tb_user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_idx")
    private int userIdx;
    
    @Column(name = "user_id", nullable = false, unique = true)
    private String userId;
    
    @Column(name = "user_pw", nullable = false)
    private String userPw;
    
    @Column(name = "user_nickname", nullable = false)
    private String userNickname;
    
    @Column(name = "user_profile_picture", nullable = true)  // NULL 허용
    private String userProfilePicture;
    
    @Column(name = "user_email", nullable = false, unique = true)
    private String userEmail;
    
    @Column(name = "user_signup_date")
    private Timestamp userSignupDate;
    
    @Column(name = "user_role", length = 5)
    private String userRole;
    
    @Column(name = "user_is_active")
    private int userIsActive;
    
    @Column(name = "user_point")
    private int userPoint; 

    @Column(name = "provider")
    private String provider;    // 어떤 OAuth로 로그인 했는지 구분하기 위한 필드
    
    @Column(name = "provider_id")
    private String providerId;  // OAuth 로그인한 사용자의 식별자 값

    }
