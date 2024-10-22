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
   <!-- jQuery 추가 -->
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
  <!--header-->
   <jsp:include page="common/header.jsp" />

   <div class="container-wrapper">
       <div class="container">
           <div class="logo">
               <img src="image/logo.png" alt="New Face Logo">
           </div>
   
           <form action="/join" method="post" id="joinForm">
               <div class="input-group">
                   <input type="text" id="userId" name="userId" placeholder="ID" required>
                   <span id="idMessage" class="message"></span>
               </div>
               <div class="input-group">
                   <input type="password" name="userPw" placeholder="Password" required>
               </div>
               <div class="input-group">
                   <input type="text" name="userNickname" placeholder="Nickname" required>
               </div>
               <div class="input-group">
                   <input type="email" id="userEmail" name="userEmail" placeholder="Email" required>
                   <span id="emailMessage" class="message"></span>
               </div>
               <input type="submit" value="Join">
           </form>
       </div>
   </div>

   <!--footer-->
   <jsp:include page="common/footer.jsp" />
   
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

   <script>
   $(document).ready(function() {
       let isIdValid = false;
       let isEmailValid = false;

        // 아이디 중복 체크
    $("#userId").blur(function() {
        let userId = $(this).val();
        if(userId) {
            $.ajax({
                url: "/checkId",
                type: "GET",
                data: { userId: userId },
                success: function(available) {
                    if(available) {
                        $("#idMessage").text("사용 가능한 아이디입니다.").css("color", "green");
                        isIdValid = true;
                    } else {
                        $("#idMessage").text("이미 사용중인 아이디입니다.").css("color", "red");
                        isIdValid = false;
                    }
                }
            });
        }
    });

    // 이메일 중복 체크
    $("#userEmail").blur(function() {
        let userEmail = $(this).val();
        if(userEmail) {
            $.ajax({
                url: "/checkEmail",
                type: "GET",
                data: { userEmail: userEmail },
                success: function(available) {
                    if(available) {
                        $("#emailMessage").text("사용 가능한 이메일입니다.").css("color", "green");
                        isEmailValid = true;
                    } else {
                        $("#emailMessage").text("이미 사용중인 이메일입니다.").css("color", "red");
                        isEmailValid = false;
                    }
                }
            });
        }
    });

    // 폼 제출 전 검증
    $("#joinForm").submit(function(e) {
        if(!isIdValid || !isEmailValid) {
            e.preventDefault();
            alert("아이디와 이메일 중복을 확인해주세요.");
            return false;
        }
    });
});
   // 기존 모달 관련 스크립트
   const message = "${message}";
   const error = "${error}";

   window.onload = function() {
       const modal = document.getElementById('modal');
       const modalMessage = document.getElementById('modal-message');
       const confirmBtn = document.getElementById('confirm-btn');

       function addLineBreaks(text) {
           return text.replace(/:\s*/g, ':<br>');
       }

       if (message || error) {
           modal.style.display = "block";
           modalMessage.innerHTML = addLineBreaks(message || error);

           confirmBtn.onclick = function() {
               modal.style.display = "none";
               if (message) {
                   window.location.href = "/loginForm";
               }
           };
       }
   };
   </script>

   <style>
   .input-group {
       margin-bottom: 15px;
       position: relative;
   }
   
   .message {
       display: block;
       font-size: 0.8em;
       margin-top: 5px;
   }
   </style>
</body>
</html>