package com.spring.service;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.spring.entity.Board;
import com.spring.repository.BoardRepository;

@Service
public class BoardService {

    @Autowired
    private BoardRepository boardRepository;

    // 게시글 목록 조회 (최신순)
    @Transactional(readOnly = true)
    public Page<Board> getBoardList(Pageable pageable) {
        return boardRepository.findAllByOrderByBoardUpdatedAtDesc(pageable);
    }

    // 파일 저장 메서드: 이미지와 동영상을 저장할 수 있도록 공통 메서드 추가
    private String saveFile(MultipartFile file, String uploadDir) throws IOException {
        String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
        File saveFile = new File(uploadDir, fileName);

        // 경로가 없으면 디렉토리 생성
        if (!saveFile.getParentFile().exists()) {
            saveFile.getParentFile().mkdirs();
        }

        file.transferTo(saveFile);
        
        // 반환되는 경로는 웹에서 접근 가능한 상대 경로로 조정
        return "/uploads/" + uploadDir.substring(uploadDir.lastIndexOf("uploads/") + 8) + "/" + fileName;
    }

    @Transactional
    public Board saveBoard(Board board, MultipartFile file) throws IOException {
        board.setBoardViewCount(0);
        board.setBoardUpdatedAt(new Timestamp(System.currentTimeMillis()));

        if (file != null && !file.isEmpty()) {
            // 모든 파일을 동일한 경로에 저장
            String uploadDir = System.getProperty("user.dir") + "/src/main/resources/static/uploads/images";
            String filePath = saveFile(file, uploadDir);
            System.out.println("File path set in board: " + filePath);
            board.setBoardFilePath(filePath);
        }

        System.out.println("Board details before save: " + board);
        return boardRepository.save(board);
    }

    // 상위 10개의 게시물 조회
    public List<Board> getTop10Posts() {
        return boardRepository.findTop10ByOrderByBoardViewCountDesc();
    }

    //idx별 board 값 가져오기
    public Board findById(Long boardIdx) {
        Optional<Board> boardOptional = boardRepository.findById(boardIdx);
        return boardOptional.orElse(null); // 데이터가 없으면 null 반환
    }
    
}
