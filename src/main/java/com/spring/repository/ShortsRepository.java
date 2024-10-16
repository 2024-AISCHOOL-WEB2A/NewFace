package com.spring.repository;

import com.spring.entity.Shorts;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ShortsRepository extends JpaRepository<Shorts, Long> {

    @Query("SELECT s FROM Shorts s LEFT JOIN s.shortsLikes sl GROUP BY s ORDER BY COALESCE(MAX(sl.shortsViewCount), 0) DESC")
    Page<Shorts> findAllOrderByViewCountDesc(Pageable pageable);
}
