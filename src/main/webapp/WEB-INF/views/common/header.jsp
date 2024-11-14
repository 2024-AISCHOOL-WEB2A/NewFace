<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<header id="fh5co-header-section" class="sticky-banner">
    <div class="container">
        <div class="nav-header">
            <a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle dark"><i></i></a>
            <h1 id="fh5co-logo" style="margin-bottom: 25px;"><a href="/">New Face</a></h1>
            <!-- START #fh5co-menu-wrap -->
            <nav id="fh5co-menu-wrap" role="navigation">
                <ul class="sf-menu" id="fh5co-primary-menu">
                    <li><a href="/" class="<%= request.getRequestURI().equals(" /") ? "active" : "" %>">HOME</a></li>
                    <li><a href="/start_virtual" class="<%= request.getRequestURI().contains(" start_virtual")
                            ? "active" : "" %>">게임하기</a></li>
                    <li><a href="/character_intro" class="<%= request.getRequestURI().contains(" character_intro")
                            ? "active" : "" %>">캐릭터 소개</a></li>
                    <li><a href="/pride_board" class="<%= request.getRequestURI().contains(" pride_board") ? "active"
                            : "" %>">자랑 게시판</a></li>
                    <li><a href="/customerService" class="<%= request.getRequestURI().contains(" support") ? "active"
                            : "" %>">고객지원</a></li>


                    <li><a></a></li>
                    <li><a></a></li>
                    <li><a></a></li>
                    <li><a></a></li>


                    <!-- 로그인 상태 확인하여 if 조건문으로 버튼 표시 -->
                    <c:if test="${not empty sessionScope.loginUser}">
                        <!-- user_role이 admin인 경우 -->
                        <c:if test="${sessionScope.loginUser.userRole == 'admin'}">
                            <li><a href="/admin" class="greet">${sessionScope.loginUser.userNickname}님</a></li>
                        </c:if>

                        <!-- 일반 사용자일 경우 -->
                        <c:if test="${sessionScope.loginUser.userRole != 'admin'}">
                            <li><a href="/payment" class="greet">${sessionScope.loginUser.userNickname}님</a></li>
                        </c:if>

                        <li><a id="logoutButton" class="logout-btn" href='/logout'>Logout</a></li>
                    </c:if>

                    <c:if test="${empty sessionScope.loginUser}">
                        <!-- 로그아웃 된 경우 -->
                        <li><a href="/joinForm" class="signup-btn" id="signUpButton">Sign up</a></li>
                        <li><a href="/loginForm" class="login-btn" id="loginButton">Log in</a></li>
                    </c:if>
        </div>

        </ul>
        </nav>
    </div>
    </div>
</header>