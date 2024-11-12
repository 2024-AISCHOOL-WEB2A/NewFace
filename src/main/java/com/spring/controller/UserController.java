package com.spring.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    @ResponseBody // AJAX 응답을 위해 필요
    public ResponseEntity<?> join(User user) {
        try {
            userService.join(user);
            return ResponseEntity.ok()
                    .body(Map.of("success", true,
                            "message", "회원가입이 완료되었습니다.",
                            "nickname", user.getUserNickname()));
        } catch (Exception e) {
            return ResponseEntity.badRequest()
                    .body(Map.of("success", false,
                            "message", e.getMessage()));
        }
    }

    @GetMapping("/loginForm")
    public String loginForm() {
        return "login";
    }

    @PostMapping("/login")
    public String login(String userId, String userPw, HttpSession session, Model model) {
        User user = userService.login(userId, userPw);

        if (user != null) {
            // 로그인 성공
            session.setAttribute("loginUser", user);
            return "redirect:/";
        } else {
            // 로그인 실패
            model.addAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.");
            return "redirect:/loginForm";
        }
    }

    @PostMapping("/custom_login")
    public String custom_login(String userId, String userPw,
            HttpSession session,
            RedirectAttributes redirectAttributes) {
        User user = userService.login(userId, userPw);

        if (user != null) {
            // 로그인 성공
            session.setAttribute("loginUser", user);
            return "redirect:/";
        } else {
            // 로그인 실패
            redirectAttributes.addFlashAttribute("loginError", "아이디 또는 비밀번호가 일치하지 않습니다.");
            return "redirect:/loginForm"; // 로그인 폼 페이지로 리다이렉트
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/oauth2/success")
    public String oauth2Success(@AuthenticationPrincipal OAuth2User oauth2User, HttpSession session) {
        if (oauth2User != null) {
            try {
                String email;
                Map<String, Object> attributes = oauth2User.getAttributes();

                if (attributes.get("response") != null) { // 네이버
                    Map<String, Object> response = (Map<String, Object>) attributes.get("response");
                    email = (String) response.get("email");
                } else { // 구글
                    email = oauth2User.getAttribute("email");
                }

                return "redirect:/";
            } catch (Exception e) {
                return "redirect:/loginForm";
            }
        }
        return "redirect:/loginForm";
    }
}