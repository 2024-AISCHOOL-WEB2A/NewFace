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
                <hr class="title-line"> <!-- 타이틀과 선 -->
                <button class="add-button">+</button> <!-- 오른쪽 끝의 + 버튼 -->
            </div>
            
            <div class="gallery-wrapper">
                <div class="gallery">
                    <!-- 캐릭터 타드 반복-->
                    <div class="card">
                        <span>캐릭터 카드 1</span>
                    </div>
                </div>
            </div>
        </section>

        <!-- board 요약-->
        <section class="boards">
            <!-- 자랑 게시판-->
            <div class="board pride-board">
                <div class="board-header">
                    <h3 class="board-title">자랑 게시판</h3>
                    <hr class="board-line">
                    <button class="add-button">+</button>
                </div>
                <table class="board-table">
                    <tbody>
                        <!-- tr 태그 반복-->
                        <tr>
                            <td><a href="#">우리 아이, 바닷물 얕을 때 뛰어 넘었어요!</a></td>
                            <td><a href="#">2024-10-22</a></td>
                        </tr>
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
