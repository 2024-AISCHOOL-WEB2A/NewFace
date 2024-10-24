package com.spring.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.entity.Characters;
import com.spring.service.CharacterService;

@Controller
public class CharacterController {
    @Autowired
    private CharacterService characterService;
    
    // 메인 캐릭터 페이지 (하츄핑, 뽀로로, 또봇, 코난 표시)
    @GetMapping("/character_intro")
    public String mainCharacters(Model model) {
        List<Characters> mainCharacters = characterService.getMainCharacters();
        model.addAttribute("characters", mainCharacters);
        return "character_intro";
    }
    
    // 카테고리별 캐릭터 페이지 (예: 하츄핑 카테고리의 캐릭터들 표시)
    @GetMapping("/character_intro/{category}")
    public String categoryCharacters(@PathVariable String category, Model model) {
        List<Characters> categoryCharacters = characterService.getCharactersByCategory(category);
        model.addAttribute("characters", categoryCharacters);
        return "character_intro";  
    }

    // AJAX 요청 처리 (카테고리 클릭시 호출)
    @GetMapping("/character_intro/ajax/{category}")
    @ResponseBody
    public List<Characters> getCategoryCharacters(@PathVariable String category) {
        return characterService.getCharactersByCategory(category);
    }

    // 캐릭터 상세 페이지
    @GetMapping("/character_intro/detail/{characterIdx}")
    public String characterDetail(@PathVariable Long characterIdx, Model model) {
        Characters character = characterService.getCharacterDetail(characterIdx);
        model.addAttribute("character", character);
        return "character_intro_detail";    
    }

}
