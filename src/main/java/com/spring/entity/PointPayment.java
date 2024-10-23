package com.spring.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "tb_point_payment")
public class PointPayment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "point_idx")
    private int pointIdx;
    
    @Column(name = "character_idx", nullable = false)
    private int characterIdx;
    
    @Column(name = "point_date", nullable = false)
    private LocalDateTime pointDate;
    
    @Column(name = "point_amount", nullable = false)
    private int pointAmount;
    
    @Column(name = "user_idx", nullable = false)
    private int userIdx;

    @ManyToOne
    @JoinColumn(name = "character_idx", referencedColumnName = "character_idx", insertable = false, updatable = false)
    private Characters character;

    @ManyToOne
    @JoinColumn(name = "user_idx", referencedColumnName = "user_idx", insertable = false, updatable = false)
    private User user;
}