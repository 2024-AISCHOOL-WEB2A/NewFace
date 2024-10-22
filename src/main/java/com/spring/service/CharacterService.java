package com.spring.service;

import java.util.List;

import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.entity.Characters;
import com.spring.repository.CharacterRepository;

@Service
public class CharacterService {
    @Autowired
    private CharacterRepository characterRepository;
    
    // 메인 화면의 대표 캐릭터들 조회 (하츄핑, 뽀로로, 또봇, 코난)
    public List<Characters> getMainCharacters() {
        return characterRepository.findAllMainCharacters();
    }
    
    // 특정 카테고리의 캐릭터들 조회 (예: 카테고리 1번의 하츄핑,뽀마링,하링,아자링)
    public List<Characters> getCharactersByCategory(String category) {
        return characterRepository.findByCharacterCategory(category);
    }

    // 캐릭터 상세 정보 조회
    public Characters getCharacterDetail(Long characterIdx) {
        Optional<Characters> character = characterRepository.findById(characterIdx);  // optional → null일 수 있는 상황을 처리하는 wrapper 클래스
        if(character.isPresent()) {
            return character.get();
        } else {
            throw new RuntimeException("Character not found");
        }
    }

}
