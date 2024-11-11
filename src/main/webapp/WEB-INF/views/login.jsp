<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Join - New Face</title>
    <link rel="stylesheet" href="css/join.css">
    <link rel="stylesheet" href="css/style.css">

    <title>로그인</title>
    <script>
        // 페이지 로드 시 실행
        window.onload = function() {
            var loginError = "${loginError}";
            if (loginError) {
                alert(loginError);
            }
        }
    </script>

</head>
<body>
    <!--header 위치 -->
    <jsp:include page="common/header.jsp" />
    
    <div class="container-wrapper1 ">
        <div class="container">
            <div class="logo">
                <img src="image/logo.png" alt="New Face Logo">
            </div>
            <form action="/custom_login" method="post">
                <input type="text" name="userId" placeholder="ID" required>
                <input type="password" name="userPw" placeholder="Password" required>
                <input type="submit" value="Login">
            </form>

            
             <!-- 구분선 -->
             <div class="divider">
                <span>또는</span>
            </div>
            <div class="social-login">
            <a href="/oauth2/authorization/google" class="google-login-btn">
                Google로 계속하기
            </a>
            <a href="/oauth2/authorization/naver" class="naver-login-btn">
                네이버로 계속하기
            </a>
            <a class="kakao-login-btn">
                카카오로 계속하기
            </a>
        </div>
    </div>

    <!--footer-->
    <jsp:include page="common/footer.jsp" />

    
</body>
</html>