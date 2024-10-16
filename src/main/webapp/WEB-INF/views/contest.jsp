<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Face - Contest</title>
    <link rel="stylesheet" href="resources/static/css/styles.css"> <!-- 기존의 header와 footer 스타일 포함 -->
    <link rel="stylesheet" href="resources/static/css/contest.css"> <!-- contest 페이지 스타일 포함 -->
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
                <li><a href="contest.html">Contest</a></li>
            </ul>
        </nav>
        <div class="sign-in">
            <button id="signUpButton">Sign Up</button>
            <button id="loginButton">Login</button>
            <span id="greeting" style="display: none;">000님 안녕하세요</span>
        </div>
    </header>

    <!-- Contest Gallery Section -->
    <main>
        <section class="contest-section">
            <div class="contest-container">
                <div class="contest-header">
                    <img src="resources/static/image/youtube.png" alt="Contest Logo" style="width: 40px;"> 
                    <span>#Contest</span>
                </div>
    
                <div class="prize-section">
                    <div class="prize">
                        <img class="medal second-place" src="resources/static/image/2nd.png" alt="2nd Place">
                        <div class="entry-image-placeholder" id="second-entry">
                            <!-- 여기 나중에 이미지 추가 가능 -->
                        </div>
                        <div class="prize-text">000님의 작품</div>
                    </div>
    
                    <div class="prize">
                        <img class="medal first-place" src="resources/static/image/1st.png" alt="1st Place">
                        <div class="entry-image-placeholder" id="first-entry">
                            <!-- 여기 나중에 이미지 추가 가능 -->
                        </div>
                        <div class="prize-text">000님의 작품</div>
                    </div>
    
                    <div class="prize">
                        <img class="medal third-place" src="resources/static/image/3rd.png" alt="3rd Place">
                        <div class="entry-image-placeholder" id="third-entry">
                            <!-- 여기 나중에 이미지 추가 가능 -->
                        </div>
                        <div class="prize-text">000님의 작품</div>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <!-- footer 재사용 -->
    <footer class="project-footer">
        <div class="footer-copyright">
            <p>&copy; 2024 Your Project Name. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
