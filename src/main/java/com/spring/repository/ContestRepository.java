package com.spring.repository;

import com.spring.entity.Contest;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ContestRepository extends JpaRepository<Contest, Long> {

    @Query("SELECT c FROM Contest c LEFT JOIN c.contestLikes cl GROUP BY c ORDER BY COALESCE(SUM(cl.contestLikesCount), 0) DESC")
    Page<Contest> findAllOrderByLikesCountDesc(Pageable pageable);

    @Query("SELECT c FROM Contest c LEFT JOIN c.contestLikes cl GROUP BY c ORDER BY COALESCE(SUM(cl.contestLikesCount), 0) DESC")
    List<Contest> findTop3ByOrderByContestLikesCountDesc(Pageable pageable);
}
