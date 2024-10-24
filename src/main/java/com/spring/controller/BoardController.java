package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import java.io.IOException;

import com.spring.entity.Board;
import com.spring.entity.User;
import com.spring.service.BoardService;

import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequestMapping("/pride_board")
public class BoardController {

    @Autowired
    private BoardService boardService;

    @GetMapping("")
    public String boardList(Model model, 
        @RequestParam(defaultValue = "0") int page,
        @RequestParam(defaultValue = "10") int size) {
        
        Pageable pageable = PageRequest.of(page, size);
        Page<Board> boardList = boardService.getBoardList(pageable);
        
        model.addAttribute("boards", boardList.getContent());  // List<Board>로 전달
        model.addAttribute("totalPages", boardList.getTotalPages());
        model.addAttribute("currentPage", boardList.getNumber());
        model.addAttribute("isFirst", boardList.isFirst());
        model.addAttribute("isLast", boardList.isLast());
        
        return "pride_board";
    }

    // 등록 페이지로 이동하는 매핑 추가
    @GetMapping("/register")
    public String boardRegister() {
        return "pride_board_register";
    }

    @PostMapping("/save")
    public String saveBoard(@RequestParam("title") String title,
                            @RequestParam("content") String content,
                            @RequestParam(value = "file", required = false) MultipartFile file,
                            HttpSession session) throws IOException {
        
        User loginUser = (User) session.getAttribute("loginUser");
        
        if(loginUser == null) {
            return "redirect:/loginForm";
        }
        
        Board board = new Board();
        board.setBoardTitle(title);
        board.setBoardContent(content);
        board.setUser(loginUser);
        
        boardService.saveBoard(board, file);
        
        return "redirect:/pride_board";
    }

}
