package com.spring.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "contest")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Contest {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "contest_idx")
    private Long contestIdx;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_idx")
    private User user;

    @Column(name = "contest_title")
    private String contestTitle;

    @Column(name = "contest_image_url")
    private String contestImageUrl;

    @Column(name = "contest_content")
    private String contestContent;

    @Column(name = "contest_updated_at")
    private LocalDateTime contestUpdatedAt;

    @OneToMany(mappedBy = "contest", fetch = FetchType.LAZY)
    private List<ContestLikes> contestLikes;

    public Integer getContestLikesCount() {
        return contestLikes != null && !contestLikes.isEmpty() 
               ? contestLikes.get(0).getContestLikesCount() 
               : 0;
    }
}
