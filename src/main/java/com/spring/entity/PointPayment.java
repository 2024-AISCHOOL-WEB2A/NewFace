package com.spring.entity;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
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
    
    @Column(name = "user_idx", insertable = false, updatable = false)
    private int userIdx;

    @Column(name = "rental_end_date")
    private LocalDateTime rentalEndDate;

    @Column(name = "rental_status", length = 20)
    private String rentalStatus;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_idx")
    private User user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "character_idx", insertable = false, updatable = false)
    private Characters character;

    @Transient
    private int totalPoints;

    public int getTotalPoints() {
        return totalPoints;
    }

    public void setTotalPoints(int totalPoints) {
        this.totalPoints = totalPoints;
    }

    public String getFormattedPointDate() {
        if(pointDate != null) {
            return pointDate.format(DateTimeFormatter.ofPattern("yyyy.MM.dd HH:mm:ss"));
        }
        return "";
    }

    public String getFormattedRentalEndDate() {
        if(rentalEndDate != null) {
            return rentalEndDate.format(DateTimeFormatter.ofPattern("yyyy.MM.dd HH:mm:ss"));
        }
        return "";
    }
}