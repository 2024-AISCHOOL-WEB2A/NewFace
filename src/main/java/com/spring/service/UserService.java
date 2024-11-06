package com.spring.service;


import java.sql.Timestamp;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.entity.User;
import com.spring.repository.UserRepository;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public boolean checkUserIdDuplicate(String userId) {
        return userRepository.existsByUserId(userId);
    }

    public boolean checkUserEmailDuplicate(String userEmail) {
        return userRepository.existsByUserEmail(userEmail);
    }

    public User getUserInfo(String userId) {
        Optional<User> user = userRepository.findByUserId(userId);
        return user.orElse(null);
    }

    public void join(User user) {

        user.setUserRole("user");
        user.setUserIsActive(0);
        user.setUserPoint(0);
        user.setUserSignupDate(new Timestamp(System.currentTimeMillis()));
        user.setUserProfilePicture("default.jpg"); 
        
        userRepository.save(user);
    }

    // 로그인 처리
    public User login(String userId, String userPw) {
        // 아이디로 사용자 찾기
        Optional<User> user = userRepository.findByUserId(userId);
        
        // 사용자가 존재하고 비밀번호가 일치하면 해당 사용자 정보 반환
        if(user.isPresent() && user.get().getUserPw().equals(userPw)) {
            return user.get();
        }
        
        return null;
    } 

      // OAuth2 로그인 처리 (신규 추가)
    public User saveOrUpdateOAuth2User(String provider, String providerId, String email, String name) {
        return userRepository.findByUserEmail(email)
                .map(existingUser -> {
                    // 기존 회원이면 정보 업데이트
                    existingUser.setUserNickname(name);
                    existingUser.setProvider(provider);
                    existingUser.setProviderId(providerId);
                    return userRepository.save(existingUser);
                })
                .orElseGet(() -> {
                    // 신규 회원이면 회원가입 처리
                    User newUser = new User();
                    newUser.setUserEmail(email);
                    newUser.setUserNickname(name);
                    // OAuth2 로그인의 경우 임의의 userId 생성 (이메일 앞부분 사용)
                    newUser.setUserId(email.split("@")[0] + "_" + provider);
                    // OAuth2 로그인의 경우 비밀번호는 null 처리
                    newUser.setUserPw("oauth2User");
                    newUser.setProvider(provider);
                    newUser.setProviderId(providerId);
                    newUser.setUserRole("user");
                    newUser.setUserIsActive(1);
                    newUser.setUserPoint(0);
                    newUser.setUserSignupDate(new Timestamp(System.currentTimeMillis()));
                    newUser.setUserProfilePicture("default.jpg");
                    
                    return userRepository.save(newUser);
                });
    }

    @Transactional
    public void updateUserPoint(int userIdx, int points) {
        User user = userRepository.findById(userIdx)
            .orElseThrow(() -> new RuntimeException("User not found"));
        int currentPoint = user.getUserPoint();
        user.setUserPoint(currentPoint + points);
        userRepository.save(user);
    }

    public User getUserById(int userIdx) {
        return userRepository.findById(userIdx)
                .orElseThrow(() -> new RuntimeException("사용자를 찾을 수 없습니다."));
}

public User findByUserEmail(String email) {
    return userRepository.findByUserEmail(email).orElse(null);
}



}