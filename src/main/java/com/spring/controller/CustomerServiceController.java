package com.spring.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.spring.entity.CustomerService;
import com.spring.service.CustomerServiceService;

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
}