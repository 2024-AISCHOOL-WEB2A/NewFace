package com.spring.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

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

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_idx")
    private User user; 

     // 날짜 포맷팅을 위한 메서드 추가
    public String getFormattedPaymentDate() {
        if(paymentDate != null) {
            return paymentDate.format(DateTimeFormatter.ofPattern("yyyy.MM.dd HH:mm:ss"));
        }
        return "";
    }

}