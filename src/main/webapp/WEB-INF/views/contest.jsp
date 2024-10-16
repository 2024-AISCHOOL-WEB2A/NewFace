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

        <!-- 두 번째 섹션 (Masonry Layout) -->
        <section class="masonry-section">
            <div class="masonry-grid">
                <div class="masonry-item tall">1</div>
                <div class="masonry-item">2</div>
                <div class="masonry-item wide">3</div>
                <div class="masonry-item">4</div>
                <div class="masonry-item tall wide">5</div>
                <div class="masonry-item">6</div>
                <div class="masonry-item">7</div>
                <div class="masonry-item wide">8</div>
                <div class="masonry-item">9</div>
                <div class="masonry-item tall">1</div>
                <div class="masonry-item">2</div>
                <div class="masonry-item wide">3</div>
                <div class="masonry-item">4</div>
                <div class="masonry-item tall wide">5</div>
                <div class="masonry-item">6</div>
                <div class="masonry-item">7</div>
                <div class="masonry-item wide">8</div>
                <div class="masonry-item">9</div>
                <div class="masonry-item tall">1</div>
                <div class="masonry-item">2</div>
                <div class="masonry-item wide">3</div>
                <div class="masonry-item">4</div>
                <div class="masonry-item tall wide">5</div>
                <div class="masonry-item">6</div>
                <div class="masonry-item">7</div>
                <div class="masonry-item wide">8</div>
                <div class="masonry-item">9</div>
            </div>
        </section>
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                const masonryItems = document.querySelectorAll('.masonry-item');
        
                masonryItems.forEach(item => {
                    const img = item.querySelector('img');
        
                    // 이미지가 로드된 후 크기를 계산
                    img.onload = function() {
                        const width = img.naturalWidth;
                        const height = img.naturalHeight;
                        const ratio = width / height;
        
                        // 비율 계산: 가로/세로 비율 차이가 20% 이하인 경우 기본 상태로 유지
                        if (Math.abs(ratio - 1) <= 0.2) {
                            // 20% 이내 차이는 기본 상태 유지
                            return;
                        }
        
                        // 가로가 더 길면 'wide', 세로가 더 길면 'tall'
                        if (width > height) {
                            item.classList.add('wide');
                        } else {
                            item.classList.add('tall');
                        }
                    };
                });
            });
        </script>
        
        
    </main>

    <!-- footer 재사용 -->
    <footer class="project-footer">
        <div class="footer-copyright">
            <p>&copy; 2024 Your Project Name. All rights reserved.</p>
        </div>
    </footer>
</body>

</html>