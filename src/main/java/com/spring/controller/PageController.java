package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;




@Controller
public class PageController {
    
    // 고객 지원 
    @GetMapping("support")
    public String support() {
        return "support";
    }
    
}
