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
    <link rel="stylesheet" href="/css/character_intro_detail.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .container_character {
            display: flex;
            align-items: center; /* 세로 가운데 정렬 */
            gap: 20px; /* 양옆 간격 */
        }
    
        .character-info {
            flex: 1; /* 정보를 담은 영역이 남은 공간을 차지 */
        }
    
        .character-image {
            flex: 1; /* 이미지 영역이 남은 공간을 차지 */
            display: flex;
            justify-content: center; /* 이미지를 가운데 정렬 */
        }
    
        .character-image img {
            max-width: 100%; /* 이미지가 영역을 넘어가지 않도록 조절 */
            height: auto; /* 비율 유지를 위해 자동 높이 조절 */
        }
    </style>


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


            <div >
                <div class="container container_character">
                    <div class="character-info">
                        <h1 style="color: #3f3f3f;">${character.characterName}</h1>
                        <p>${character.characterDescription}</p>
                        <button class="cta-button">체험하기 ➔</button>

                        <div class="card p-3" style="border: 1px solid #f1f1f1; border-radius: 8px;">
                            <table class="table table-borderless mb-0" style="font-family:  'Maplestory Bold';">
                                <tbody>
                                    <tr>
                                        <th scope="row" style="color: #6c757d; font-weight: 400; font-size: 15px;">성별</th>
                                        <td style="color: #7e7e7e; font-size: 15px;">
                                            여성
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" style="color: #6c757d; font-weight: 400; font-size: 15px;">좋아하는 것</th>
                                        <td style="color: #7e7e7e; font-size: 15px;">딸기 생크림 케이크</td>
                                    </tr>
                                    <tr>
                                        <th scope="row" style="color: #6c757d; font-weight: 400; font-size: 15px;">싫어하는 것</th>
                                        <td style="color: #7e7e7e; font-size: 15px;">신맛나는 것</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- <table class="table table-borderless table-sm character-details" style="color: #6c757d;">
                            <tr>
                                <th scope="row">성별</th>
                                <td>${character.characterGender}</td>
                            </tr>
                            <tr>
                                <th scope="row">좋아하는 것</th>
                                <td>${character.characterLikes}</td>
                            </tr>
                            <tr>
                                <th scope="row">싫어하는 것</th>
                                <td>${character.characterNolike}</td>
                            </tr>
                        </table> -->
                    </div>

                    <div class="character-image">
                        <img src="${character.characterImage}" alt="${character.characterName}">
                    </div>
                </div>
            </div>

            <div id="paymentModal" class="modal">
                <div class="modal-content">
                    <h2>결제 확인</h2>
                    <p>${character.characterName} 캐릭터를 1일 동안 <br>이용하시겠습니까?</p>
                    <p><img src="/image/happy.png">필요 스마일: 30P</p>
                    <div class="modal-buttons">
                        <button id="confirmPayment">확인</button>
                        <button id="cancelPayment">취소</button>
                    </div>
                </div>
            </div>




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
        document.addEventListener('DOMContentLoaded', function () {
            var paragraphs = document.querySelectorAll('.character-info p');
            paragraphs.forEach(function (p) {
                console.log(p.innerHTML);
                p.innerHTML = p.innerHTML.replace(/\r\n/g, '<br>'); // innerHTML로 수정
            });
        });

        // 모달 관련 요소들
        const modal = document.getElementById('paymentModal');
        const ctaButton = document.querySelector('.cta-button');
        const confirmBtn = document.getElementById('confirmPayment');
        const cancelBtn = document.getElementById('cancelPayment');

        // 체험하기 버튼 클릭 시
        ctaButton.addEventListener('click', () => {
            const isLoggedIn = document.querySelector('.greet') !== null;

            if (!isLoggedIn) {
                alert('로그인이 필요한 서비스입니다.');
                window.location.href = '/loginForm';
                return;
            }


            // 렌탈 상태 확인
            fetch(`/checkRentalStatus?characterIdx=${character.characterIdx}&userId=${sessionScope.loginUser.userIdx}`)
                .then(response => response.json())
                .then(rentalStatus => {
                    if (rentalStatus.isRented) {
                        alert('이미 대여 중인 캐릭터입니다.\n만료일: ' + rentalStatus.endDate);
                        window.location.href = '/characterExperience?characterIdx=${character.characterIdx}';
                    } else {
                        modal.style.display = 'block';
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('처리 중 오류가 발생했습니다.');
                });
        });


        // 확인 버튼 클릭 시
        confirmBtn.addEventListener('click', () => {
            fetch('/point/use', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: new URLSearchParams({
                    userId: '${sessionScope.loginUser.userIdx}',
                    characterIdx: '${character.characterIdx}',
                    points: 30
                })
            })
                .then(response => response.text())
                .then(result => {
                    if (result === 'success') {
                        alert('캐릭터 구매가 완료되었습니다.');
                        window.location.href = '/characterExperience?characterIdx=${character.characterIdx}';
                    } else {
                        alert(result);
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('처리 중 오류가 발생했습니다.');
                });
        });

        // 취소 버튼 클릭 시
        cancelBtn.addEventListener('click', () => {
            modal.style.display = 'none';
        });

        // 모달 외부 클릭 시 닫기
        window.addEventListener('click', (event) => {
            if (event.target === modal) {
                modal.style.display = 'none';
            }
        });
    </script>

</body>

</html>