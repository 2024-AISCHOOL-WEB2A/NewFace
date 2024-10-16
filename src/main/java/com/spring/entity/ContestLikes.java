package com.spring.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "contest_likes")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ContestLikes {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "contest_likes_idx")
    private Long contestLikesIdx;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_idx")
    private User user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "contest_idx")
    private Contest contest;

    @Column(name = "contest_likes_count")
    private Integer contestLikesCount = 1;
}
