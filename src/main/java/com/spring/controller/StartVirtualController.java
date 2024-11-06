package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StartVirtualController {
    // 게임하기 이동
    @GetMapping("/start_virtual")
    public String startController() {
        return "redirect:/index.html";
    }
}
