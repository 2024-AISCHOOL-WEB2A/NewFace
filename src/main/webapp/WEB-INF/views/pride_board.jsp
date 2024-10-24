<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Face - Virtual Idol Experience</title>
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/pride_board.css">
</head>
<body>

    <!--header-->
    <jsp:include page="common/header.jsp" />

    <!-- Contest Gallery Section -->
    <main>
        <section class="contest-section">
            <div class="contest-container">
                <div class="contest-header">
                    <img src="image/youtube.png" alt="Contest Logo" style="width: 40px;">
                    <span> #자랑 게시판</span>
                </div>
            </div>
        </section>

        <!-- 두 번째 섹션 (Masonry Layout) -->
        <section class="masonry-section">
            <div class="masonry-grid">
                <c:forEach items="${boards}" var="board">
                <div class="masonry-item">
                    <img src="${board.boardFilePath}" alt="${board.boardFilePath}">
                </div>
            </c:forEach>
            </div>
        </section>

        <div class="board-pagination">
            <c:if test="${!isFirst}">
                <a href="?page=${currentPage - 1}" class="page-number prev">◀</a>
            </c:if>
            
            <c:forEach begin="0" end="${totalPages - 1}" var="pageNum">
                <a href="?page=${pageNum}" 
                class="page-number ${pageNum == currentPage ? 'active' : ''}">${pageNum + 1}</a>
            </c:forEach>
            
            <c:if test="${!isLast}">
                <a href="?page=${currentPage + 2}" class="page-number next">▶</a>
            </c:if>
            <a href="javascript:void(0)" onclick="checkLoginAndRedirect()" class="register-button">등록하기</a>
        </div>

        <script>
            function checkLoginAndRedirect() {
                const loginUser = '${loginUser}';  // 세션의 loginUser 체크
                if(!loginUser) {
                    alert("로그인이 필요한 서비스입니다.");
                    window.location.href = '/loginForm';
                    return;
                }
                window.location.href = '/pride_board/register';
                }
            </script>
        
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
    <jsp:include page="common/footer.jsp" />
</body>

</html>