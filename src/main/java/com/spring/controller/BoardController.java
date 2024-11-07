package com.spring.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.entity.Board;
import com.spring.entity.User;
import com.spring.service.BoardService;

import jakarta.servlet.http.HttpSession;

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
                            @RequestParam(value = "file", required = false) MultipartFile imageFile,
                            @RequestParam(value = "videoFile", required = false) MultipartFile videoFile,
                            HttpSession session) throws IOException {
        
        User loginUser = (User) session.getAttribute("loginUser");
        
        if (loginUser == null) {
            return "redirect:/loginForm";
        }
        
        Board board = new Board();
        board.setBoardTitle(title);
        board.setBoardContent(content);
        board.setUser(loginUser);
        
        // 이미지 파일이 있으면 이미지 저장
        if (imageFile != null && !imageFile.isEmpty()) {
            boardService.saveBoard(board, imageFile);
        }
        // 동영상 파일이 있으면 동영상 저장
        else if (videoFile != null && !videoFile.isEmpty()) {
            boardService.saveBoard(board, videoFile);
        }
        
        return "redirect:/pride_board";
    }

    @GetMapping("/detail/{boardIdx}")
    public String showDetail(@PathVariable Long boardIdx, Model model) {
        // boardIdx를 사용해 필요한 데이터를 조회
        // 예: PrideBoard board = boardService.findById(boardIdx);

        System.out.println("detail =-------------------------");
        System.out.println("boardIdx :" + boardIdx);
        // 조회한 데이터를 모델에 추가
        model.addAttribute("boardIdx", boardIdx);
        // model.addAttribute("board", board);  // 필요한 경우, 조회한 데이터도 추가 가능

        return "shorts-detail"; // shorts-detail.jsp로 이동
    }

}
