<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/customerService_detail.css">
</head>
<body>

    <jsp:include page="common/header.jsp" />
    
    <div class="container">

        <!-- Notice Section -->
        <div class="notice-container">
            <div class="notice-header">
                <span class="notice-title">[공지] 고객센터 운영시간 변경 안내</span>
                <span class="notice-date">20XX.XX.XX 00:00:00</span>
            </div>
            <div class="notice-content">
                <p>안녕하세요 인공지능사관학교 교육생 여러분 반갑습니다.</p>
                <p>실전프로젝트 및 개인의 역량 강화를 위한 글로벌 콘텐츠 지원 관련 안내 드립니다.</p>
                <p>글로벌 콘텐츠는 인공지능 및 IT 관련 해외온라인콘텐츠를 통하여 교육생 개인의 역량 및 글로벌 경쟁력 강화에 도움이 될 것입니다.</p>
                <p>해외온라인콘텐츠 목록에서 관련 영상을 선택 후 신청서에 작성 및 제출 하면 되고, 목록 이외의 콘텐츠는 10만원 내로 신청이 가능합니다.</p>
                <p>자세한 내용은 아래와 같습니다.</p>
            </div>
        </div>
        
        <!-- 관리자 멘트 입력 및 등록 버튼 (로그인 여부에 따라 표시) -->
        <div class="admin-input-container">

            <c:if test="${sessionScope.loginUser.userRole == 'admin'}">
                <input type="text" class="admin-input" placeholder="관리자 멘트를 입력하세요">
                <button class="admin-submit-button">등록</button>
            </c:if>

            <!-- 일반 사용자일 경우 -->
            <c:if test="${sessionScope.loginUser.userRole != 'admin'}">
                <div class="admin-comment">
                    관리자 멘트: <span>${empty adminComment ? '' : adminComment}</span>
                </div>
            </c:if>
        </div>

        <!-- 목록/취소/삭제 버튼 -->
        <div class="button-group">
            <a href="#" class="list-button">목록</a>
            <a href="#" class="cancel-button">취소</a>
            <a href="#" class="delete-button">삭제</a>
        </div>
    </div>

    <jsp:include page="common/footer.jsp" />
</body>
</html>
