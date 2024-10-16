package com.spring.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.time.LocalDateTime;

import java.util.List; // 올바른 List import

@Entity
@Table(name = "shorts")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Shorts {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "shorts_idx")
    private Long shortsIdx;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_idx")
    private User user;

    @Column(name = "shorts_title")
    private String shortsTitle;

    @Column(name = "shorts_video_url")
    private String shortsVideoUrl;

    @Column(name = "shorts_content")
    private String shortsContent;

    @Column(name = "shorts_updated_at")
    private LocalDateTime shortsUpdatedAt;

    @OneToMany(mappedBy = "shorts", fetch = FetchType.LAZY)
    private List<ShortsLikes> shortsLikes;

    public Integer getShortsViewCount() {
        return shortsLikes != null && !shortsLikes.isEmpty() 
               ? shortsLikes.get(0).getShortsViewCount() 
               : 0;
    }
}