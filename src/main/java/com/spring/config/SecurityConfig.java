package com.spring.config;

import java.util.Map;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.web.SecurityFilterChain;

import com.spring.entity.User;
import com.spring.service.CustomOAuth2UserService;
import com.spring.service.UserService;

import lombok.RequiredArgsConstructor;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig {

    
    private final CustomOAuth2UserService customOAuth2UserService;
    private final UserService userService;
    
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            .csrf(csrf -> csrf.disable())
            .authorizeHttpRequests(authorize -> authorize
                .requestMatchers("/user/updateProfile").authenticated()  
                .requestMatchers("/user/delete").authenticated() 
                .requestMatchers("/**").permitAll()
            )
            .formLogin(formLogin -> formLogin
                .loginPage("/loginForm")
                .loginProcessingUrl("/login")
                .defaultSuccessUrl("/")
                .failureUrl("/loginForm?error=true")
                .permitAll()
            )
            .oauth2Login(oauth2 -> oauth2
                .loginPage("/loginForm")
                .defaultSuccessUrl("/")
                .userInfoEndpoint(userInfo -> userInfo
                    .userService(customOAuth2UserService)
                )
                .successHandler((request, response, authentication) -> {
                    // OAuth2 로그인 성공 시 세션에 사용자 정보 저장
                    OAuth2User oauth2User = (OAuth2User) authentication.getPrincipal();
                    String email = null;

                    if (oauth2User.getAttribute("response") != null) {
                        // 네이버 로그인
                        Map<String, Object> naverResponse = oauth2User.getAttribute("response");
                        email = (String) naverResponse.get("email");
                        System.out.println("Naver email: " + email);
                    } else {
                        // 구글 로그인
                        email = oauth2User.getAttribute("email");
                        System.out.println("Google email: " + email);
                    }
            
                    User user = userService.findByUserEmail(email);
                    request.getSession().setAttribute("loginUser", user);
                    response.sendRedirect("/");
                })
            )
            .logout(logout -> logout
                .logoutSuccessUrl("/")
                .invalidateHttpSession(true)  // 세션 무효화
                .deleteCookies("JSESSIONID")  // 쿠키 삭제
            );
            
        return http.build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}