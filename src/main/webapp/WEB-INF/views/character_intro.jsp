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
                        <h3>캐릭터 소개</h3>
                    </div>
                </div>
        
                <!-- 캐릭터 카테고리 -->
                <div class="row animate-box" style="border-radius: 5px; box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2); margin: 10px;">
                    <!-- 반복 -->
					<div class="col-md-3" class="fh5co-section-gray">
						<div class="fh5co-team text-center animate-box">
							<figure>
								<img src="images/person_1.jpg" alt="user">
							</figure>
							<p>Jean Doe, XYZ Co.</p>
						</div>
					</div>
					<div class="col-md-3" class="fh5co-section-gray">
						<div class="fh5co-team text-center animate-box">
							<figure>
								<img src="images/person_1.jpg" alt="user">
							</figure>
							<p>Jean Doe, XYZ Co.</p>
						</div>
					</div>
                    <div class="col-md-3" class="fh5co-section-gray">
						<div class="fh5co-team text-center animate-box">
							<figure>
								<img src="images/person_1.jpg" alt="user">
							</figure>
							<p>Jean Doe, XYZ Co.</p>
						</div>
					</div>
                    <div class="col-md-3" class="fh5co-section-gray">
						<div class="fh5co-team text-center animate-box">
							<figure>
								<img src="images/person_1.jpg" alt="user">
							</figure>
							<p>Jean Doe, XYZ Co. </p>
						</div>
					</div>
				</div>
                <!-- 캐릭터 카테고리 끝 -->
        
                <div class="container">
                    <div class="row row-bottom-padded-md">
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="fh5co-blog animate-box">
                                <a href="#"><img class="img-responsive" src="images/cover_bg_2.jpg" alt=""></a>
                                <div class="blog-text">
                                    <div class="prod-title">
                                        <h3><a href="#">Web Design for the Future</a></h3>
                                        <p><a href="#">더보기...</a></p>
                                    </div>
                                </div> 
                            </div>
                        </div>
                        <!-- 추가 콘텐츠는 여기서 계속 반복됩니다 -->
                    </div>
                </div>
            </div>
        </div>
        

	

        <jsp:include page="common/footer.jsp" />
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

