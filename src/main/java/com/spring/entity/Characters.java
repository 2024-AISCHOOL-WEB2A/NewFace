package com.spring.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "tb_character")
@Data
@NoArgsConstructor
public class Characters {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "character_idx")
    private Long characterIdx;

    @Column(name = "character_category", nullable = false)
    private String characterCategory;

    @Column(name = "character_name", nullable = false)
    private String characterName;

    @Column(name = "character_image", nullable = false)
    private String characterImage;

    @Column(name = "character_des", nullable = false, columnDefinition = "TEXT")
    private String characterDescription;

    @Column(name = "character_gender", nullable = false, length = 1)
    private String characterGender;

    @Column(name = "character_likes", nullable = false)
    private String characterLikes;

    @Column(name = "character_nolike", nullable = false)
    private String characterNolike;

    @Column(name = "character_color", nullable = false)
    private String characterColor;

    @Column(name = "character_price", nullable = false)
    private Integer characterPrice;
}


