package com.spring.service;

import java.util.Collections;
import java.util.Map;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.spring.entity.User;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class CustomOAuth2UserService extends DefaultOAuth2UserService {
    
    private final UserService userService;
    
    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2User oauth2User = super.loadUser(userRequest);
        
        try {
            return processOAuth2User(userRequest, oauth2User);
        } catch (Exception e) {
            log.error("OAuth2 로그인 처리 중 오류 발생", e);
            throw new OAuth2AuthenticationException("OAuth2 로그인 처리 중 오류 발생");
        }
    }
    
    private OAuth2User processOAuth2User(OAuth2UserRequest userRequest, OAuth2User oauth2User) {
        String provider = userRequest.getClientRegistration().getRegistrationId();
        String providerId = null;
        String email = null;
        String name = null;
        
        try {
            if (provider.equals("google")) {
                providerId = oauth2User.getAttribute("sub");
                email = oauth2User.getAttribute("email");
                name = oauth2User.getAttribute("name");
            } else if (provider.equals("naver")) {
                Map<String, Object> response = oauth2User.getAttribute("response");
                providerId = (String) response.get("id");
                email = (String) response.get("email");
                name = (String) response.get("name");
            } else {
                throw new OAuth2AuthenticationException("지원하지 않는 소셜 로그인입니다.");
            }

            // null 체크
            if (email == null || name == null) {
                throw new OAuth2AuthenticationException("필수 사용자 정보를 가져오는데 실패했습니다.");
            }
            
            // 사용자 정보 저장 또는 업데이트
            User user = userService.saveOrUpdateOAuth2User(
                provider,
                providerId,
                email,
                name
            );
            
            return new DefaultOAuth2User(
                Collections.singleton(new SimpleGrantedAuthority(user.getUserRole())),
                oauth2User.getAttributes(),
                userRequest.getClientRegistration()
                        .getProviderDetails()
                        .getUserInfoEndpoint()
                        .getUserNameAttributeName()
            );
            
        } catch (Exception e) {
            log.error("OAuth2 로그인 처리 중 오류 발생: {}", e.getMessage());
            throw new OAuth2AuthenticationException("OAuth2 로그인 처리 중 오류가 발생했습니다.");
        }
    }
}