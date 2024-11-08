package com.spring.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.spring.entity.CustomerService;


@Repository
public interface CustomerServiceRepository extends JpaRepository<CustomerService, Integer> {
   // 날짜 역순으로 전체 조회
   @Query("SELECT c FROM CustomerService c ORDER BY c.customerServiceDate DESC")
   List<CustomerService> findAllByOrderByCustomerServiceDateDesc();

   // 카테고리별로 날짜 역순 조회
   @Query("SELECT c FROM CustomerService c WHERE c.customerServiceCategory = :category ORDER BY c.customerServiceDate DESC")
   List<CustomerService> findByCustomerServiceCategoryOrderByCustomerServiceDateDesc(
         @Param("category") String category);

   // 메인_최신 5개 조회
   @Query("SELECT c FROM CustomerService c ORDER BY c.customerServiceDate DESC LIMIT 5")
   List<CustomerService> findTop5ByOrderByCustomerServiceDateDesc();

   // 카테고리로 고객 서비스 항목 검색
   List<CustomerService> findByCustomerServiceCategory(String customerServiceCategory);

}
