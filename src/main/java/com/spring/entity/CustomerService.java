package com.spring.entity;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "tb_customer_service")
public class CustomerService {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "customer_service_idx")
    private int customerServiceIdx;
    
    @Column(name = "customer_service_category", length = 50)
    private String customerServiceCategory;  // 공지/FAQ/일반
    
    @Column(name = "customer_service_title", length = 50)
    private String customerServiceTitle;
    
    @Column(name = "customer_service_content", columnDefinition = "TEXT")
    private String customerServiceContent;
    
    @Column(name = "customer_service_date")
    private LocalDateTime customerServiceDate;
    
    @Column(name = "user_idx")
    private Integer userIdx;
    
    @Column(name = "customer_service_comment", nullable = true)
    private String customerServiceComment;

    @Column(name = "customer_service_summary", nullable = true, length = 500)
    private String customerServiceSummary;

    // 날짜 포맷팅을 위한 메서드
    public String getFormattedDate() {
        return customerServiceDate.format(DateTimeFormatter.ofPattern("yyyy.MM.dd HH:mm"));
    }
}