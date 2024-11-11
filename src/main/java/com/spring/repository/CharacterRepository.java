package com.spring.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.spring.entity.Characters;

@Repository
public interface CharacterRepository extends JpaRepository<Characters, Long> {
    // 카테고리별 대표 캐릭터 찾기 (하츄핑, 뽀로로, 또봇, 코난)
    @Query("SELECT c FROM Characters c WHERE c.characterIdx IN (SELECT MIN(ch.characterIdx) FROM Characters ch GROUP BY ch.characterCategory)")
    List<Characters> findAllMainCharacters();
    
    // 특정 카테고리의 모든 캐릭터 찾기 (예: 카테고리 1의 하츄핑,뽀마링,하링,아자링)
    List<Characters> findByCharacterCategory(String category);

    @Query(value = "SELECT * FROM tb_character ORDER BY RAND()", 
        countQuery = "SELECT count(*) FROM tb_character",
        nativeQuery = true)
    List<Characters> findRandomCharacters(Pageable pageable);
}
