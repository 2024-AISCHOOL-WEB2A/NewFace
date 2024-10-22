<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <!-- 임시 - 연주 -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자랑 게시판</title>
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/board.css">
</head>
<body>
    <jsp:include page="common/header.jsp" />

    <main class="board-container">
        <div class="board-title">
            <h2>자랑 게시판</h2>
        </div>

        <div class="board-gallery">
            <c:forEach items="${boards}" var="board">
                <div class="board-item">
                    <img src="${board.boardFilePath}" alt="${board.boardTitle}">
                    <button class="heart-button">  <!-- 하트 코드 -->
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                            <path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z" />
                        </svg>
                    </button>
                </div>
            </c:forEach>
        </div>

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
        </div>
    </main>

    <jsp:include page="common/footer.jsp" />

    <script>
        document.querySelectorAll('.heart-button').forEach(button => {
            button.addEventListener('click', function(e) {
                e.preventDefault();
                this.classList.toggle('active');
            });
        });
    </script>
</body>