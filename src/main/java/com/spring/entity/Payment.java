package com.spring.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "tb_payment")
public class Payment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "payment_idx")
    private int paymentIdx;
    
    @Column(name = "payment_date", nullable = false)
    private LocalDateTime paymentDate;
    
    @Column(name = "payment_content", nullable = false, length = 50)
    private String paymentContent;
    
    @Column(name = "user_idx", insertable = false, updatable = false)
    private int userIdx;

    @ManyToOne
    @JoinColumn(name = "user_idx")
    private User user; 
}