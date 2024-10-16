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
    
            <form action="join" method="post">
                <input type="text" name="userId" placeholder="ID" required>
                <input type="password" name="userPw" placeholder="Password" required>
                <input type="text" name="userNickname" placeholder="Nickname" required>
                <input type="email" name="userEmail" placeholder="Email" required>
                <input type="submit" value="Join">
            </form>
        </div>
    </div>

    <!-- Modal -->
    <div id="modal" class="modal">
        <div class="modal-content">
            <div class="modal-body">
                <p id="modal-message"></p>
            </div>
            <div class="modal-footer">
                <button id="confirm-btn" class="btn confirm">확인</button>
            </div>
        </div>
    </div>
    

    <!--footer-->
    <jsp:include page="common/sub-footer.jsp" />

    <script>
    const message = "${message}";
    const error = "${error}";

    window.onload = function() {
        const modal = document.getElementById('modal');
        const modalMessage = document.getElementById('modal-message');
        const confirmBtn = document.getElementById('confirm-btn');

        // 줄바꿈을 위한 함수: 마침표 뒤에 <br> 추가
        function addLineBreaks(text) {
            return text.replace(/:\s*/g, ':<br>');
        }

        if (message || error) {
            modal.style.display = "block";
            modalMessage.innerHTML = addLineBreaks(message || error);

            // 확인 버튼 클릭 시 처리
            confirmBtn.onclick = function() {
                modal.style.display = "none";
                if (message) {
                    // 회원가입 성공 시 로그인 페이지로 이동
                    window.location.href = "/loginForm";
                }
                // 실패 시 모달이 닫히고 현재 페이지에 머무름
            };
        }
    };
</script>

    
    

</body>
</html>
