<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Face - Shorts Detail</title>
    <link rel="stylesheet" href="resources/static/css/styles.css"> <!-- 기존의 header와 footer 스타일 포함 -->
    <link rel="stylesheet" href="resources/static/css/shorts-detail.css">  <!-- 별도의 shorts 상세 페이지 스타일 포함 -->
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

    <!-- Main Content -->
    <main class="shorts-detail">
        <!-- 왼쪽: 비디오 플레이어 영역 -->
        <div class="video-section">
            <div class="video-container">
                <!-- 여기에 비디오가 들어감 -->
                <video controls width="100%" height="100%" style="object-fit: cover;">
                    <source src="video/video.mp4" type="video/mp4">
                    Your browser does not support the video tag.
                </video>
            </div>
        </div>

        <!-- 오른쪽: 상세 정보 및 댓글 -->
        <div class="detail-section">
            <div class="detail-header">
                <h2>PLAVE (플레이브) - 버추얼 아이돌</h2>
                <p>조회수 00만회 · 2개월 전</p>
                <p>MBCKpop</p>
                <p>#버추얼 아이돌</p>
            </div>

            <div class="interaction">
                <p>내용을 입력해주세요</p>
                <button class="like-button" id="likeButton"></button>
            </div>

            <div class="comment-section">
                <h3>댓글 512개</h3>
                <div class="comment-input">
                    <img src="resources/static/image/user-icon.png" alt="User Icon" class="user-icon">
                    <input type="text" placeholder="댓글을 입력하세요" class="comment-box">
                </div>
            </div>
        </div>
    </main>


    <script>
        const likeButton = document.getElementById('likeButton');
        let isLiked = false;

        likeButton.addEventListener('click', function() {
            isLiked = !isLiked; // 상태를 토글
            if (isLiked) {
                likeButton.classList.add('liked'); // 좋아요 상태
            } else {
                likeButton.classList.remove('liked'); // 비어있는 하트로 돌아감
            }
        });
    </script>
</html>
