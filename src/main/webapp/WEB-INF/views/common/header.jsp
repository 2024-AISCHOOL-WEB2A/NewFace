<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<header class="header">
    <div class="logo">
        <a href="/">New Face</a>
    </div>
    <nav class="navigation">
        <ul class="nav-list">
            <li><a href="/" class="<%= request.getRequestURI().equals("/") ? "active" : "" %>">홈</a></li>
            <li><a href="/start_virtual" class="<%= request.getRequestURI().contains("start_virtual") ? "active" : "" %>">게임하기</a></li>
            <li><a href="/character_intro" class="<%= request.getRequestURI().contains("character_intro") ? "active" : "" %>">캐릭터 소개</a></li>
            <li><a href="/pride_board" class="<%= request.getRequestURI().contains("pride_board") ? "active" : "" %>">자랑 게시판</a></li>
            <li><a href="/support" class="<%= request.getRequestURI().contains("support") ? "active" : "" %>">고객지원</a></li>
        </ul>
    </nav>
    <div class="auth-buttons">
        <a href="/joinForm" class="signup-btn" id="signUpButton">Sign up</a>
        <a href="/loginForm" class="login-btn">Log in</a>
        <span id="greeting" style="display: none;" onclick="/payment"></span>
        <button id="logoutButton" style="display: none;" onclick="location.href='/logout'">Logout</button>
    </div>

    <script>
        window.onload = function() {
            var userNickname = "${sessionScope.loginUser.getUserNickname()}";
            var greeting = document.getElementById("greeting");
            var signUpButton = document.getElementById("signUpButton");
            var loginButton = document.getElementById("loginButton");
            var logoutButton = document.getElementById("logoutButton");
            
            if (userNickname) {
                greeting.style.display = "inline";
                greeting.textContent = userNickname + "님";
                signUpButton.style.display = "none";
                loginButton.style.display = "none";
                logoutButton.style.display = "inline";
            } else {
                greeting.style.display = "none";
                signUpButton.style.display = "inline";
                loginButton.style.display = "inline";
                logoutButton.style.display = "none";
            }
        }
    </script>


</header>
