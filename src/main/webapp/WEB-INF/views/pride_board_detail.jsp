<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

            <div class="container py-5" style="margin-bottom: 100px; margin-top: 50px;">
                <div class="row" style="align-items: stretch; display: flex;">
                    <!-- 2/3 비율: 비디오 또는 이미지 영역 -->
                    <div class="col-md-8 mb-4 d-flex justify-content-center align-items-center">
                        <div class="media-container bg-dark rounded overflow-hidden d-flex justify-content-center align-items-center"
                            style="width: 100%; height: 500px; max-width: 600px; max-height: 400px; position: relative;">
                            <c:choose>
                                <c:when test="${boardIdx.boardFilePath.endsWith('.mp4')}">
                                    <!-- 비디오인 경우 -->
                                    <video controls
                                        style="width: 100%; height: 100%; object-fit: contain; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
                                        <source src="${boardIdx.boardFilePath}" type="video/mp4">
                                        Your browser does not support the video tag.
                                    </video>
                                </c:when>
                                <c:otherwise>
                                    <!-- 이미지인 경우 -->
                                    <img src="${boardIdx.boardFilePath}" alt="Media Image"
                                        style="width: 100%; height: 100%; object-fit: contain; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>




                    <!-- 1/3 비율: 상세 정보 및 댓글 -->
                    <div class="col-md-4 shadow" style="box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);">
                        <div class="detail-header mb-4">
                            <h2 class="h4 mb-2 text-dark">${boardIdx.boardTitle}</h2>
                            <p class="text-muted small mb-0">조회수 <span id="views">${boardIdx.boardViewCount}</span>회 ·
                                <span id="time">${boardIdx.boardUpdatedAt}</span></p>
                            <p class="text-muted small" id="channel">${boardIdx.user.userNickname}</p>
                        </div>

                        <div class="interaction p-3 bg-light rounded">
                            <p class="mb-0 text-dark">${boardIdx.boardContent}</p>
                        </div>
                    </div>
                </div>
            </div>


            <jsp:include page="common/footer.jsp" />
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
        <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
        <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />

</body>

</html>