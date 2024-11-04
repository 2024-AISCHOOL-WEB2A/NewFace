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
        <h2 class="category-title">
            <img src="image/megaphone.png" alt="customerService Logo" style="width: 40px;">
            <span># 고객지원</span>
        </h2>
        
        <!-- 카테고리 필터 -->
        <div class="category-filter">
            <select id="categorySelect" onchange="location.href=this.value">
                <option value="/customerService" ${param.category == null ? 'selected' : ''}>전체</option>
                <option value="/customerService?category=0" ${param.category == '0' ? 'selected' : ''}>공지</option>
                <option value="/customerService?category=1" ${param.category == '1' ? 'selected' : ''}>FAQ</option>
                <option value="/customerService?category=2" ${param.category == '2' ? 'selected' : ''}>요청</option>
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
                        <tr>
                            <td>${status.count}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${post.customerServiceCategory eq '0'}">
                                        <span class="notice-tag">[공지]</span>
                                    </c:when>
                                    <c:when test="${post.customerServiceCategory eq '1'}">
                                        <span class="faq-tag">[FAQ]</span>
                                    </c:when>
                                    <c:when test="${post.customerServiceCategory eq '2'}">
                                        <span class="request-tag">[요청]</span>
                                    </c:when>
                                </c:choose>
                                ${post.customerServiceTitle}
                            </td>
                            <td class="date">
                                ${post.customerServiceDate}
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
    <jsp:include page="common/footer.jsp" />
</body>
</html>