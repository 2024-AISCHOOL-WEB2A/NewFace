package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.repository.BoardRepository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.spring.entity.Board;

@Service
public class BoardService {

    @Autowired
    private BoardRepository boardRepository;

    // 게시글 목록 조회 (최신순)
    @Transactional(readOnly = true)
    public Page<Board> getBoardList(Pageable pageable) {
        return boardRepository.findAllByOrderByBoardUpdatedAtDesc(pageable);
    }
}
