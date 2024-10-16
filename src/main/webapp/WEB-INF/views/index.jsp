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
    <header class="main-header">
        <div class="logo">
            <img src="image/logo.png" alt="New Face Logo"> 
        </div>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="#">Start Virtual</a></li>
                <li><a href="shorts.jsp">Shorts</a></li>
                <li><a href="#">Contest</a></li>
            </ul>
        </nav>
        <div class="sign-in">
            <button id="signUpButton">Sign Up</button>
            <button id="loginButton">Login</button>
            <span id="greeting" style="display: none;">000님 안녕하세요</span>
        </div>
    </header>
    
    
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
                    <c:forEach items="${popularShorts}" var="shorts">
                        <div class="short-item">
                            <div class="short-thumbnail">
                                <img src="${shorts.shortsVideoUrl}" alt="${shorts.shortsTitle}">
                            </div>
                            <p class="short-title">${shorts.shortsTitle}</p>
                            <p class="short-views">조회수 ${shorts.shortsViewCount}회</p>
                        </div>
                    </c:forEach>
                </div>

                <button class="carousel-button right-button">
                    <img src="image/right-arrow.png" alt="Right Arrow">
                </button>
            </div>
        </section>

        <!-- JavaScript for shorts carousel -->
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                const wrapper = document.getElementById('shorts-wrapper');
                const leftButton = document.querySelector('.left-button');
                const rightButton = document.querySelector('.right-button');

                let scrollAmount = 0;

                rightButton.addEventListener('click', () => {
                    scrollAmount += 300; // Adjust this value as needed
                    wrapper.scrollTo({
                        left: scrollAmount,
                        behavior: 'smooth'
                    });
                });

                leftButton.addEventListener('click', () => {
                    scrollAmount -= 300; // Adjust this value as needed
                    if (scrollAmount < 0) scrollAmount = 0;
                    wrapper.scrollTo({
                        left: scrollAmount,
                        behavior: 'smooth'
                    });
                });
            });
        </script>
        
        

        <!-- 라인 추가 -->
        <hr class="section-divider">

        <section class="contest-section">
            <div class="contest-header">
                <div class="header-content">
                    <img src="image/youtube.png" alt="Contest Icon" class="contest-icon">
                    <h2>Contest</h2>
                </div>
                <a href="#" class="more-link">더보기 ></a>
            </div>
        
            <div class="contest-gallery">
                <c:if test="${not empty topContests}">
                    <div class="contest-item second-place">
                        <div class="medal">
                            <img src="image/2nd.png" alt="Second Place Medal">
                        </div>
                        <div class="contest-thumbnail">
                            <img src="${topContests[1].contestImageUrl}" alt="${topContests[1].contestTitle}">
                        </div>
                        <p class="contest-title">${topContests[1].user.userNickname}님의 작품</p>
                    </div>
                    <div class="contest-item first-place">
                        <div class="medal">
                            <img src="image/1st.png" alt="First Place Medal">
                        </div>
                        <div class="contest-thumbnail">
                            <img src="${topContests[0].contestImageUrl}" alt="${topContests[0].contestTitle}">
                        </div>
                        <p class="contest-title">${topContests[0].user.userNickname}님의 작품</p>
                    </div>
                    <div class="contest-item third-place">
                        <div class="medal">
                            <img src="image/3rd.png" alt="Third Place Medal">
                        </div>
                        <div class="contest-thumbnail">
                            <img src="${topContests[2].contestImageUrl}" alt="${topContests[2].contestTitle}">
                        </div>
                        <p class="contest-title">${topContests[2].user.userNickname}님의 작품</p>
                    </div>
                </c:if>
            </div>
        </section>
    </main>

    <!-- Footer Section -->
    <footer class="project-footer">
        <div class="footer-content">
            <!-- Member 1 -->
            <div class="footer-column">
                <h2>Member 1</h2>
                <div class="social-icons">
                    <a href="https://github.com/name1" target="_blank">
                        <img src="image/github-icon.png" alt="GitHub">
                    </a>
                    <a href="https://instagram.com/name1" target="_blank">
                        <img src="image/instagram-icon.png" alt="Instagram">
                    </a>
                </div>
            </div>
    
            <!-- Member 2 -->
            <div class="footer-column">
                <h2>Member 2</h2>
                <div class="social-icons">
                    <a href="https://github.com/name2" target="_blank">
                        <img src="image/github-icon.png" alt="GitHub">
                    </a>
                    <a href="https://instagram.com/name2" target="_blank">
                        <img src="image/instagram-icon.png" alt="Instagram">
                    </a>
                </div>
            </div>
    
            <!-- Member 3 -->
            <div class="footer-column">
                <h2>Member 3</h2>
                <div class="social-icons">
                    <a href="https://github.com/name3" target="_blank">
                        <img src="image/github-icon.png" alt="GitHub">
                    </a>
                    <a href="https://instagram.com/name3" target="_blank">
                        <img src="image/instagram-icon.png" alt="Instagram">
                    </a>
                </div>
            </div>
    
            <!-- Member 4 -->
            <div class="footer-column">
                <h2>Member 4</h2>
                <div class="social-icons">
                    <a href="https://github.com/name4" target="_blank">
                        <img src="image/github-icon.png" alt="GitHub">
                    </a>
                    <a href="https://instagram.com/name4" target="_blank">
                        <img src="image/instagram-icon.png" alt="Instagram">
                    </a>
                </div>
            </div>
    
            <!-- Member 5 -->
            <div class="footer-column">
                <h2>Member 5</h2>
                <div class="social-icons">
                    <a href="https://github.com/name5" target="_blank">
                        <img src="image/github-icon.png" alt="GitHub">
                    </a>
                    <a href="https://instagram.com/name5" target="_blank">
                        <img src="image/instagram-icon.png" alt="Instagram">
                    </a>
                </div>
            </div>
        </div>
        <div class="footer-copyright">
            <p>&copy; 2024 Your Project Name. All rights reserved.</p>
        </div>
    </footer>
    
    
    
    
</body>
</html>
