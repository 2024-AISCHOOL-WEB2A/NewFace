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

   // 메인_공지 카테고리별로 2개씩 조회
   @Query(value = "SELECT * FROM ( " +
               "   SELECT *, ROW_NUMBER() OVER(PARTITION BY customer_service_category ORDER BY customer_service_date DESC) AS rn " +
               "   FROM tb_customer_service " +
               ") AS numbered " +
               "WHERE rn <= 2",
      nativeQuery = true)
      List<CustomerService> findTop2ByCategory();     

   // 카테고리로 고객 서비스 항목 검색
   List<CustomerService> findByCustomerServiceCategory(String customerServiceCategory);

}
