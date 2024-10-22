package com.spring.service;

import com.spring.entity.User;
import com.spring.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    
    @Autowired
    private UserRepository userRepository;
    
    // 회원가입
    public void join(User user) {
        userRepository.save(user);
    }
    
    // 로그인 체크
    public User login(String userId, String userPw) {
        User user = userRepository.findByUserId(userId);
        if(user != null && user.getUserPw().equals(userPw)) {
            return user;
        }
        return null;
    }
    
    // ID 중복 체크
    public boolean checkUserIdDuplicate(String userId) {
        return userRepository.existsByUserId(userId);
    }
    
    // 이메일 중복 체크
    public boolean checkUserEmailDuplicate(String userEmail) {
        return userRepository.existsByUserEmail(userEmail);
    }
}