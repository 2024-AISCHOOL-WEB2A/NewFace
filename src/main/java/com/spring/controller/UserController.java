package com.spring.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.security.core.annotation.AuthenticationPrincipal;
// import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import com.spring.entity.User;
import com.spring.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
    
    @Autowired
    private UserService userService;

    @GetMapping("/joinForm")
    public String joinForm() {
        return "join";
    }

    // 아이디 중복 체크
    @ResponseBody
    @GetMapping("/checkId")
    public boolean checkId(@RequestParam String userId) {
        return !userService.checkUserIdDuplicate(userId);
    }

    // 이메일 중복 체크
    @ResponseBody
    @GetMapping("/checkEmail")
    public boolean checkEmail(@RequestParam String userEmail) {
        return !userService.checkUserEmailDuplicate(userEmail);
    }

    // 회원가입 처리
    @PostMapping("/join")
    public String join(User user, Model model) {
        try {
            userService.join(user);
            model.addAttribute("message", "회원가입이 완료되었습니다.");
            return "redirect:/loginForm";
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            return "redirect:/joinForm";
        }
    }

    @GetMapping("/loginForm")
    public String loginForm() {
        return "login";
    }

    @PostMapping("/login")
    public String login(String userId, String userPw, HttpSession session, Model model) {
        User user = userService.login(userId, userPw);
        
        if(user != null) {
            // 로그인 성공
            session.setAttribute("loginUser", user);
            return "redirect:/";
        } else {
            // 로그인 실패
            model.addAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.");
            return "redirect:/loginForm";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    // @GetMapping("/oauth2/success") 소셜로그인 관련
    // public String oauth2Success(@AuthenticationPrincipal OAuth2User oauth2User, HttpSession session) {
    //     if (oauth2User != null) {
    //         try {
    //             String email;
    //             Map<String, Object> attributes = oauth2User.getAttributes();
                
    //             if (attributes.get("response") != null) {  // 네이버
    //                 Map<String, Object> response = (Map<String, Object>) attributes.get("response");
    //                 email = (String) response.get("email");
    //             } else {  // 구글
    //                 email = oauth2User.getAttribute("email");
    //             }
                
    //             return "redirect:/";
    //         } catch (Exception e) {
    //             return "redirect:/loginForm";
    //         }
    //     }
    //     return "redirect:/loginForm";
    // }
}