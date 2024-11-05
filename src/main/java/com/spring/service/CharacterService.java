package com.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.spring.entity.Characters;
import com.spring.repository.CharacterRepository;
import com.spring.repository.PointPaymentRepository;

@Service
public class CharacterService {
    @Autowired
    private CharacterRepository characterRepository;

    @Autowired
    private PointPaymentRepository pointPaymentRepository;

    
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

    // 메인 랜덤 조회
    public Page<Characters> getRandomCharacters(int page, int size) {
        PageRequest pageRequest = PageRequest.of(page, size);
        return characterRepository.findRandomCharacters(pageRequest);
    }

    // 캐릭터와 결제 횟수를 함께 조회
    public List<Map<String, Object>> getTopCharactersWithPaymentCount() {
        List<Object[]> characterData = pointPaymentRepository.findTop10CharacterIdxByUsage();
        
        // 캐릭터 ID와 결제 횟수를 기반으로 캐릭터 정보 조회 및 결제 횟수 포함
        return characterData.stream().map(row -> {
            Integer characterIdx = (Integer) row[0];  // Integer로 캐스팅
            Long paymentCount = (Long) row[1];  // Long으로 캐스팅
            
            Characters character = characterRepository.findById(characterIdx.longValue()).orElse(null);

            // 캐릭터 정보와 결제 횟수를 Map으로 담아서 반환
            Map<String, Object> result = new HashMap<>();
            result.put("character", character);
            result.put("paymentCount", paymentCount);

            return result;
        }).toList();
    }

}
