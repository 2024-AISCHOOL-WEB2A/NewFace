<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js"> <!--<![endif]-->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Module &mdash; 100% Free Fully Responsive HTML5 Template by FREEHTML5.co</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
    <meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
    <meta name="author" content="FREEHTML5.CO" />

    <!-- 
	//////////////////////////////////////////////////////

	FREE HTML5 TEMPLATE 
	DESIGNED & DEVELOPED by FREEHTML5.CO
		
	Website: 		http://freehtml5.co/
	Email: 			info@freehtml5.co
	Twitter: 		http://twitter.com/fh5co
	Facebook: 		https://www.facebook.com/fh5co

	//////////////////////////////////////////////////////
	 -->

    <!-- Facebook and Twitter integration -->
    <meta property="og:title" content="" />
    <meta property="og:image" content="" />
    <meta property="og:url" content="" />
    <meta property="og:site_name" content="" />
    <meta property="og:description" content="" />
    <meta name="twitter:title" content="" />
    <meta name="twitter:image" content="" />
    <meta name="twitter:url" content="" />
    <meta name="twitter:card" content="" />

    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <link rel="shortcut icon" href="favicon.ico">

    <!-- <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'> -->

    <!-- Animate.css -->
    <link rel="stylesheet" href="/css/animate.css">
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="/css/icomoon.css">
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="/css/bootstrap.css">
    <!-- Superfish -->
    <link rel="stylesheet" href="/css/superfish.css">
    <!-- Magnific Popup -->
    <link rel="stylesheet" href="/css/magnific-popup.css">

    <link rel="stylesheet" href="/css/style.css">


    <!-- Modernizr JS -->
    <script src="/js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

</head>

<body>
    <div id="fh5co-wrapper">
        <div id="fh5co-page">

            <!--start:header-->
            <jsp:include page="common/header.jsp" />
            <!-- end:header-top -->


            <div id="fh5co-blog-section" style="padding: 100px 0 !important;">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
                            <h3>고객지원 작성</h3>
                        </div>
                    </div>

                    <div class="container py-5 bg-light rounded shadow-sm">
                        <form action="/customerService/register" method="post" class="register-form" id="registerForm">
                            <!-- 작성자 이름 -->
                            <div class="mb-3">
                                <label for="authorName" class="form-label">이름</label>
                                <input type="text" id="authorName" name="authorName" class="form-control"
                                    value="${userNickname}" readonly>
                            </div>

                            <!-- 작성자 아이디 -->
                            <div class="mb-3">
                                <label for="authorId" class="form-label">아이디</label>
                                <input type="text" id="authorId" name="authorId" class="form-control" value="${userId}"
                                    readonly>
                            </div>

                            <!-- 제목 -->
                            <div class="mb-3">
                                <label for="title" class="form-label">제목</label>
                                <input type="text" id="title" name="title" class="form-control" required
                                    placeholder="제목을 입력하세요">
                            </div>

                            <!-- 내용 -->
                            <div class="mb-3">
                                <label for="content" class="form-label">내용</label>
                                <textarea id="content" name="content" class="form-control" rows="10" required
                                    placeholder="내용을 입력하세요">${fn:replace(content, newLine, '<br>')}</textarea>
                            </div>

                            <!-- 카테고리 선택 -->
                            <c:choose>
                                <c:when test="${sessionScope.loginUser.userRole eq 'admin'}">
                                    <div class="mb-3">
                                        <label for="category" class="form-label">카테고리</label>
                                        <select id="category" name="category" class="form-select" required>
                                            <option value="공지">공지</option>
                                            <option value="FAQ">FAQ</option>
                                            <option value="요청" selected>요청</option>
                                        </select>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div style="display: none;">
                                        <!-- admin이 아닌 경우 빈 div로 표시만 유지 -->
                                        <input type="hidden" id="category" name="category" value="요청">
                                    </div>
                                </c:otherwise>
                            </c:choose>




                            <!-- 작성 및 취소 버튼 -->
                            <div class="text-center mt-4" style="margin-top: 30px;">
                                <div class="d-inline-flex gap-3">
                                    <button type="submit" class="btn btn-primary px-4">글쓰기</button>
                                    <a href="/customerService" class="btn btn-secondary px-4">취소</a>
                                </div>
                            </div>
                        </form>

                    </div>



                </div>
            </div>
            <jsp:include page="common/footer.jsp" />




        </div>
        <!-- END fh5co-page -->

    </div>
    <!-- END fh5co-wrapper -->

    <!-- jQuery -->


    <script src="/js/jquery.min.js"></script>
    <!-- jQuery Easing -->
    <script src="/js/jquery.easing.1.3.js"></script>
    <!-- Bootstrap -->
    <script src="/js/bootstrap.min.js"></script>
    <!-- Waypoints -->
    <script src="/js/jquery.waypoints.min.js"></script>
    <script src="/js/sticky.js"></script>

    <!-- Stellar -->
    <script src="/js/jquery.stellar.min.js"></script>
    <!-- Superfish -->
    <script src="/js/hoverIntent.js"></script>
    <script src="/js/superfish.js"></script>
    <!-- Magnific Popup -->
    <script src="/js/jquery.magnific-popup.min.js"></script>
    <script src="/js/magnific-popup-options.js"></script>

    <!-- Main JS -->
    <script src="/js/main.js"></script>

    <script>
        $(document).ready(function () {
            // 폼 제출 전 유효성 검사
            $("#registerForm").submit(function (e) {
                const title = $("#title").val().trim();
                const content = $("#content").val().trim();

                if (title === "") {
                    alert("제목을 입력해주세요.");
                    $("#title").focus();
                    e.preventDefault();
                    return false;
                }

                if (content === "") {
                    alert("내용을 입력해주세요.");
                    $("#content").focus();
                    e.preventDefault();
                    return false;
                }
            });

            // 줄바꿈 처리
            $('#content').on('input', function () {
                // 입력값의 줄바꿈을 <br> 태그로 변환
                var content = $(this).val().replace(/\n/g, '<br>');
                $(this).val(content);
            });
        });
    </script>

</body>

</html>