package com.spring.controller;

import java.time.LocalDateTime;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.spring.entity.CustomerService;
import com.spring.entity.User;
import com.spring.service.CustomerServiceService;

import jakarta.servlet.http.HttpSession;

@Controller
public class CustomerServiceController {
    
    @Autowired
    private CustomerServiceService customerServiceService;

   
    
    @GetMapping("/customerService")
    public String customerService(@RequestParam(required = false) String category, Model model) {
        List<CustomerService> posts;
        
        if (category != null && !category.isEmpty()) {
            // 카테고리별 조회
            posts = customerServiceService.getPostsByCategory(category);
        } else {
            // 전체 조회
            posts = customerServiceService.getAllPosts();
        }
        
        model.addAttribute("posts", posts);
        return "customerService";
    }

    @GetMapping("/goservice_detail")
    public String goservice_detail() {
        return "customerService_detail";
    }

    @GetMapping("/customerService/write")
    public String customerService_register(Model model, HttpSession session) {
        User loginUser = (User) session.getAttribute("loginUser");
        
        if (loginUser != null) {
            model.addAttribute("userId", loginUser.getUserId());
            model.addAttribute("userNickname", loginUser.getUserNickname());
            return "customerService_register";
        }
        
        return "redirect:/loginForm";
    }

    @PostMapping("/customerService/register")
    public String registerPost(@RequestParam String title,
                         @RequestParam String content,
                         @RequestParam String category,
                         HttpSession session) {
        
        User loginUser = (User) session.getAttribute("loginUser");
      
        

        if (loginUser != null) {
            CustomerService post = new CustomerService();
            post.setCustomerServiceTitle(title);
            post.setCustomerServiceContent(content);
            post.setCustomerServiceCategory(category);
            post.setCustomerServiceDate(LocalDateTime.now());
            post.setUserIdx(loginUser.getUserIdx());
            post.setCustomerServiceComment("");
            
            customerServiceService.savePost(post);
            return "redirect:/customerService";
        }
        
        return "redirect:/loginForm";
    }
}
