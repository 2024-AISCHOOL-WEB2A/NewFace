<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Face - Shorts</title>
    <link rel="stylesheet" href="resources/static/css/styles.css"> <!-- 기존의 header와 footer 스타일 포함 -->
    <link rel="stylesheet" href="resources/static/css/shorts.css">  <!-- 별도의 shorts 페이지 스타일 포함 -->
</head>
<body>

    <!--header-->
    <header class="main-header">
        <div class="logo">
            <img src="resources/static/image/logo.png" alt="New Face Logo"> 
        </div>
        <nav>
            <ul>
                <li><a href="index.html">Home</a></li>
                <li><a href="#">Start Virtual</a></li>
                <li><a href="shorts.html">Shorts</a></li>
                <li><a href="#">Contest</a></li>
            </ul>
        </nav>
        <div class="sign-in">
            <button id="signUpButton">Sign Up</button>
            <button id="loginButton">Login</button>
            <span id="greeting" style="display: none;">000님 안녕하세요</span>
        </div>
    </header>

    <!-- Shorts 게시판 섹션 -->
    <main>
        <section class="shorts-section">
            <div class="shorts-header">
                <img src="resources/static/image/youtube.png" alt="Shorts Icon" class="shorts-icon">
                <h2>#Shorts</h2>
            </div>
            <div class="shorts-container">
                <div class="shorts-item">
                    <div class="short-thumbnail"></div>
                    <p class="short-title">버추얼 아이돌 보컬</p>
                    <p class="short-views">조회수 <span class="views-number">1.3만</span>회</p>
                </div>
                <div class="shorts-item">
                    <div class="short-thumbnail"></div>
                    <p class="short-title">버추얼 아이돌 댄스</p>
                    <p class="short-views">조회수 <span class="views-number">2.5만</span>회</p>
                </div>
                <div class="shorts-item">
                    <div class="short-thumbnail"></div>
                    <p class="short-title">버추얼 아이돌 퍼포먼스</p>
                    <p class="short-views">조회수 <span class="views-number">3.1만</span>회</p>
                </div>
                <div class="shorts-item">
                    <div class="short-thumbnail"></div>
                    <p class="short-title">버추얼 아이돌 인터뷰</p>
                    <p class="short-views">조회수 <span class="views-number">4.0만</span>회</p>
                </div>
                <div class="shorts-item">
                    <div class="short-thumbnail"></div>
                    <p class="short-title">버추얼 아이돌 토크쇼</p>
                    <p class="short-views">조회수 <span class="views-number">5.5만</span>회</p>
                </div>
            </div>
        </section>
        
        

        <!-- 게시글 섹션 -->
        <section class="board-section">
            <div class="board-item">
                <div class="board-thumbnail"></div>
                <div class="board-content">
                    <h3>PLAVE (플레이브) - 버추얼 아이돌 | 쇼 음악중심 in JAPAN</h3>
                    <p>조회수 <span class="views-number">60만</span>회 · <span class="posted-time">2개월 </span>전</p>
                    <p>MBCkpop</p>
                    <p>#버추얼아이돌</p>
                </div>
            </div>
            
            <!-- 동일한 board-item을 복사하여 여러 개 추가 -->
            <div class="board-item">
                <div class="board-thumbnail"></div>
                <div class="board-content">
                    <h3>PLAVE (플레이브) - 버추얼 아이돌 | 쇼 음악중심 in JAPAN</h3>
                    <p>조회수 <span class="views-number">60만</span>회 · <span class="posted-time">2개월 전</span></p>
                    <p>MBCkpop</p>
                    <p>#버추얼아이돌</p>
                </div>
            </div>
            
            <!-- 추가 게시물 생략 -->
        </section>

        <!-- Search 섹션 -->
        <section class="search-section">
            <div class="search-container">
                <select class="search-select">
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                </select>
            
                <input type="text" class="search-input" placeholder="검색어를 입력하세요.">
            
                <button class="search-button">검색</button>
                
                <!-- 로그인 시에만 나타나는 등록하기 버튼 
                <button class="register-button" id="registerButton" style="display: none;">등록하기</button> -->
                <button class="register-button" id="registerButton" >등록하기</button>
                
            </div>
        </section>

        <!-- 페이징 섹션 -->
        <section class="pagination-section">
            <div class="pagination">
                <a href="#" class="pagination-arrow">&lt;</a>
                <a href="#" class="pagination-number">1</a>
                <a href="#" class="pagination-number">2</a>
                <a href="#" class="pagination-number">3</a>
                <a href="#" class="pagination-number">4</a>
                <a href="#" class="pagination-number">5</a>
                <a href="#" class="pagination-number">6</a>
                <a href="#" class="pagination-number">7</a>
                <a href="#" class="pagination-number">8</a>
                <a href="#" class="pagination-number">9</a>
                <a href="#" class="pagination-number">10</a>
                <a href="#" class="pagination-arrow">&gt;</a>
            </div>
        </section>
    </main>

    <!-- footer 재사용 -->
    <footer class="project-footer">
        <div class="footer-content">
            <!-- Member 1 -->
            <div class="footer-column">
                <h2>Member 1</h2>
                <div class="social-icons">
                    <a href="https://github.com/name1" target="_blank">
                        <img src="resources/static/image/github-icon.png" alt="GitHub">
                    </a>
                    <a href="https://instagram.com/name1" target="_blank">
                        <img src="resources/static/image/instagram-icon.png" alt="Instagram">
                    </a>
                </div>
            </div>
    
            <!-- Member 2 -->
            <div class="footer-column">
                <h2>Member 2</h2>
                <div class="social-icons">
                    <a href="https://github.com/name2" target="_blank">
                        <img src="resources/static/image/github-icon.png" alt="GitHub">
                    </a>
                    <a href="https://instagram.com/name2" target="_blank">
                        <img src="resources/static/image/instagram-icon.png" alt="Instagram">
                    </a>
                </div>
            </div>
    
            <!-- Member 3 -->
            <div class="footer-column">
                <h2>Member 3</h2>
                <div class="social-icons">
                    <a href="https://github.com/name3" target="_blank">
                        <img src="resources/static/image/github-icon.png" alt="GitHub">
                    </a>
                    <a href="https://instagram.com/name3" target="_blank">
                        <img src="resources/static/image/instagram-icon.png" alt="Instagram">
                    </a>
                </div>
            </div>
    
            <!-- Member 4 -->
            <div class="footer-column">
                <h2>Member 4</h2>
                <div class="social-icons">
                    <a href="https://github.com/name4" target="_blank">
                        <img src="resources/static/image/github-icon.png" alt="GitHub">
                    </a>
                    <a href="https://instagram.com/name4" target="_blank">
                        <img src="resources/static/image/instagram-icon.png" alt="Instagram">
                    </a>
                </div>
            </div>
    
            <!-- Member 5 -->
            <div class="footer-column">
                <h2>Member 5</h2>
                <div class="social-icons">
                    <a href="https://github.com/name5" target="_blank">
                        <img src="resources/static/image/github-icon.png" alt="GitHub">
                    </a>
                    <a href="https://instagram.com/name5" target="_blank">
                        <img src="resources/static/image/instagram-icon.png" alt="Instagram">
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
