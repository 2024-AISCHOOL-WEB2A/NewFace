package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.entity.Board;
import com.spring.entity.Characters;
import com.spring.entity.CustomerService;
import com.spring.service.BoardService;
import com.spring.service.CharacterService;
import com.spring.service.CustomerServiceService;

@Controller
public class HomeController {

    @Autowired
    private BoardService boardService;
    
    @Autowired
    private CharacterService characterService;

    @Autowired
    private CustomerServiceService customerServiceService;

    @GetMapping("/")
    public String home(Model model, 
        @RequestParam(defaultValue = "0") int page) {
        // 게시글 조회 (기존 코드)
        Pageable pageable = PageRequest.of(0, 5);
        Page<Board> boardList = boardService.getBoardList(pageable);
        model.addAttribute("recsentBoards", boardList);

        // 캐릭터 15개 랜덤 조회
        List<Characters> characters = characterService.getRandomCharacters(page, 15);
        model.addAttribute("characters", characters);

        // 고객지원 카테로기별 2개씩 조회
        List<CustomerService> recentSupports = customerServiceService.getRecentPosts();
        model.addAttribute("recentSupports", recentSupports);
        
        return "main";
    }
}