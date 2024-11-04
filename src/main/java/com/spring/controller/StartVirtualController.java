package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class StartVirtualController {
    @GetMapping("/start_virtual")
    public String getMethodName() {
        return "redirect:/index.html";
    }
    
}
