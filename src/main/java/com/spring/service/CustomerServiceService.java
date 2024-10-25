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
}