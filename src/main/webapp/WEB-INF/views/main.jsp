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
	<title>New Face</title>
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
	
		<div class="fh5co-hero">
			<div class="fh5co-overlay"></div>
			<div class="fh5co-cover text-center" data-stellar-background-ratio="0.5">
                <video autoplay loop muted playsinline class="background-video">
                    <source src="/image/main1.mp4" type="video/mp4">
                </video>
                <div class="desc">
                    <div class="container">
                        <div class="col-md-10 col-md-offset-1">
                            <div class="animate-box">
                                <h2>나만의 이야기를 펼칠 <br>새로운 캐릭터를 만나보세요!</h2>
                                <p></p>
                                <p><a class="btn btn-primary btn-lg custom-btn" href="#">Get Started</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

		</div>

		<!--start:header-->
		<jsp:include page="common/header.jsp" />
		<!-- end:header-top -->


        <!--start: 캐릭터 도감-->
        <div class="fh5co-content-section">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
						<h3> 캐릭터 도감 </h3>
						<p>다양한 캐릭터 정보를 한눈에! 당신이 좋아하는 캐릭터들을 찾아보세요!</p>
					</div>
				</div>
			</div>
			<div class="container">

				<div class="row">
                    <!-- 반복 -->
					<c:forEach var="character" items="${characters}">
						<div class="col-md-2">
							<div class="fh5co-team text-center animate-box">
								
										<figure>
											<img src="${character.characterImage}" alt="${character.characterName}">
										</figure>
										<p>${character.characterName}<br> <span class="text-muted">${character.characterCategory}</span></p>
								
							</div>
						</div>
					</c:forEach>
                    
				</div>
			</div>
		</div>

        <!-- end: 캐릭터 도감-->

        <!--start:자랑 게시판-->
        <div id="fh5co-portfolio" class="fh5co-section-gray">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
						<h3>자랑 게시판</h3>
						<p>우리 아이의 특별한 순간을 기록하고 공유해보세요! <br>체험 사진을 업로드하고, 만든 작품을 자랑할 수 있는 공간이 마련되어 있습니다. <br>소중한 추억을 나누고 교류하며 아이의 성장을 응원하는 커뮤니티에 참여해보세요!</p>
					</div>
				</div>

				
				<div class="row row-bottom-padded-md">
					<div class="col-md-12">
						<ul id="fh5co-portfolio-list">

							<li class="two-third animate-box" data-animate-effect="fadeIn" style="background-image: url(uploads/images/1.jfif); ">
								<a href="#" class="color-3">
									<div class="case-studies-summary">
										<span>Creative</span>
										<h2>Wak in the wooden street</h2>
									</div>
								</a>
							</li>
						
							<li class="one-third animate-box" data-animate-effect="fadeIn" style="background-image: url(uploads/images/2.jpg); ">
								<a href="#" class="color-4">
									<div class="case-studies-summary">
										<span>Design</span>
										<h2>Present your product</h2>
									</div>
								</a>
							</li>

							<li class="one-third animate-box" data-animate-effect="fadeIn" style="background-image: url(uploads/images/3.jfif); "> 
								<a href="#" class="color-5">
									<div class="case-studies-summary">
										<span>Photo</span>
										<h2>See the horizon</h2>
									</div>
								</a>
							</li>
							<li class="two-third animate-box" data-animate-effect="fadeIn" style="background-image: url(uploads/images/4.jpg) ">
								<a href="#" class="color-6">
									<div class="case-studies-summary">
										<span>Love</span>
										<h2>Spend time with your partner</h2>
									</div>
								</a>
							</li>
						</ul>		
					</div>
				</div>

				<div class="row">
					<div class="col-md-4 col-md-offset-4 text-center animate-box">
						<a href="#" class="btn btn-primary btn-lg">More Gallery</a>
					</div>
				</div>

				
			</div>
		</div>
        <!--end: 자랑 게시판 -->


		

		<div id="fh5co-features">
            <div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
						<h3>고객 지원</h3>
						<p>공지사항, FAQ, 요청사항을 통해 소통하며 더 나은 서비스를 제공하겠습니다!</p>
					</div>
				</div>
			</div>
			<div class="container">
                <!-- start: 공지 -->
				<div class="row">
                    <div class="col-md-1">
						<div class="feature-left">
							<span class="icon">
								<i class="icon-bullhorn"></i>
							</span>
                        </div>
                    </div>

					<div class="col-md-5">
						<div class="feature-left">
							<div class="feature-copy">
								<h3>시스템 정기점검 안내</h3>
								<p>시스템 정기점검이 예정되어 있습니다. 점검 시간 동안 서비스 이용이 제한될 수 있으니 양해 부탁드립니다.</p>
							</div>
						</div>

					</div>

					<div class="col-md-5">
						<div class="feature-left">
							<div class="feature-copy">
								<h3>캐릭터 업데이트 안내</h3>
								<p>신규 캐릭터가 추가되었습니다! 다양한 캐릭터를 확인하고 업데이트된 기능을 즐겨보세요.</p>
							</div>
						</div>
					</div>
				</div>
                <!-- end: 공지 -->
                
                <!-- start: FAQ -->
				<div class="row">
					<div class="col-md-1">
						<div class="feature-left">
							<span class="icon">
								<i class="icon-question"></i>
							</span>
                        </div>
                    </div>

					<div class="col-md-5">
						<div class="feature-left">
							<div class="feature-copy">
								<h3>포인트 충전 방법 안내</h3>
								<p>포인트 충전은 [마이페이지] > [포인트 충전] 메뉴에서 가능합니다. 다양한 결제 수단을 이용해 충전해 보세요.</p>
							</div>
						</div>

					</div>

					<div class="col-md-5">
						<div class="feature-left">
							<div class="feature-copy">
								<h3>캐릭터 구매 방법 안내</h3>
								<p>원하는 캐릭터는 [스토어]에서 포인트로 구매할 수 있습니다. 구매 후 즉시 이용 가능합니다.</p>
							</div>
						</div>
					</div>
				</div>
                <!-- end: FAQ -->

                <!-- start: 요청 -->
				<div class="row">
					<div class="col-md-1">
						<div class="feature-left">
							<span class="icon">
								<i class="icon-pencil"></i>
							</span>
                        </div>
                    </div>

					<div class="col-md-5">
						<div class="feature-left">
							<div class="feature-copy">
								<h3>새로운 기능 제안</h3>
								<p>새로운 기능에 대한 제안을 환영합니다! 고객센터나 피드백 창구를 통해 의견을 남겨주세요.</p>
							</div>
						</div>

					</div>

					<div class="col-md-5">
						<div class="feature-left">
							<div class="feature-copy">
								<h3>캐릭터 추가 요청</h3>
								<p>추가를 원하는 캐릭터가 있다면 언제든지 제안해 주세요! 사용자 의견을 반영하여 업데이트에 반영하겠습니다.</p>
							</div>
						</div>
					</div>

                    <div class="row">
                        <div class="col-md-4 col-md-offset-4 text-center animate-box">
                            <a href="#" class="btn btn-primary btn-lg">더보기</a>
                        </div>
                    </div>

				</div>
                <!-- end: 요청 -->
			</div>
		</div>

		
		
		

		
		
		<!-- fh5co-content-section -->

		<div id="fh5co-services-section" class="fh5co-section-gray">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
						<h3>서비스 활용 방안</h3>
						<p>간편하게 소통하고 요청사항을 전달할 수 있는 고객 지원 플랫폼입니다.</p>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="row text-center">
					<div class="col-md-4 col-sm-4">
						<div class="service animate-box">
							<span><i class="icon-book"></i></span>
							<h3>어린이 교육</h3>
							<p>인기 캐릭터를 활용해 아이들의 학습 동기를 높입니다.</p>
						</div>
					</div>
					<div class="col-md-4 col-sm-4">
						<div class="service animate-box">
							<span><i class="icon-map-marker"></i></span>
							<h3>지자체 마스코트</h3>
							<p>버추얼 캐릭터로 지역 행사 및 관광을 홍보하고 이미지 제고에 기여합니다.</p>
						</div>
					</div>
					<div class="col-md-4 col-sm-4">
						<div class="service animate-box">
							<span><i class="icon-share"></i></span>
							<h3>플랫폼 연결</h3>
							<p>버추얼 캐릭터를 다양한 플랫폼과 콘텐츠로 확장합니다.</p>
						</div>
					</div>
					<div class="col-md-4 col-sm-4">
						<div class="service animate-box">
							<span><i class="icon-briefcase"></i></span>
							<h3>기업 마케팅</h3>
							<p>버추얼 캐릭터를 통해 소비자와의 상호작용을 극대화하여 브랜드 인지도를 높입니다.</p>
						</div>
					</div>
					<div class="col-md-4 col-sm-4">
						<div class="service animate-box">
							<span><i class="icon-video"></i></span>
							<h3>실시간 방송 및 이벤트</h3>
							<p>실시간으로 상호작용할 수 있는 버추얼 캐릭터를 활용해 온라인 방송을 진행합니다.</p>
						</div>
					</div>
					<div class="col-md-4 col-sm-4">
						<div class="service animate-box">
							<span><i class="icon-thumbs-up"></i></span>
							<h3>소셜 미디어 홍보</h3>
							<p>버추얼 캐릭터를 소셜 미디어에서 활용해 콘텐츠의 접근성을 향상시킵니다.</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- END What we do -->

        <div id="fh5co-feature-product">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
						<h3>서비스 소개 영상</h3>
						<p>주요 기능을 한눈에 볼 수 있는 간단한 가이드 영상입니다.</p>
					</div>
				</div>

				<div class="row row-bottom-padded-md">
					<div class="col-md-12 text-center animate-box">
						<p><img src="images/cover_bg_1.jpg" alt="Free HTML5 Bootstrap Template" class="img-responsive img-rounded"></p>
					</div>
					
				</div>
				
				<div class="row">
					<div class="col-md-12 text-center">
						<a href="https://vimeo.com/channels/staffpicks/93951774" class="link-watch popup-vimeo btn btn-primary"><i class="icon-play3"></i> Watch our video</a>
					</div>
				</div>
				
			</div>
		</div>

		<!-- fh5co-blog-section -->
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
