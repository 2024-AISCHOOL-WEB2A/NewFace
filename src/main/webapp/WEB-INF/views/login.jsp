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

      <style>
          .modal-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1000;
        }
        
        .modal-container {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            width: 400px;
            text-align: center;
            z-index: 1001;
        }

        .modal-title {
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 20px;
            font-family: '메인 폰트 Bold'
        }

        .modal-content {
            font-size: 16px;
            margin-bottom: 25px;
            font-family: '메인 폰트 Light'
        }

        .modal-buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .modal-button {
            padding: 12px 30px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-family: '메인 폰트 Bold'
        }

        .confirm-button {
            background-color: #FF3B69;
            color: white;
        }
    </style>

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

     <!-- 모달 추가 -->
     <div id="errorModal" class="modal-overlay">
        <div class="modal-container">
            <div class="modal-title">아이디 비밀번호 확인</div>
            <div class="modal-content" id="modalMessage"></div>
            <div class="modal-buttons">
                <button class="modal-button confirm-button" onclick="closeModal()">확인</button>
            </div>
        </div>
    </div>


    <!--footer-->
    <jsp:include page="common/footer.jsp" />

    <script>
         window.onload = function() {
            var loginError = "${loginError}";
            if (loginError && loginError.trim() !== "") {
                showModal(loginError);
            }
        }

        function showModal(message) {
            const modal = document.getElementById('errorModal');
            const modalMessage = document.getElementById('modalMessage');
            modalMessage.textContent = message;
            modal.style.display = 'block';
        }

        function closeModal() {
            const modal = document.getElementById('errorModal');
            modal.style.display = 'none';
        }

        // 모달 외부 클릭 시 닫기
        window.onclick = function(event) {
            const modal = document.getElementById('errorModal');
            if (event.target === modal) {
                modal.style.display = 'none';
            }
        }
    </script>

    
</body>
</html>