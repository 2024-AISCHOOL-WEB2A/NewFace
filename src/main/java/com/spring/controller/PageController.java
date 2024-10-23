package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;




@Controller
public class PageController {
    
    // 캐릭터 소개 게시판으로 이동
    @GetMapping("character_intro")
    public String character_intro() {
        return "character_intro";
    }

    // 캐릭서 소개 상세 페이지로 이동
    @GetMapping("character_intro_detail")
    public String character_intro_detail() {
        return "character_intro_detail";
    }
    

    // 자랑 게시판
    @GetMapping("pride_board")
    public String pride_board() {
        return "pride_board";
    }
    


    // 고객 지원 
    @GetMapping("support")
    public String support() {
        return "support";
    }
    
}
