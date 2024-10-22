package com.spring.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.sql.Timestamp;

@Data
@Entity
@Table(name = "user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int userIdx;        
    
    @Column(name = "user_id")
    private String userId;      
    
    @Column(name = "user_pw")
    private String userPw;      
    
    @Column(name = "user_nickname")
    private String userNickname; 
    
    @Column(name = "user_profile_picture")
    private String userProfilePicture; 
    
    @Column(name = "user_email")
    private String userEmail;    
    
    @Column(name = "user_signup_date")
    private Timestamp userSignupDate; 
    
    @Column(name = "user_role")
    private String userRole;    
    
    @Column(name = "user_is_active")
    private int userIsActive;    
    
    @Column(name = "user_point")
    private int userPoint;      
    
    public User() {
        this.userRole = "user"; 
        this.userIsActive = 0;   
    }
}