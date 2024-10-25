package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.spring.entity.Board;
import com.spring.entity.Characters;
import com.spring.service.BoardService;
import com.spring.service.CharacterService;

@Controller
public class HomeController {

    @Autowired
    private BoardService boardService;
    
    @Autowired
    private CharacterService characterService;

    @GetMapping("/")
    public String home(Model model, 
        @RequestParam(defaultValue = "0") int page) {
        // 게시글 조회 (기존 코드)
        Pageable pageable = PageRequest.of(0, 5);
        Page<Board> boardList = boardService.getBoardList(pageable);
        model.addAttribute("recentBoards", boardList.getContent());

        // 캐릭터 5개 랜덤 조회
        Page<Characters> characters = characterService.getRandomCharacters(page, 5);
        model.addAttribute("characters", characters.getContent());
        model.addAttribute("currentPage", characters.getNumber());
        model.addAttribute("totalPages", characters.getTotalPages());
        
        return "main";
    }
}