package com.spring.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.entity.Board;
import com.spring.entity.CustomerService;
import com.spring.repository.CustomerServiceRepository;
import com.spring.service.BoardService;
import com.spring.service.CharacterService;


@Controller
public class adminController {

    @Autowired
    private CharacterService characterService;

    @Autowired
    private BoardService boardService;

    @Autowired
    private CustomerServiceRepository customerServiceRepository;
    
    @GetMapping("/admin")
    public String admin(Model model) {

        List<Map<String, Object>> topCharacters = characterService.getTopCharactersWithPaymentCount();
        List<Board> top5Posts = boardService.getTop10Posts();
        List<CustomerService> notices = customerServiceRepository.findByCustomerServiceCategory("공지");
        List<CustomerService> faqs = customerServiceRepository.findByCustomerServiceCategory("FAQ");
        List<CustomerService> requests = customerServiceRepository.findByCustomerServiceCategory("요청");

        System.out.println(notices.toString());
        System.out.println(faqs.toString());
        System.out.println(requests.toString());


        model.addAttribute("topCharacters", topCharacters);
        model.addAttribute("top5Posts", top5Posts);
        model.addAttribute("notices", notices);
        model.addAttribute("faqs", faqs);
        model.addAttribute("requests", requests);
        
        return "admin";
    }
    
    
}
