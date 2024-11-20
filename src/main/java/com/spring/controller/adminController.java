package com.spring.controller;

import java.util.List;
import java.util.Map;

import org.hibernate.query.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.entity.Board;
import com.spring.entity.CustomerService;
import com.spring.entity.User;
import com.spring.repository.CustomerServiceRepository;
import com.spring.service.BoardService;
import com.spring.service.CharacterService;
import com.spring.service.UserService;


@Controller
public class adminController {

    @Autowired
    private CharacterService characterService;

    @Autowired
    private BoardService boardService;

    @Autowired
    private CustomerServiceRepository customerServiceRepository;

    @Autowired
    private UserService userService;
    
    @GetMapping("/admin")
    public String admin(Model model) {

        List<Map<String, Object>> topCharacters = characterService.getTopCharactersWithPaymentCount();
        List<Board> top5Posts = boardService.getTop10Posts();
        List<CustomerService> notices = customerServiceRepository.findByCustomerServiceCategory("공지");
        List<CustomerService> faqs = customerServiceRepository.findByCustomerServiceCategory("FAQ");
        List<CustomerService> requests = customerServiceRepository.findByCustomerServiceCategory("요청");

        model.addAttribute("topCharacters", topCharacters);
        model.addAttribute("top5Posts", top5Posts);
        model.addAttribute("notices", notices);
        model.addAttribute("faqs", faqs);
        model.addAttribute("requests", requests);
        model.addAttribute("currentMenu", "dashboard");
        
        return "admin";
    }
    
    @GetMapping("/user-list")
    public String getUserList(  @RequestParam(defaultValue = "1") int page, Model model) {

         // 페이지당 표시할 항목 수
         int pageSize = 10;
        
         // 전체 사용자 목록 조회
         List<User> allUsers = userService.getAllUsers();
         int totalUsers = allUsers.size();
         
         // 전체 페이지 수 계산
         int totalPages = (int) Math.ceil((double) totalUsers / pageSize);
         
         // 현재 페이지 유효성 검사
         if (page < 1) page = 1;
         if (page > totalPages) page = totalPages;
         
         // 페이지의 시작과 끝 인덱스 계산
         int start = (page - 1) * pageSize;
         int end = Math.min(start + pageSize, totalUsers);
         
         // 인덱스 유효성 검사
         if (start < 0) start = 0;
         if (end > totalUsers) end = totalUsers;
         if (start >= totalUsers) {
             start = Math.max(0, totalUsers - pageSize);
             end = totalUsers;
         }

         // 현재 페이지의 사용자 목록
        List<User> currentUsers = allUsers.subList(start, end);
                                    
        model.addAttribute("users", currentUsers);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages",Math.max(1, totalPages));
        model.addAttribute("currentMenu", "user-list");
                                    
        return "admin-user-list";  
    
    }
}
