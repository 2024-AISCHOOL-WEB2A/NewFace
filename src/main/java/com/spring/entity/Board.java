package com.spring.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "tb_board")
@Data
@NoArgsConstructor
public class Board {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "board_idx")
    private Long boardIdx;

    @ManyToOne
    @JoinColumn(name = "user_idx", nullable = false)
    private User user;

    @Column(name = "board_title", nullable = false, length = 1500)
    private String boardTitle;

    @Column(name = "board_file_path", nullable = false, length = 1000)
    private String boardFilePath;

    @Column(name = "board_content", nullable = false, columnDefinition = "TEXT")
    private String boardContent;

    @Column(name = "board_view_count", nullable = false)
    private Integer boardViewCount;

    @Column(name = "board_updated_at", nullable = false)
    private java.sql.Timestamp boardUpdatedAt;
}
