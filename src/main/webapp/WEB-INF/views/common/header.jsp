<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<header class="header">
    <div class="logo">
        <a href="/"><img src="/image/logo.png" alt="Contest Logo" style="width: 150px;"></a>
    </div>
    <nav class="navigation">
        <ul class="nav-list">
            <li><a href="/" class="<%= request.getRequestURI().equals("/") ? "active" : "" %>">홈</a></li>
            <li><a href="/start_virtual" class="<%= request.getRequestURI().contains("start_virtual") ? "active" : "" %>">게임하기</a></li>
            <li><a href="/character_intro" class="<%= request.getRequestURI().contains("character_intro") ? "active" : "" %>">캐릭터 소개</a></li>
            <li><a href="/pride_board" class="<%= request.getRequestURI().contains("pride_board") ? "active" : "" %>">자랑 게시판</a></li>
            <li><a href="/customerService" class="<%= request.getRequestURI().contains("support") ? "active" : "" %>">고객지원</a></li>
        </ul>
    </nav>
    <div class="auth-buttons">
        <!-- 로그인 상태 확인하여 if 조건문으로 버튼 표시 -->
        <c:if test="${not empty sessionScope.loginUser}">
            <!-- 로그인 된 경우 -->
            <a href="/payment" id="greeting" class="greet">${sessionScope.loginUser.userNickname}님</a>
            <a id="logoutButton" class="logout-btn" href='/logout'">Logout</a>
        </c:if>

        <c:if test="${empty sessionScope.loginUser}">
            <!-- 로그아웃 된 경우 -->
            <a href="/joinForm" class="signup-btn" id="signUpButton">Sign up</a>
            <a href="/loginForm" class="login-btn" id="loginButton">Log in</a>
        </c:if>
    </div>
</header>
