package com.spring.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.spring.entity.Board;

@Repository
public interface BoardRepository extends JpaRepository<Board, Long> {
    // 게시글 최신순 정렬
    Page<Board> findAllByOrderByBoardUpdatedAtDesc(Pageable pageable);

    // 상위 10개의 게시물을 조회하는 쿼리
    @Query(value = "SELECT * FROM tb_board ORDER BY board_view_count DESC LIMIT 10", nativeQuery = true)
    List<Board> findTop10ByOrderByBoardViewCountDesc();
}