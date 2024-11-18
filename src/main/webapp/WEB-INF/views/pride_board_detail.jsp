<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js"> <!--<![endif]-->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>NEW FACE</title>
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

    <style>
        .container_1 {
            margin: 0 auto;
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .meta {
            color: #666;
            font-size: 14px;
            margin-bottom: 20px;
        }
        .content {
            margin-bottom: 30px;
        }
        .media {
            margin: 20px 0;
            text-align: center;
        }
        .btn {
            display: inline-block;
            padding: 10px 15px;
            background-color: #FF3B69;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 14px;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>

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

                <div class="container_1">
                    <!-- 제목 -->
                    <div class="title">${boardIdx.boardTitle}</div>
            
                    <!-- 작성자, 작성일, 조회수 -->
                    <div class="meta">
                        작성자: ${boardIdx.user.userNickname} | 작성일: ${boardIdx.boardUpdatedAt} | 조회수: ${boardIdx.boardViewCount}
                    </div>
            
                    <!-- 본문 내용 -->
                    <div class="content">
                        ${boardIdx.boardContent}
                    </div>
            
                    <!-- 이미지나 동영상 -->
                    <div class="media">
                        <c:choose>
                            <c:when test="${fn:endsWith(boardIdx.boardFilePath, '.jpg') 
                                            or fn:endsWith(boardIdx.boardFilePath, '.jpeg') 
                                            or fn:endsWith(boardIdx.boardFilePath, '.png') 
                                            or fn:endsWith(boardIdx.boardFilePath, '.gif') 
                                            or fn:endsWith(boardIdx.boardFilePath, '.webp') 
                                            or fn:endsWith(boardIdx.boardFilePath, '.jfif')}">
                                <img src="${boardIdx.boardFilePath}" alt="첨부 이미지" style="max-width: 100%; height: auto;">
                            </c:when>
                            <c:when test="${fn:endsWith(boardIdx.boardFilePath, '.mp4') 
                                            or fn:endsWith(boardIdx.boardFilePath, '.avi') 
                                            or fn:endsWith(boardIdx.boardFilePath, '.mov')}">
                                <video controls style="max-width: 100%; height: auto;">
                                    <source src="${boardIdx.boardFilePath}" type="video/mp4">
                                    동영상을 지원하지 않는 브라우저입니다.
                                </video>
                            </c:when>
                            <c:otherwise>
                                <p>첨부된 이미지나 동영상이 없습니다.</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    
            
                    <!-- 목록으로 돌아가기 버튼 -->
                    <div style="text-align: center; margin-top: 20px;">
                        <a href="/pride_board" class="btn">목록으로 돌아가기</a>
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