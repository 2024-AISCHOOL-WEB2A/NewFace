package com.spring.service;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.repository.UserRepository;

import jakarta.transaction.Transactional;

import com.spring.entity.User;

@Service
public class UserServiceImpl implements UserService {

  
    
    @Autowired
    private UserRepository userRepository;

    @Override
    @Transactional
    public void join(User user) {
        if (user.getUserEmail() == null || user.getUserEmail().isEmpty()) {
        throw new IllegalArgumentException("이메일은 필수 입력 항목입니다.");
        }
        user.setUserSignupDate(LocalDateTime.now());
        userRepository.save(user);
    
    }

    @Override
    public boolean login(User user) {
        try {
            User foundUser = userRepository.findByUserId(user.getUserId());
            if (foundUser != null && foundUser.getUserPw().equals(user.getUserPw())) {
                return true;
            }
            throw new RuntimeException("Login failed for user ID: " + user.getUserId());
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    @Override
    public User getUserByUserId(String userId) {
        return userRepository.findByUserId(userId);
    }








}




