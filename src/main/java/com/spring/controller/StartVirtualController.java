package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.entity.PointPayment;
import com.spring.entity.User;
import com.spring.service.PointPaymentService;

import jakarta.servlet.http.HttpSession;

@Controller
public class StartVirtualController {

    @Autowired
    private PointPaymentService pointPaymentService;  

    // 게임하기 이동
    @GetMapping("/start_virtual")
    public String startController(Model model, HttpSession session) {
        User loginUser = (User) session.getAttribute("loginUser");
        if(loginUser != null){
            int userIdx = loginUser.getUserIdx();
            PointPayment activeRental = pointPaymentService.getActiveRental(userIdx, 14);
            if(activeRental != null){
                model.addAttribute("rentalStatus", activeRental.getCharacterIdx());
                System.out.println(model);
            }
        }
        return "index";
    }
}
