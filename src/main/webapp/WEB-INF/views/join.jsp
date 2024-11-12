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
                /* From Uiverse.io by gharsh11032000 */
                .form-container {
                    width: 350px;
                    background-color: #fff;
                    padding: 32px 24px;
                    font-size: 14px;
                    font-family: inherit;
                    color: #212121;
                    display: flex;
                    flex-direction: column;
                    gap: 10px;
                    box-sizing: border-box;
                    border-radius: 10px;
                    box-shadow: 0px 0px 3px rgba(0, 0, 0, 0.084), 0px 2px 3px rgba(0, 0, 0, 0.168);
                }

                .form-container button:active {
                    scale: 0.95;
                }

                .form-container .logo-container {
                    font-size: 15px;
                    color: #FF3B69;
                    text-align: center;
                    font-weight: 600;
                    font-size: 18px;
                }

                .form-container .form {
                    display: flex;
                    flex-direction: column;
                }

                .form-container .form-group {
                    display: flex;
                    flex-direction: column;
                    gap: 2px;
                }

                .form-container .form-group label {
                    display: block;
                    margin-bottom: 5px;
                }

                .form-container .form-group input {
                    width: 100%;
                    padding: 12px 16px;
                    border-radius: 6px;
                    font-family: inherit;
                    border: 1px solid #ccc;
                }

                .form-container .form-group input::placeholder {
                    opacity: 0.5;
                }

                .form-container .form-group input:focus {
                    outline: none;
                    border-color: #1778f2;
                }

                .form-container .form-submit-btn {
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    font-family: inherit;
                    color: #fff;
                    background-color: #FF3B69;
                    border: none;
                    width: 100%;
                    padding: 12px 16px;
                    font-size: inherit;
                    gap: 8px;
                    margin: 12px 0;
                    cursor: pointer;
                    border-radius: 6px;
                    box-shadow: 0px 0px 3px rgba(0, 0, 0, 0.084), 0px 2px 3px rgba(0, 0, 0, 0.168);
                }

                .form-container .form-submit-btn:hover {
                    background-color: #313131;
                }

                .form-container .link {
                    color: #1778f2;
                    text-decoration: none;
                }

                .form-container .signup-link {
                    align-self: center;
                    font-weight: 500;
                }

                .form-container .signup-link .link {
                    font-weight: 400;
                }

                .form-container .link:hover {
                    text-decoration: underline;
                }

                .social-button {
                    display: flex;
                    align-items: center;
                    gap: 8px;
                    font-weight: bold;
                    padding: 10px 15px;
                    border-radius: 10px;
                    color: white;
                    border: none;
                    width: 100%;
                    cursor: pointer;
                    justify-content: center;
                    transition: transform 0.2s;
                    max-width: 300px;
                    /* 필요하면 최대 너비를 지정 */
                }

                .social-button.google {
                    background-color: #ffffff;
                    border: #1778f2 solid 1px;
                }

                .social-button.naver {
                    background-color: #ffffff;
                    border: #03C75A solid 1px;
                }

                .social-button.kakao {
                    background-color: #FEE500;
                    color: #3D1D1D;
                }

                .social-button:hover {
                    transform: scale(1.05);
                }

                .social-button .svg {
                    fill: currentColor;
                }

                .social_row {
                    display: flex;
                    justify-content: space-between;
                    /* 버튼들 사이에 간격 추가 */
                    align-items: center;
                    gap: 10px;
                    /* 버튼 간 간격 조정 */
                    margin-top: 10px;
                }

                /*모달창*/
                .modal {
                    display: none;
                    position: fixed;
                    z-index: 1000;
                    left: 0;
                    top: 0;
                    width: 100%;
                    height: 100%;
                    background-color: rgba(0, 0, 0, 0.5);
                }

                .modal-content {
                    background-color: #fff;
                    margin: 15% auto;
                    padding: 20px;
                    width: 80%;
                    max-width: 400px;
                    border-radius: 10px;
                    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                }

                .modal-body {
                    text-align: center;
                    margin-bottom: 20px;
                }

                .modal-footer {
                    display: flex;
                    justify-content: center;
                    gap: 10px;
                }

                .btn {
                    padding: 8px 20px;
                    border: none;
                    border-radius: 5px;
                    cursor: pointer;
                    font-weight: 500;
                }

                .btn.confirm {
                    background-color: #FF3B69;
                    color: white;
                }

                .btn.cancel {
                    background-color: #6c757d;
                    color: white;
                }

                .btn:hover {
                    opacity: 0.9;
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

                    <div style="display: flex; justify-content: center; align-items: center; margin: 20px;">
                        <div class="form-container">
                            <div class="logo-container">
                                <h3 style="color: #FF3B69; font-family: Open Sans, Arial, sans-serif;">Sign up</h3>
                            </div>

                            <form class="form" action="/join" method="post" id="joinForm">
                                <div class="form-group">
                                    <label for="userId">아이디</label>
                                    <input type="text" name="userId" placeholder="아이디를 입력하세요." required="" id="userId">
                                    <span id="idMessage" class="form-text text-danger"></span>

                                    <label for="email">비밀번호</label>
                                    <input type="password" name="userPw" placeholder="비밀번호를 입력하세요." required=""
                                        id="userPw">

                                    <label for="email">닉네임</label>
                                    <input type="text" name="userNickname" placeholder="닉네임을 입력하세요." required=""
                                        id="userNickname">

                                    <label for="email">이메일</label>
                                    <input type="email" name="userEmail" placeholder="이메일을 입력하세요." required=""
                                        id="userEmail">
                                    <span id="emailMessage" class="form-text text-danger"></span>
                                </div>

                                <button class="form-submit-btn" type="submit">Sign up</button>
                            </form>

                        </div>
                    </div>
                </div>



                <jsp:include page="common/footer.jsp" />
                <!-- END fh5co-page -->

                <!-- Modal -->
                <div id="modal" class="modal">
                    <div class="modal-content">
                        <div class="modal-body">
                            <p id="modal-message"></p>
                        </div>
                        <div class="modal-footer">
                            <button id="confirm-btn" class="btn confirm">확인</button>
                            <button id="cancel-btn" class="btn cancel">취소</button>
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
                    $(document).ready(function () {
                        let isIdValid = false;
                        let isEmailValid = false;
                        let emailCheckTimer;

                        // 이메일 형식 검증 함수
                        function isValidEmail(email) {
                            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                            return emailRegex.test(email);
                        }

                        // 아이디 중복 체크
                        $("#userId").on('input', function () {
                            let userId = $(this).val();
                            if (userId) {
                                $.ajax({
                                    url: "/checkId",
                                    type: "GET",
                                    data: { userId: userId },
                                    success: function (available) {
                                        if (available) {
                                            $("#idMessage").text("사용 가능한 아이디입니다.").css("color", "green");
                                            isIdValid = true;
                                        } else {
                                            $("#idMessage").text("이미 사용중인 아이디입니다.").css("color", "red");
                                            isIdValid = false;
                                        }
                                    }
                                });
                            } else {
                                $("#idMessage").text("").css("color", "black");
                                isIdValid = false;
                            }
                        });

                        // 이메일 입력 시 실시간 형식 검증
                        $("#userEmail").on('input', function () {
                            clearTimeout(emailCheckTimer);
                            const email = $(this).val();

                            if (email) {
                                if (!isValidEmail(email)) {
                                    $("#emailMessage").text("올바른 이메일 형식이 아닙니다.").css("color", "red");
                                    isEmailValid = false;
                                    return;
                                }

                                // 타이핑 완료 0.5초 후 자동 중복 체크
                                emailCheckTimer = setTimeout(function () {
                                    checkEmail(email);
                                }, 500);
                            } else {
                                $("#emailMessage").text("").css("color", "black");
                                isEmailValid = false;
                            }
                        });

                        // 이메일 중복 체크 함수
                        function checkEmail(email) {
                            $.ajax({
                                url: "/checkEmail",
                                type: "GET",
                                data: { userEmail: email },
                                success: function (available) {
                                    if (available) {
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
                        $("#joinForm").submit(function (e) {
                            e.preventDefault();

                            if (!isIdValid || !isEmailValid) {
                                alert("아이디와 이메일을 확인해주세요.");
                                return false;
                            }

                            const nickname = $("#userNickname").val();

                            // AJAX로 회원가입 처리
                            $.ajax({
                                url: "/join",
                                type: "POST",
                                data: $(this).serialize(),
                                success: function (response) {
                                    if (response.success) {
                                        showSuccessModal(response.nickname);
                                    } else {
                                        alert(response.message);
                                    }
                                },
                                error: function (error) {
                                    alert("회원가입 중 오류가 발생했습니다.");
                                }
                            });
                        });
                    });

                    // 회원가입 성공 모달 표시 함수
                    function showSuccessModal(nickname) {
                        const modal = document.getElementById('modal');
                        const modalMessage = document.getElementById('modal-message');
                        const confirmBtn = document.getElementById('confirm-btn');
                        const cancelBtn = document.getElementById('cancel-btn');

                        modalMessage.innerHTML = nickname + "님 회원가입을 축하합니다!<br>로그인으로 이동하시려면 확인을 눌러주세요";
                        modal.style.display = "block";

                        // 확인 버튼 클릭 시
                        confirmBtn.onclick = function () {
                            modal.style.display = "none";
                            window.location.href = "/loginForm";
                        };

                        // 취소 버튼 클릭 시
                        cancelBtn.onclick = function () {
                            modal.style.display = "none";
                            window.location.href = "/";
                        };

                        // 모달 외부 클릭 시
                        window.onclick = function (event) {
                            if (event.target == modal) {
                                modal.style.display = "none";
                                window.location.href = "/";
                            }
                        };
                    }

                    // 페이지 로드 시 에러/메시지 처리
                    window.onload = function () {
                        const message = "${message}";
                        const error = "${error}";

                        if (message || error) {
                            const modal = document.getElementById('modal');
                            const modalMessage = document.getElementById('modal-message');
                            const confirmBtn = document.getElementById('confirm-btn');

                            function addLineBreaks(text) {
                                return text.replace(/:\s*/g, ':<br>');
                            }

                            modal.style.display = "block";
                            modalMessage.innerHTML = addLineBreaks(message || error);
                            confirmBtn.onclick = function () {
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