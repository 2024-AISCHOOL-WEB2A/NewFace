package com.spring.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.entity.CustomerService;
import com.spring.repository.CustomerServiceRepository;


@Service
public class CustomerServiceService {
    
    @Autowired
    private CustomerServiceRepository customerServiceRepository;
    
    public List<CustomerService> getAllPosts() {
        return customerServiceRepository.findAllByOrderByCustomerServiceDateDesc();
    }
    
    public List<CustomerService> getPostsByCategory(String category) {
        return customerServiceRepository.findByCustomerServiceCategoryOrderByCustomerServiceDateDesc(category);
    }

    // 메인_최신 5개 조회
    public List<CustomerService> getRecentPosts() {
        return customerServiceRepository.findTop2ByCategory();
    }

    // 카테고리별 고객 서비스 항목 가져오기
    public List<CustomerService> getNoticesByCategory(String category) {
        return customerServiceRepository.findByCustomerServiceCategory(category);
    }

     // 게시글 저장 메서드 추가
    public CustomerService savePost(CustomerService post) {
        return customerServiceRepository.save(post);
    }
}