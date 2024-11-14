package com.spring.service;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageWriteParam;
import javax.imageio.ImageWriter;
import javax.imageio.stream.ImageOutputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.util.Base64;
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
        user.setUserIsActive(1);
        user.setUserPoint(0);
        user.setUserSignupDate(new Timestamp(System.currentTimeMillis()));
        user.setUserProfilePicture("/image/default.png"); 
        
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
                    newUser.setUserProfilePicture("/image/default.png");
                    
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

//  관리자 페이지 전체 사용자 목록 조회
public List<User> getAllUsers() {
    return userRepository.findAll();
}

public User findByUserId(String userId) {
    return userRepository.findByUserId(userId)
        .orElse(null);
}

 // 이미지 압축 유틸리티 메소드 추가
    private byte[] compressImage(MultipartFile file) throws IOException {
        BufferedImage originalImage = ImageIO.read(file.getInputStream());
        
        // 이미지 크기 제한
        int maxSize = 200;
        int width = originalImage.getWidth();
        int height = originalImage.getHeight();
        
        if (width > maxSize || height > maxSize) {
            double ratio = (double) maxSize / Math.max(width, height);
            width = (int) (width * ratio);
            height = (int) (height * ratio);
        }
        
        BufferedImage resizedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        resizedImage.getGraphics().drawImage(originalImage, 0, 0, width, height, null);
        
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        // JPEG 품질 설정 (0.0 ~ 1.0)
        ImageWriter writer = ImageIO.getImageWritersByFormatName("jpg").next();
        ImageWriteParam param = writer.getDefaultWriteParam();
        param.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
        param.setCompressionQuality(0.3f); // 30% 품질
        
        ImageOutputStream ios = ImageIO.createImageOutputStream(baos);
        writer.setOutput(ios);
        writer.write(null, new IIOImage(resizedImage, null, null), param);
        
        writer.dispose();

        
        return baos.toByteArray();
    }

    // 프로필 업데이트 메소드 추가
    @Transactional
    public User updateProfile(User user, MultipartFile profileImage) throws IOException {
        String profilePicture = user.getUserProfilePicture(); // 기존 이미지 유지
    
        if (profileImage != null && !profileImage.isEmpty()) {
            byte[] compressedImageBytes = compressImage(profileImage);
            String base64Image = Base64.getEncoder().encodeToString(compressedImageBytes);
            profilePicture = "data:image/jpeg;base64," + base64Image;
        }
        
        // 특정 필드만 업데이트하는 repository 메소드 사용
        userRepository.updateProfileInfo(user.getUserIdx(), user.getUserNickname(), profilePicture);
        
        // 업데이트된 사용자 정보 반환
        return userRepository.findById(user.getUserIdx())
            .orElseThrow(() -> new RuntimeException("User not found"));
    }

    // 회원 탈퇴 메소드 추가 (status 변경 방식)
    @Transactional
    public void deleteUser(int userIdx) {
        User user = userRepository.findById(userIdx)
            .orElseThrow(() -> new RuntimeException("User not found"));
        user.setUserIsActive(0); // 비활성화 처리
        userRepository.save(user);
    }

}