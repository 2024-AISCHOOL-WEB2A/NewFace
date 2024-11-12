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
      
   Website:       http://freehtml5.co/
   Email:          info@freehtml5.co
   Twitter:       http://twitter.com/fh5co
   Facebook:       https://www.facebook.com/fh5co

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
   <style>
    .image-container {
        width: 100%;
        height: 200px; /* 고정 높이 설정으로 이미지가 잘 보이게 함 */
        overflow: hidden;
        border-radius: 8px;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
        display: flex;
        align-items: center;
        justify-content: center;
		background-color: white;
    }

    .image-container img {
        max-width: 100%;
        max-height: 100%;
        object-fit: contain; /* 이미지 비율 유지 */
    }
</style>


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
               <div class="row animate-box"
     style="border-radius: 5px; box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2); margin: 10px; color: white !important;">
    <c:forEach items="${characters}" var="character">
        <div class="col-md-3 fh5co-section-gray">
			<div class="fh5co-team text-center animate-box"
				 onclick="loadCategory('${character.characterCategory}')">
				<div class="image-container">
					<img src="${character.characterImage}" alt="${character.characterName}">
				</div>
				<p>${character.characterCategory}</p>
			</div>
		</div>
    </c:forEach>
</div>

               <!-- 캐릭터 목록 -->
               <div class="row row-bottom-padded-md">
                  <c:forEach items="${categoryCharacters}" var="character">
                     <div class="col-lg-2 col-md-4 col-sm-6">
                        <div class="fh5co-blog animate-box">
                           <a href="/character_intro/detail/${character.characterIdx}">
                              <img class="img-responsive" src="${character.characterImage}"
                                 alt="${character.characterName}">
                              <div class="blog-text">
                                 <div class="prod-title">
                                    <h3>${character.characterName}</h3>
                                 </div>
                              </div>
                           </a>
                        </div>
                     </div>
                  </c:forEach>
               </div>



              
            </div>
            <!-- END fh5co-page -->
			<jsp:include page="common/footer.jsp" />

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
            document.addEventListener('DOMContentLoaded', function () {
               // 모든 캐릭터 카테고리 요소에 클릭 이벤트 추가
               const categoryItems = document.querySelectorAll('.fh5co-team');

               categoryItems.forEach(item => {
                  item.addEventListener('click', function () {
                     // 클릭된 요소의 카테고리명 가져오기
                     const category = item.querySelector('p').textContent;
                     console.log("Clicked category:", category);
                     loadCategory(category);
                  });
               });
            });
            function loadCategory(category) {
               console.log("Category clicked:", category);
               fetch('/character_intro/ajax/' + encodeURIComponent(category))
                  .then(response => response.json())
                  .then(data => {
                     console.log("Received data:", data);

                     // 템플릿의 컨테이너 찾기
                     const container = document.querySelector('.row.row-bottom-padded-md');
                     if (!container) {
                        console.error("Container not found!");
                        return;
                     }

                     container.innerHTML = '';

                     data.forEach(character => {
                        const card =
                           '<div class="col-lg-2 col-md-4 col-sm-6">' +
                           '<div class="fh5co-blog animate-box fadeInUp animated">' +
                           '<a href="/character_intro/detail/' + character.characterIdx + '">' +
                           '<img class="img-responsive" src="' + character.characterImage + '" alt="' + character.characterName + '">' +
                           '<div class="blog-text">' +
                           '<div class="prod-title">' +
                           '<h3>' + character.characterName + '</h3>' +
                           '<p><a href="/character_intro/detail/' + character.characterIdx + '">더보기...</a></p>' +
                           '</div>' +
                           '</div>' +
                           '</a>' +
                           '</div>' +
                           '</div>';

                        container.insertAdjacentHTML('beforeend', card);
                     });

                  })
                  .catch(error => {
                     console.error('Error:', error);
                  });
            }
         </script>

</body>

</html>