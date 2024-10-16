package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.spring.entity.User;

import com.spring.service.UserService;

import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



@Controller
public class UserController {

    @Autowired
    private UserService userservice;
   
    @GetMapping("/joinForm")
    public String joinForm() {
        return "join";
    }
   
    @PostMapping("/join")
    public String join(@ModelAttribute User user, RedirectAttributes redirectAttributes) {
        try {
            userservice.join(user);
            return "redirect:/login";
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "회원가입 중 오류가 발생했습니다: " + e.getMessage());
            return "login";  
        }
    }

    @GetMapping("/loginForm")
    public String loginForm() {
    return "login"; 
    }


    @PostMapping("/login")
    public String login(@RequestParam("userId") String userId, 
                        @RequestParam("userPw") String userPw, 
                        HttpSession session, 
                        RedirectAttributes redirectAttributes) {
        User user = new User();
        user.setUserId(userId);
        user.setUserPw(userPw);
        
        if (userservice.login(user)) {
            User loggedInUser = userservice.getUserByUserId(userId);
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("userNickname", loggedInUser.getUserNickname());
            return "redirect:/";
        } else {
            redirectAttributes.addFlashAttribute("loginError", "아이디 또는 비밀번호가 잘못되었습니다.");
            return "redirect:/loginForm";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
    
    
}







   
    



