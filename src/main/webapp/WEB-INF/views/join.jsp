<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Join - New Face</title>
    <link rel="stylesheet" href="css/join.css">
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <!--header-->
    <jsp:include page="common/header.jsp" />

    
    <div class="container-wrapper">
        <div class="container">
            <div class="logo">
                <img src="image/logo.png" alt="New Face Logo">
            </div>
            
            <!-- 오류 메시지 표시 -->
            <c:if test="${not empty error}">
                <div class="alert alert-danger">${error}</div>
            </c:if>
            
            <!-- 성공 메시지 표시 -->
            <c:if test="${not empty message}">
                <div class="alert alert-success">${message}</div>
            </c:if>
    
    
            <form action="join" method="post">
                <input type="text" name="userId" placeholder="ID" required>
                <input type="password" name="userPw" placeholder="Password" required>
                <input type="text" name="userNickname" placeholder="Nickname" required>
                <input type="email" name="userEmail" placeholder="Email" required>
                <input type="submit" value="Join">
            </form>
        </div>

    </div>

    <!--header-->
    <jsp:include page="common/sub-footer.jsp" />

</body>
</html>