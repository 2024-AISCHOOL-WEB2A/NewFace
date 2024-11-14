<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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


		<div id="fh5co-blog-section" style="padding: 3em 0;">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
                        <h3>고객지원</h3>
                    </div>
                </div>
        
                <div class="row">
                    <!-- 카테고리 토글 버튼 -->
                    <div class="col-md-12 text-right">
                        <select id="category-filter" class="form-control" style="width: 150px; display: inline-block;" onchange="filterCategory()">
                            <option value="all">전체</option>
                            <option value="공지">공지</option>
                            <option value="FAQ">FAQ</option>
                            <option value="요청">요청</option>
                        </select>
                    </div>
                </div>
                <div class="row row-bottom-padded-md">
                    <div class="col-md-12">
                        <!-- 테이블 -->
                        <table class="table">
                            <thead>
                                <tr>
                                    <th width="10%" style="text-align: center;">순번</th>
                                    <th width="70%">제목</th>
                                    <th width="20%">날짜</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="post" items="${posts}" varStatus="status">
                                    <!-- 클릭 시 상세 내용 표시용 행 -->
                                    <tr onclick="toggleDetails(this)">
                                        <td style="text-align: center; padding: 20px;">${status.index + 1}</td>
                                        
                                        <!-- 카테고리에 따라 색상 지정 -->
                                        <td style="padding: 20px;">
                                            <c:choose>
                                                <c:when test="${post.customerServiceCategory == '공지'}">
                                                    <span style="color: red; font-weight: bold;">[공지]</span>
                                                </c:when>
                                                <c:when test="${post.customerServiceCategory == 'FAQ'}">
                                                    <span style="color: blue;font-weight: bold;">[FAQ]</span>
                                                </c:when>
                                                <c:when test="${post.customerServiceCategory == '요청'}">
                                                    <span style="color: green;font-weight: bold;">[요청]</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span >[${post.customerServiceCategory}]</span>
                                                </c:otherwise>
                                            </c:choose>
                                            <span style="color: black; font-weight: bold;">${post.customerServiceTitle}</span>
                                        </td>
                                        
                                        <td style="padding: 20px;">${post.customerServiceDate}</td>
                                    </tr>
                                    
                                    <!-- 상세 내용 행, 기본적으로 숨김 -->
                                    <tr style="display: none;">
                                        <td></td>
                                        <td colspan="2">${post.customerServiceContent}</td>
                                    </tr>
                                </c:forEach>

                                <!-- 추가 항목을 같은 형식으로 작성 -->
                            </tbody>
                        </table>
                    </div>
                </div>
                </div>

                <div class="row">
                    <!-- 페이징 영역 -->
                    <div class="col-md-12 text-center">
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
                            </ul>
                        </nav>
                    </div>
            
                    <!-- 등록하기 버튼 영역 -->
                    <div class="col-md-12 text-center">
                        <a href="/customerService/write" class="btn btn-primary" role="button" style="margin-top: 20px;">등록하기</a>
                    </div>
                </div>

            </div>
            <jsp:include page="common/footer.jsp" />
        </div>
        

	

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


<script>
    // 상세 내용을 토글하는 함수
    function toggleDetails(row) {
        const detailsRow = row.nextElementSibling;
        if (detailsRow && detailsRow.style) {
            detailsRow.style.display = detailsRow.style.display === 'none' ? 'table-row' : 'none';
        }
    }

    // 카테고리 필터링 함수
    function filterCategory() {
        const category = document.getElementById('category-filter').value;
        const rows = document.querySelectorAll('tbody tr');

        rows.forEach((row, index) => {
            if (index % 2 === 0) { // 메인 행만 필터링
                const categoryTag = row.querySelector('span');
                const isMatch = category === 'all' || (categoryTag && categoryTag.textContent.includes(`[${category}]`));
                row.style.display = isMatch ? '' : 'none';
                row.nextElementSibling.style.display = 'none'; // 상세 내용도 숨김
            }
        });
    }
</script>