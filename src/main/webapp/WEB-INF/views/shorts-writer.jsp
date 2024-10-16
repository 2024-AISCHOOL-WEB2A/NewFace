<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Face - Shorts 게시글 작성</title>
    <link rel="stylesheet" href="resources/static/css/styles.css"> <!-- 기존의 header와 footer 스타일 포함 -->
    <link rel="stylesheet" href="resources/static/css/shorts-write.css">  <!-- 별도의 작성 페이지 스타일 포함 -->
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
    <main class="shorts-write-section">
        <!-- 왼쪽: 썸네일 업로드 섹션 -->
        <div class="thumbnail-section">
            <div class="thumbnail-preview" id="thumbnailPreview"></div> <!-- 썸네일 미리보기 공간 -->
            <input type="file" id="fileInput" accept="image/*" class="file-input" />
        </div>

        <!-- 오른쪽: 게시글 입력 폼 -->
        <div class="form-section">
            <form action="#" method="post">
                <div class="form-group">
                    <label for="title">제목 (필수 입력)</label>
                    <input type="text" id="title" name="title" required>
                </div>

                <div class="form-group">
                    <label for="author">작성자</label>
                    <input type="text" id="author" name="author">
                </div>

                <div class="form-group">
                    <label for="description">설명</label>
                    <textarea id="description" name="description" rows="4"></textarea>
                </div>

                <div class="form-group">
                    <label for="tags">태그</label>
                    <textarea id="tags" name="tags" rows="2"></textarea>
                </div>

                <div class="form-group submit-group">
                    <button type="submit" class="submit-button">등록하기</button>
                </div>
            </form>
        </div>
    </main>

    <!-- footer 재사용 -->
    <footer class="project-footer">
        <div class="footer-copyright">
            <p>&copy; 2024 Your Project Name. All rights reserved.</p>
        </div>
    </footer>

    <!-- 파일 미리보기 스크립트 -->
    <script>
        const fileInput = document.getElementById('fileInput');
        const thumbnailPreview = document.getElementById('thumbnailPreview');

        fileInput.addEventListener('change', function(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    thumbnailPreview.style.backgroundImage = `url(${e.target.result})`;
                    thumbnailPreview.style.backgroundSize = 'cover';
                    thumbnailPreview.style.backgroundPosition = 'center';
                };
                reader.readAsDataURL(file);
            }
        });
    </script>
</body>
</html>
