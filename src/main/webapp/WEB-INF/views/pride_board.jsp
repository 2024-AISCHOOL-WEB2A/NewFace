<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
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
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<!-- <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'> -->
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<!-- Superfish -->
	<link rel="stylesheet" href="css/superfish.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="css/magnific-popup.css">

	<link rel="stylesheet" href="css/style.css">


	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
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


		<div id="fh5co-blog-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
                        <h3>자랑 게시판</h3>
                    </div>
                </div>
        
                <div class="row row-bottom-padded-md">
                    <div class="col-md-12">
                        <ul id="fh5co-portfolio-list">
                            <c:forEach var="board" items="${boards}" varStatus="status" begin="0" end="9">
                                <c:choose>
                                    <c:when test="${status.index == 0 || status.index == 9}">
                                        <!-- 0번과 9번 인덱스일 때의 스타일 -->
                                        <li class="two-third animate-box" data-animate-effect="fadeIn" 
                                            style="background-image: url(${board.boardFilePath});">
                                            <a href="/pride_board/detail/${board.boardIdx}" class="color-2">
                                                <div class="case-studies-summary">
                                                    <span>${board.boardUpdatedAt}</span>
                                                    <h2>${board.boardTitle}</h2>
                                                </div>
                                            </a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <!-- 나머지 인덱스일 때의 스타일 -->
                                        <li class="one-third animate-box" data-animate-effect="fadeIn" 
                                            style="background-image: url(${board.boardFilePath});">
                                            <a href="/pride_board/detail/${board.boardIdx}" class="color-3">
                                                <div class="case-studies-summary">
                                                    <span>${board.boardUpdatedAt}</span>
                                                    <h2>${board.boardTitle}</h2>
                                                </div>
                                            </a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </ul>
                        
                    </div>
                </div>

                <div class="row">
                    <!-- 페이징 영역 -->
                    <div class="col-md-12 text-center">
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <!-- 이전 페이지 버튼 -->
                                <li class="<c:if test='${isFirst}'>disabled</c:if>">
                                    <a href="?page=${currentPage - 1}" aria-label="Previous" <c:if test="${isFirst}">style="pointer-events: none;"</c:if>>
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                
                                <!-- 동적 페이지 번호 -->
                                <c:forEach begin="0" end="${totalPages - 1}" var="page">
                                    <li class="<c:if test='${page == currentPage}'>active</c:if>">
                                        <a href="?page=${page}">${page + 1}</a>
                                    </li>
                                </c:forEach>
                
                                <!-- 다음 페이지 버튼 -->
                                <li class="<c:if test='${isLast}'>disabled</c:if>">
                                    <a href="?page=${currentPage + 1}" aria-label="Next" <c:if test="${isLast}">style="pointer-events: none;"</c:if>>
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <!-- 등록하기 버튼 영역 -->
                <div class="col-md-12 text-center">
                    <a href="/pride_board/register" class="btn btn-primary" role="button" style="margin-top: 20px;">등록하기</a>
                </div>
                
                

            </div>
        </div>
        <jsp:include page="common/footer.jsp" />

        <style>
            /* 활성화된 페이지 버튼의 배경색과 글씨색 변경 */
            .pagination .active a {
                background-color: #FF3B69;; /* 원하는 색상으로 변경 */
                color: #fff !important; /* 글씨 색상 */
                border-color: #FF3B69;; /* 경계선 색상 */
            }

            .pagination a {
                color: black !important; /* 글씨 색상 */
            }
        </style>
        

	

	</div>
	<!-- END fh5co-page -->

	</div>
	<!-- END fh5co-wrapper -->

	<!-- jQuery -->


	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/sticky.js"></script>

	<!-- Stellar -->
	<script src="js/jquery.stellar.min.js"></script>
	<!-- Superfish -->
	<script src="js/hoverIntent.js"></script>
	<script src="js/superfish.js"></script>
	<!-- Magnific Popup -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>
	
	<!-- Main JS -->
	<script src="js/main.js"></script>

	</body>
</html>

