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
            <meta name="keywords"
                content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
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

            <style>
                /* 기본 중앙 정렬 설정 */
                #fh5co-blog-section {
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    padding: 5rem 0;
                    /* 상하 여백 추가 */

                }

                .blog-section {
                    padding: 3em 0 !important;
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

                    <div id="fh5co-blog-section" class="d-flex justify-content-center align-items-center vh-100">
                        <div class="bg-white p-5 rounded shadow text-center" style="max-width: 450px; width: 100%; padding: 3rem;">
                            <!-- 로고 섹션 -->
                            <div class="logo mb-5">
                                <img src="image/logo.png" alt="New Face Logo" class="img-fluid" style="max-width: 150px;">
                            </div>
                    
                            <!-- 로그인 폼 섹션 -->
                            <form action="/custom_login" method="post" class="mb-5">
                                <div class="mb-4">
                                    <input type="text" class="form-control" name="userId" placeholder="ID" required style="padding: 1rem;">
                                </div>
                                <div class="mb-4">
                                    <input type="password" class="form-control" name="userPw" placeholder="Password" required style="padding: 1rem;">
                                </div>
                                <button type="submit" class="btn btn-primary w-100 py-3" style="margin-top: 30px; max-width:300px;">Login</button>
                            </form>
                    
                            <!-- 구분선 섹션 -->
                            <div class="divider text-center my-5" style="margin: 10px;">
                                <span class="px-3 text-muted">또는</span>
                            </div>
                    
                            <!-- 소셜 로그인 버튼 섹션 -->
                            <div class="d-flex flex-column align-items-center" style="width: 100%; max-width: 500px; flex-direction: column; display: flex;">
                                <a href="/oauth2/authorization/google" class="btn btn-outline-secondary py-3 mb-3" style="margin:1px 80px 1px 80px; border: 1px solid lightgray;">Google로 계속하기</a>
                                <a href="/oauth2/authorization/naver" class="btn btn-success py-3 mb-3" style="margin:1px 80px 1px 80px;">Naver로 계속하기</a>
                                <a href="/oauth2/authorization/kakao" class="btn btn-warning py-3" style="margin:1px 80px 1px 80px;">Kakao로 계속하기</a>
                            </div>
                            
                        </div>
                    </div>
                    
                    
                    
                    <jsp:include page="common/footer.jsp" />
                    <!-- END fh5co-page -->

                </div>

                
                <!-- Modal -->
                <div id="modal" class="modal">
                    <div class="modal-content">
                        <div class="modal-body">
                            <p id="modal-message"></p>
                        </div>
                        <div class="modal-footer">
                            <button id="confirm-btn" class="btn confirm">확인</button>
                        </div>
                    </div>
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

                <script>
                    $(document).ready(function() {
                        let isIdValid = false;
                        let isEmailValid = false;
                        let emailCheckTimer;
                
                        // 이메일 형식 검증 함수
                        function isValidEmail(email) {
                            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                            return emailRegex.test(email);
                        }
                
                         // 아이디 중복 체크
                            $("#userId").on('input', function() {
                                let userId = $(this).val();
                                if(userId) {
                                    $.ajax({
                                        url: "/checkId",
                                        type: "GET",
                                        data: { userId: userId },
                                        success: function(available) {
                                            if(available) {
                                                $("#idMessage").text("사용 가능한 아이디입니다.").css("color", "green");
                                                isIdValid = true;
                                            } else {
                                                $("#idMessage").text("이미 사용중인 아이디입니다.").css("color", "red");
                                                isIdValid = false;
                                            }
                                        }
                                    });
                                }
                            });
                
                        // 이메일 입력 시 실시간 형식 검증
                        $("#userEmail").on('input', function() {
                            clearTimeout(emailCheckTimer);
                            const email = $(this).val();
                            
                            if(email) {
                                if(!isValidEmail(email)) {
                                    $("#emailMessage").text("올바른 이메일 형식이 아닙니다.").css("color", "red");
                                    isEmailValid = false;
                                    return;
                                }
                
                                // 타이핑 완료 0.5초 후 자동 중복 체크
                                emailCheckTimer = setTimeout(function() {
                                    checkEmail(email);
                                }, 500);
                            } else {
                                $("#emailMessage").text("").css("color", "black");
                            }
                        });
                
                        // 이메일 중복 확인 버튼 클릭
                        $("#emailCheckBtn").click(function(e) {
                            e.preventDefault();
                            const email = $("#userEmail").val();
                            
                            if(!email) {
                                $("#emailMessage").text("이메일을 입력해주세요.").css("color", "red");
                                return;
                            }
                
                            if(!isValidEmail(email)) {
                                $("#emailMessage").text("올바른 이메일 형식이 아닙니다.").css("color", "red");
                                return;
                            }
                
                            checkEmail(email);
                        });
                
                        // 이메일 중복 체크 함수
                        function checkEmail(email) {
                            $.ajax({
                                url: "/checkEmail",
                                type: "GET",
                                data: { userEmail: email },
                                success: function(available) {
                                    if(available) {
                                        $("#emailMessage").text("사용 가능한 이메일입니다.").css("color", "green");
                                        isEmailValid = true;
                                    } else {
                                        $("#emailMessage").text("이미 사용중인 이메일입니다.").css("color", "red");
                                        isEmailValid = false;
                                    }
                                }
                            });
                        }
                
                        // 폼 제출 전 검증
                        $("#joinForm").submit(function(e) {
                            if(!isIdValid || !isEmailValid) {
                                e.preventDefault();
                                alert("아이디와 이메일을 확인해주세요.");
                                return false;
                            }
                        });
                    });
                
                    // 모달 관련 스크립트
                    const message = "${message}";
                    const error = "${error}";
                    window.onload = function() {
                        const modal = document.getElementById('modal');
                        const modalMessage = document.getElementById('modal-message');
                        const confirmBtn = document.getElementById('confirm-btn');
                        
                        function addLineBreaks(text) {
                            return text.replace(/:\s*/g, ':<br>');
                        }
                
                        if (message || error) {
                            modal.style.display = "block";
                            modalMessage.innerHTML = addLineBreaks(message || error); 
                            confirmBtn.onclick = function() {
                                modal.style.display = "none";
                                if (message) {
                                    window.location.href = "/loginForm";
                                }
                            };
                        }
                    };
                    </script>

        </body>

        </html>