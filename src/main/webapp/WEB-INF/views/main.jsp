<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main Page</title>
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/main.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
</head>
<body class="main-body">
    <!--header 위치 -->
    <jsp:include page="common/header.jsp" />

    <!-- 메인 화면 위치 -->
    <main class="main-content">
        <section class="main-banner">
            <div class="character-banner">
                <img src="image/main_start.png" alt="캐릭터 선택 이미지" class="banner-image">
                <div class="banner-text">지금 당신이 좋아하는 캐릭터를 고르세요!!</div>
                <a href="#" class="start-btn">시작하기 ➔</a>
            </div>
        </section>
        
        <!-- 도감 요약-->
        <section class="character-gallery">
            <div class="gallery-header">
                <h2 class="gallery-title">캐릭터 도감</h2>
                <a href="/character_intro">
                    <button class="add-button">+</button>
                </a>
            </div>
            
            <div class="gallery-wrapper">
                <div class="swiper characterSwiper">
                    <div class="swiper-wrapper">
                        <c:forEach items="${characters}" var="character">
                            <div class="swiper-slide">
                                <div class="card">
                                    <a href="/character_intro/detail/${character.characterIdx}">
                                        <img src="${character.characterImage}" alt="${character.characterName}">
                                        <span>${character.characterName}</span>
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <!-- Swiper 기본 네비게이션 버튼으로 변경 -->
                    <div class="swiper-button-prev">
                        <img src="image/left-arrow.png" alt="Previous">
                    </div>
                    <div class="swiper-button-next">
                        <img src="image/right-arrow.png" alt="Next">
                    </div>
                </div>
            </div>
        </section>

        <!-- Swiper 초기화 스크립트 -->
        <script>
        var swiper = new Swiper(".characterSwiper", {
            slidesPerView: 5,
            spaceBetween: -50,
            centeredSlides: true,
            slidesPerGroup: 2,  // 한 번씩 슬라이드 되도록 수정
            loop: true,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev"
            },
        });
        </script>

        <!-- board 요약-->
        <section class="boards">
            <!-- 자랑 게시판-->
            <div class="board pride-board">
                <div class="board-header">
                    <h3 class="board-title">자랑 게시판</h3>
                    <hr class="board-line">
                    <a href = "/pride_board">
                        <button class="add-button">+</button>
                    </a>
                </div>
                <table class="board-table">
                    <tbody>
                        <!-- tr 태그 반복-->
                        <c:forEach items="${recentBoards}" var="board">
                            <tr>
                                <td><a href="/pride_board/detail/${board.boardIdx}">${board.boardTitle}</a></td>
                                <td><a href="/pride_board/detail/${board.boardIdx}">
                                    <fmt:formatDate value="${board.boardUpdatedAt}" pattern="yyyy-MM-dd"/>
                                </a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <!--고객 지원 게시판-->
            <div class="board support-board">
                <div class="board-header">
                    <h3 class="board-title">고객 지원</h3>
                    <hr class="board-line">
                    <button class="add-button">+</button>
                </div>
                <table class="board-table">
                    <tbody>
                        <!-- tr 태그 반복-->
                        <tr>
                            <td><a href="#">공지 자랑 게시판 이용 안내 및 규칙</a></td>
                            <td><a href="#">2024-10-22</a></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
        
        
        
    </main>

    <!--footer 위치 -->
    <jsp:include page="common/footer.jsp" />
    
</body>
</html>
