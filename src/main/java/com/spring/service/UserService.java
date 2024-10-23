package com.spring.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.entity.User;
import com.spring.repository.UserRepository;
import java.sql.Timestamp;
import java.util.Optional;

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

    public void join(User user) {
        // 회원가입 시 기본값 설정
        user.setUserRole("user");
        user.setUserIsActive(0);
        user.setUserPoint(0);
        user.setUserSignupDate(new Timestamp(System.currentTimeMillis()));
        user.setUserProfilePicture("default.jpg"); 
        
        // 저장
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
}