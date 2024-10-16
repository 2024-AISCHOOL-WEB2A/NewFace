package com.spring.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Table(name = "user")
@Getter
@Setter
@NoArgsConstructor
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_idx", nullable = false)
    private Long userIdx;

    @Column(name = "user_id", nullable = false)
    private String userId;

    @Column(name = "user_pw", nullable = false)
    private String userPw;

    @Column(name = "user_nickname", nullable = false)
    private String userNickname;

    @Column(name = "user_profile_picture")
    private String userProfilePicture;

    @Column(name = "user_email", nullable = false)
    private String userEmail;

    @Column(name = "user_signup_date", nullable = false)
    private LocalDateTime userSignupDate;

    @Column(name = "user_role", nullable = false)
    private String userRole = "user";

    @Column(name = "user_is_active", nullable = false)
    private String userIsActive = "True";
}
