package com.spring.repository;

import com.spring.entity.Board;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BoardRepository extends JpaRepository<Board, Long> {
    // 게시글 최신순 정렬
    Page<Board> findAllByOrderByBoardUpdatedAtDesc(Pageable pageable);
}