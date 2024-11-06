<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고객 지원</title>
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/customerService.css">
</head>
<body>
    <jsp:include page="common/header.jsp" />
    <div class="content-wrapper">
        <!-- 배너 섹션 -->
        <div class="banner-section">
            <div class="banner-content">
                <h1 class="banner-title">
                    NEW FACE 고객센터
                </h1>
            </div>
        </div>   

        <div class="container">
            <img src="image/하츄핑.png" class="floating-item left-item1" alt="캐릭터1">
            <img src="image/말랑핑.png" class="floating-item left-item2" alt="캐릭터2">
            <img src="image/쿠로미.png" class="floating-item right-item1" alt="캐릭터3">
            <img src="image/반짝핑.png" class="floating-item right-item2" alt="캐릭터4">
        </div>
        
        <!-- 카테고리 필터 -->
        <div class="category-filter">
            <select id="categorySelect" onchange="location.href=this.value">
                <option value="/customerService" ${param.category == null ? 'selected' : ''}>전체</option>
                <option value="/customerService?category=공지" ${param.category == "공지" ? 'selected' : ''}>공지</option>
                <option value="/customerService?category=FAQ" ${param.category == "FAQ" ? 'selected' : ''}>FAQ</option>
                <option value="/customerService?category=요청" ${param.category == "요청" ? 'selected' : ''}>요청</option>
            </select>
        </div>

        <table>
            <thead>
                <tr>
                    <th>순번</th>
                    <th>제목</th>
                    <th>날짜</th>
                </tr>
            </thead>
                <tbody>
                <c:if test="${not empty posts}">
                    <c:forEach items="${posts}" var="post" varStatus="status">
                        <tr style="cursor: pointer;" onclick="toggleContent(this);">
                            <td>${status.count}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${post.customerServiceCategory eq '공지'}">
                                        <span class="notice-tag">[공지]</span>
                                    </c:when>
                                    <c:when test="${post.customerServiceCategory eq 'FAQ'}">
                                        <span class="faq-tag">[FAQ]</span>
                                    </c:when>
                                    <c:when test="${post.customerServiceCategory eq '요청'}">
                                        <span class="request-tag">[요청]</span>
                                    </c:when>
                                </c:choose>
                                ${post.customerServiceTitle}
                            </td>
                            <td class="date">${post.customerServiceDate}</td>
                        </tr>
                        <!-- 두 번째 tr: 숨겨져 있다가 클릭 시 나타나는 행 -->
                        <tr class="content-row" style="display: none;">
                            <td colspan="3">
                                ${post.customerServiceContent}
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
                <c:if test="${empty posts}">
                    <tr>
                        <td colspan="3">등록된 게시글이 없습니다.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
        <div class="button-container">
            <a href="javascript:void(0)" onclick="checkLoginAndRedirect()" class="register-button">등록하기</a>
        </div>
    </div>
    <jsp:include page="common/footer.jsp" />
</body>

<script>
    function checkLoginAndRedirect() {
        const loginUser = '${loginUser}';
        if(!loginUser) {
            alert("로그인이 필요한 서비스입니다.");
            window.location.href = '/loginForm';
            return;
        }
        window.location.href = '/customerService_register';
    }

    function toggleContent(row) {
    // 클릭된 <tr>의 다음 형제 요소인 content-row를 찾음
    const contentRow = row.nextElementSibling;
    
    // content-row의 display 스타일을 토글
    if (contentRow.style.display === 'none' || contentRow.style.display === '') {
        contentRow.style.display = 'table-row';
    } else {
        contentRow.style.display = 'none';
    }
}

</script>
</html>