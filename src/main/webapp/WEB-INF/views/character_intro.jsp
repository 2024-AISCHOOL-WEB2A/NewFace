<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/character_intro.css">
</head>

<body>
    <!--header 위치 -->
    <jsp:include page="common/header.jsp" />

    <main class="character-gallery">
        <!-- 카테고리 section-->
        <section class="category-section">
            <h2 class="category-title">
                <span class="title-icon">🎥</span> # 캐릭터 소개
            </h2>
            <div class="category-wrapper">
                <div class="category-item">
                    <img src="character1.png" alt="사랑의 하츄핑">
                    <p>사랑의 하츄핑</p>
                </div>
                <div class="category-item">
                    <img src="character2.png" alt="뽀롱뽀롱 뽀로로">
                    <p>뽀롱뽀롱 뽀로로</p>
                </div>
                <div class="category-item">
                    <img src="character3.png" alt="또봇">
                    <p>또봇</p>
                </div>
                <div class="category-item">
                    <img src="character4.png" alt="명탐정 코난">
                    <p>명탐정 코난</p>
                </div>
            </div>
        </section>

        <!-- grid section-->
        <section class="grid-section">
            <div class="grid-container">
                <div class="grid-item">
                    <a href="character_intro_detail">
                        <img src="character1.png" alt="하츄핑">
                        <p>하츄핑</p>  
                    </a>
                </div>
                <!-- 추가 캐릭터들 여기에 배치 -->
            </div>
        </section>


        <!--footer 위치 -->
        <jsp:include page="common/footer.jsp" />
        
    </main>

    <script>

        window.addEventListener('scroll', function () {
            var categorySection = document.querySelector('.category-section');
            var sticky = categorySection.offsetTop;

            if (window.pageYOffset > sticky) {
                categorySection.classList.add('sticky');
            } else {
                categorySection.classList.remove('sticky');
            }
        });

    </script>
</body>

</html>