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
    <!-- Masonry 라이브러리 추가 -->
    <script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
    <!-- imagesLoaded 라이브러리 추가 (이미지 로딩 완료 확인용) -->
    <script src="https://unpkg.com/imagesloaded@5/imagesloaded.pkgd.min.js"></script>
</head>
<body>
    <!--header-->
    <jsp:include page="common/header.jsp" />

    <!-- Contest Gallery Section -->
    <main>
        <section class="contest-section">
            <div class="contest-container">
                <div class="contest-header">
                    <img src="image/children.png" alt="Contest Logo" style="width: 40px;">
                    <span># 자랑 게시판</span>
                </div>
            </div>
        </section>

        <!-- 두 번째 섹션 (Masonry Layout) -->
        <!-- grid class 이름 변경 -->
        <section class="masonry-section">
            <div class="grid">
                <c:forEach items="${boards}" var="board">
                    <!-- grid-item class 이름 변경 -->
                    <div class="grid-item">
                        <a href="/pride_board/detail/${board.boardIdx}">
                            <c:choose>
                                <c:when test="${fn:endsWith(board.boardFilePath, '.mp4')}">
                                    <video muted loop autoplay playsinline class="hover-video">
                                        <source src="${board.boardFilePath}" type="video/mp4">
                                    </video>
                                </c:when>
                                <c:otherwise>
                                    <img src="${board.boardFilePath}" alt="${board.boardFilePath}">
                                </c:otherwise>
                            </c:choose>
                        </a>
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
                const loginUser = '${loginUser}';
                if(!loginUser) {
                    alert("로그인이 필요한 서비스입니다.");
                    window.location.href = '/loginForm';
                    return;
                }
                window.location.href = '/pride_board/register';
            }
        </script>
        
        <!-- Masonry 초기화 스크립트 추가 -->
        <script>
        document.addEventListener('DOMContentLoaded', function() {
            var grid = document.querySelector('.grid');
            
            imagesLoaded(grid, function() {
                var masonry = new Masonry(grid, {
                    itemSelector: '.grid-item',
                    columnWidth: '.grid-item',
                    gutter: 10,  // 간격
                    percentPosition: true,  // 퍼센트 기반 포지션
                    fitWidth: true,  // 컨테이너에 맞추기
                    columns: 3,  // 3열 강제 지정
                    transitionDuration: 0  // 애니메이션 효과 제거
                });

                // 레이아웃 재계산
                masonry.layout();
            });
        });
        </script>
    </main>

    <!-- footer 재사용 -->
    <jsp:include page="common/footer.jsp" />
</body>
</html>