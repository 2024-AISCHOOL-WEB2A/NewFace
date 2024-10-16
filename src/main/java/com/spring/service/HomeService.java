package com.spring.service;

import com.spring.entity.Contest;
import com.spring.entity.Shorts;
import com.spring.repository.ContestRepository;
import com.spring.repository.ShortsRepository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class HomeService {

    @Autowired
    private ShortsRepository shortsRepository;

    @Autowired
    private ContestRepository contestRepository;

    public Page<Shorts> getPopularShorts(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return shortsRepository.findAllOrderByViewCountDesc(pageable);
    }

    public List<Contest> getTopThreeContests() {
        Pageable pageable = PageRequest.of(0, 3);
        return contestRepository.findTop3ByOrderByContestLikesCountDesc(pageable);
    }

    // 필요한 경우 다른 메인 페이지 관련 메서드들...
}