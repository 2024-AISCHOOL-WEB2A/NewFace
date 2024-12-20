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
                <video autoplay loop muted playsinline class="banner-video">
                    <source src="image/main1.mp4" type="video/mp4">
                </video>
                <div class="banner-text">나만의 이야기를 펼칠 새로운 캐릭터를 만나보세요!</div>
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
            loop: true,
            navigation: {
                nextEl: ".swiper-button-prev",
                prevEl: ".swiper-button-next"
            },
            loopFillGroupWithBlank: true,  // 빈 슬라이드로 그룹을 채움
            speed: 500,  // 슬라이드 속도
            autoplay: {  // 자동 재생 (선택사항)
            delay: 3000,
            disableOnInteraction: false
            }
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
                    <a href="/customerService">
                        <button class="add-button">+</button>
                    </a>
                </div>
                <table class="board-table">
                    <tbody>
                        <c:forEach items="${recentSupports}" var="support">
                            <tr>
                                <td>
                                    <a href="/customerService/detail/${support.customerServiceIdx}">
                                        <!-- 카테고리에 따른 색상 처리 -->
                                        <c:choose>
                                            <c:when test="${support.customerServiceCategory == '0'}">
                                                <span style="color: red;">[공지]</span>
                                            </c:when>
                                            <c:when test="${support.customerServiceCategory == '1'}">
                                                <span style="color: blue;">[FAQ]</span>
                                            </c:when>
                                            <c:when test="${support.customerServiceCategory == '2'}">
                                                <span style="color: green;">[요청]</span>
                                            </c:when>
                                        </c:choose>
                                        ${support.customerServiceTitle}
                                    </a>
                                </td>
                                <td>
                                    <a href="/customerService/detail/${support.customerServiceIdx}">
                                        ${support.formattedDate}
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </section>
        
        
        
    </main>

    <!--footer 위치 -->
    <jsp:include page="common/footer.jsp" />
    
</body>
</html>
