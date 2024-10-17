<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Face - Virtual Idol Experience</title>
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/index.css">
</head>
<body>

    <!--header-->
    <jsp:include page="common/header.jsp" />
    
    
    <!-- Main Content -->
    <main>
        <!-- 배경 비디오 -->
        <div class="video-container">
            <video autoplay muted loop class="background-video">
                <source src="image/video.mp4" type="video/mp4">
                Your browser does not support the video tag.
            </video>
            <!-- 반투명한 오버레이 -->
            <div class="overlay"></div>
    
            <!-- 텍스트 영역 -->
            <div class="text-container">
                <h1>Welcome to a World Beyond Reality!</h1>
                <p>Immerse yourself in the ultimate virtual experience with our Virtual Idols.<br>
                    Connect, interact, and explore a new dimension where your digital dreams come to life in real-time!</p>
            </div>
        </div>

        <!-- shorts -->
        <section class="shorts-section">
            <div class="shorts-header">
                <div class="header-content">
                    <img src="image/youtube.png" alt="Shorts Icon" class="shorts-icon">
                    <h2>Shorts</h2>
                </div>
                <a href="#" class="more-link">더보기 ></a>
            </div>
        
            <div class="shorts-carousel">
                <button class="carousel-button left-button">
                    <img src="image/left-arrow.png" alt="Left Arrow">
                </button>
        
                <div class="shorts-wrapper" id="shorts-wrapper">
                    <!-- short-item을 반복해서 작성 -->
                    <div class="short-item">
                        <div class="short-thumbnail"></div>
                        <p class="short-title">버추얼 아이돌 보컬</p>
                        <p class="short-views">조회수 1.3만회</p>
                    </div>
                    <div class="short-item">
                        <div class="short-thumbnail"></div>
                        <p class="short-title">버추얼 아이돌 댄스</p>
                        <p class="short-views">조회수 2.5만회</p>
                    </div>
                    <div class="short-item">
                        <div class="short-thumbnail"></div>
                        <p class="short-title">버추얼 아이돌 퍼포먼스</p>
                        <p class="short-views">조회수 3.1만회</p>
                    </div>
                    <div class="short-item">
                        <div class="short-thumbnail"></div>
                        <p class="short-title">버추얼 아이돌 인터뷰</p>
                        <p class="short-views">조회수 4.0만회</p>
                    </div>
                    <div class="short-item">
                        <div class="short-thumbnail"></div>
                        <p class="short-title">버추얼 아이돌 인터뷰</p>
                        <p class="short-views">조회수 4.0만회</p>
                    </div>
                    <div class="short-item">
                        <div class="short-thumbnail"></div>
                        <p class="short-title">버추얼 아이돌 인터뷰</p>
                        <p class="short-views">조회수 4.0만회</p>
                    </div>
                </div>
        
                <button class="carousel-button right-button">
                    <img src="image/right-arrow.png" alt="Right Arrow">
                </button>
            </div>
        </section>
        </main>

        <!-- 라인 추가 -->
        <hr class="section-divider">

        <!-- Contest Section -->
        <section class="contest-section">
            <div class="contest-header">
                <div class="header-content">
                    <img src="image/youtube.png" alt="Contest Icon" class="contest-icon">
                    <h2>Contest</h2>
                </div>
                <a href="#" class="more-link">더보기 ></a>
            </div>
        
            <div class="contest-gallery">
                <div class="contest-item second-place">
                    <div class="medal">
                        <img src="image/2nd.png" alt="Second Place Medal">
                    </div>
                    <div class="contest-thumbnail"></div>
                    <p class="contest-title">000님의 작품</p>
                </div>
                <div class="contest-item first-place">
                    <div class="medal">
                        <img src="image/1st.png" alt="First Place Medal">
                    </div>
                    <div class="contest-thumbnail"></div>
                    <p class="contest-title">000님의 작품</p>
                </div>
                <div class="contest-item third-place">
                    <div class="medal">
                        <img src="image/3rd.png" alt="Third Place Medal">
                    </div>
                    <div class="contest-thumbnail"></div>
                    <p class="contest-title">000님의 작품</p>
                </div>
        </section>
        </main>

    <!-- Footer Section -->
    <jsp:include page="common/footer.jsp" />
    
    
    
    
</body>
</html>
