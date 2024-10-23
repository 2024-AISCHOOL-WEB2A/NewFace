package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import java.util.Map;

@Controller
public class PaymentController {
    
    @GetMapping("/payment")
    public String payment() {
        return "Payment";
    }

    @PostMapping("/payment/complete")
    @ResponseBody
    public String paymentComplete(@RequestParam Map<String, String> paymentInfo) {
        return "success";
    }
}