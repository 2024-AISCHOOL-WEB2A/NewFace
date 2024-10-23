package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import com.spring.entity.Board;
import com.spring.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

    @Autowired
    private BoardService boardService;

    @GetMapping("")
    public String boardList(Model model, 
    @RequestParam(defaultValue = "0") int page,
     @RequestParam(defaultValue = "11") int size) {
        
        Pageable pageable = PageRequest.of(page, size);
        Page<Board> boardList = boardService.getBoardList(pageable);
        
        model.addAttribute("boards", boardList.getContent());  // List<Board>로 전달
        model.addAttribute("totalPages", boardList.getTotalPages());
        model.addAttribute("currentPage", boardList.getNumber());
        model.addAttribute("isFirst", boardList.isFirst());
        model.addAttribute("isLast", boardList.isLast());
        
        return "board";
    }

}
