package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;  // 이 줄을 추가하세요
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.entity.Contest;
import com.spring.entity.Shorts;
import com.spring.service.HomeService;

@Controller
public class HomeController {

    @Autowired
    private HomeService homeService;

    @GetMapping("/")
    public String home(@RequestParam(defaultValue = "0") int page, 
                       @RequestParam(defaultValue = "5") int size, 
                       Model model) {
        Page<Shorts> popularShorts = homeService.getPopularShorts(page, size);
        List<Contest> topContests = homeService.getTopThreeContests();
        
        model.addAttribute("popularShorts", popularShorts.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", popularShorts.getTotalPages());
        model.addAttribute("topContests", topContests);
        
        return "index";
    }

}