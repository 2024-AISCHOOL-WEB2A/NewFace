<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLine", "\n"); %>

<!DOCTYPE html>
<html lang="ko">

<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>글쓰기</title>
   <link rel="stylesheet" href="/css/customerService_register.css">
   <link rel="stylesheet" href="/css/customerService.css">
   <link rel="stylesheet" href="/css/styles.css">
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>

   <jsp:include page="common/header.jsp" />

   <div class="content-wrapper">
       <!-- 배너 섹션 -->
       <div class="banner-section">
           <div class="banner-content">
               <h1 class="banner-title">
                   NEW FACE 고객센터
               </h1>
           </div>
       </div>

       <div class="container">
           <h2 class="page-title">고객 지원 글쓰기</h2>

           <form action="/customerService/register" method="post" class="register-form" id="registerForm">
               <!-- 작성자 이름 -->
               <div class="form-group">
                   <label for="authorName">이름</label>
                   <input type="text" id="authorName" name="authorName" value="${userNickname}" readonly>
               </div>

               <!-- 작성자 아이디 -->
               <div class="form-group">
                   <label for="authorId">아이디</label>
                   <input type="text" id="authorId" name="authorId" value="${userId}" readonly>
               </div>

               <!-- 제목 -->
               <div class="form-group">
                   <label for="title">제목</label>
                   <input type="text" id="title" name="title" required placeholder="제목을 입력하세요">
               </div>

               <!-- 내용 -->
               <div class="form-group">
                   <label for="content">내용</label>
                   <textarea id="content" name="content" rows="10" required placeholder="내용을 입력하세요">${content}</textarea>
               </div>

               <!-- 카테고리 선택 -->
               <div class="form-group">
                   <label for="category">카테고리</label>
                   <select id="category" name="category" required>
                       <c:if test="${sessionScope.loginUser.userRole eq 'admin'}">
                           <option value="공지">공지</option>
                           <option value="FAQ">FAQ</option>
                       </c:if>
                       <option value="요청" selected>요청</option>
                   </select>
               </div>

               <!-- 작성 및 취소 버튼 -->
               <div class="form-buttons">
                   <button type="submit" class="submit-button">글쓰기</button>
                   <a href="/customerService" class="cancel-button">취소</a>
               </div>
           </form>
       </div>
   </div>

   <jsp:include page="common/footer.jsp" />

   <script>
       $(document).ready(function() {
           // 폼 제출 전 유효성 검사
           $("#registerForm").submit(function(e) {
               const title = $("#title").val().trim();
               const content = $("#content").val().trim();
               
               if(title === "") {
                   alert("제목을 입력해주세요.");
                   $("#title").focus();
                   e.preventDefault();
                   return false;
               }
               
               if(content === "") {
                   alert("내용을 입력해주세요.");
                   $("#content").focus();
                   e.preventDefault();
                   return false;
               }
           });
        });
        
   </script>
</body>
</html>