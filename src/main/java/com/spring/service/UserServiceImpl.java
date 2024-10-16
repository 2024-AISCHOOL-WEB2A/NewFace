package com.spring.service;

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




