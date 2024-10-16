package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageController {

    @GetMapping("/index")
    public String index() {
        return "index";  // index.jsp 또는 index.html로 이동
    }

    @GetMapping("/start_virtual")
    public String startVirtual() {
        return "start_virtual";  // start_virtual.jsp 또는 start_virtual.html로 이동
    }

    @GetMapping("/shorts")
    public String shorts() {
        return "shorts";  // shorts.jsp 또는 shorts.html로 이동
    }

    @GetMapping("/contest")
    public String contest() {
        return "contest";  // contest.jsp 또는 contest.html로 이동
    }

    @GetMapping("/shorts-writer")
    public String shorts_writer() {
        return "shorts-writer";  // contest.jsp 또는 contest.html로 이동
    }
}
