<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Join - New Face</title>
    <link rel="stylesheet" href="css/join.css">
</head>
<body>
    <div class="header">
        <div class="logo">
            <img src="image/logo.png" alt="New Face Logo">
        </div>
        <div class="nav-links">
            <a href="#">HOME</a>
            <a href="#">Start Virtual</a>
            <a href="#">#Shorts</a>
            <a href="#">#Contest</a>
        </div>
        <div class="auth-buttons">
            <button onclick="location.href='/join'">Sign up</button>
            <button id="loginButton" onclick="location.href='/login'">Log in</button>
        </div>
    </div>
    
    <div class="container">
        <div class="logo">
            <img src="image/logo.png" alt="New Face Logo">
        </div>
        <form action="/join" method="post">
            <input type="text" name="user_id" placeholder="ID" required>
            <input type="password" name="user_pw" placeholder="Password" required>
            <input type="text" name="user_nickname" placeholder="Nickname" required>
            <input type="email" name="user_email" placeholder="Email" required>
            <input type="submit" value="Join">
        </form>
    </div>
</body>
</html>