package com.spring.service;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import java.io.File;
import java.io.IOException;
import org.springframework.stereotype.Service;
import com.spring.repository.BoardRepository;
import java.util.UUID;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
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

    // 게시글 저장
    @Transactional
    public Board saveBoard(Board board, MultipartFile file) throws IOException {
        // 기본값 설정
        board.setBoardViewCount(0);
        board.setBoardUpdatedAt(new Timestamp(System.currentTimeMillis()));

        // 파일이 있는 경우에만 처리
        if (file != null && !file.isEmpty()) {
            String projectPath = System.getProperty("user.dir") + "/src/main/resources/static/uploads/images";
            String fileName = UUID.randomUUID().toString() + file.getOriginalFilename();

            File saveFile = new File(projectPath, fileName);
            
            // 디렉토리가 없으면 생성
            if (!saveFile.getParentFile().exists()) {
                saveFile.getParentFile().mkdirs();
            }
            
            file.transferTo(saveFile);
            
            // DB에는 웹에서 접근 가능한 경로 저장
            board.setBoardFilePath("/uploads/images/" + fileName);
        }
        
        return boardRepository.save(board);
    }
}
