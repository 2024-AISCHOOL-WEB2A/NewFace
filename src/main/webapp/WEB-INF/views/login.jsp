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
                    transform: scale(1.05); /* 살짝 확대 */
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

                /*모달관련*/
                /* Modal Styles */
                /* .modal-overlay {
    display: none; 
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    z-index: 1000;
    justify-content: center;
    align-items: center;
}

.modal-container {
    background-color: #fff;
    padding: 20px 30px; 
    border-radius: 8px;
    width: 90%;
    max-width: 400px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1); 
    text-align: center; 
}

.modal-title {
    font-size: 20px; 
    font-weight: bold;
    margin-bottom: 15px;
    color: #FF3B69; 
}

.modal-content {
    font-size: 16px;
    margin-bottom: 20px;
    color: #333; 
}

.modal-buttons {
    display: flex;
    justify-content: center;
}

.modal-button {
    padding: 10px 25px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
    font-weight: bold;
}

.confirm-button {
    background-color: #FF3B69;
    color: white;
    transition: background-color 0.3s ease;
}

.confirm-button:hover {
    background-color: #e63461;
} */

.custom-confirm-button {
        background-color: #FF3B69; /* 버튼 배경 색 */
        color: white; /* 버튼 텍스트 색 */
        border: none;
        border-radius: 5px;
        padding: 6px 12px;
        font-size: 14px;
        font-weight: bold;
        cursor: pointer;
    }

.custom-confirm-button:hover {
    background-color: #e63461; /* 호버 시 색상 */
}

            </style>
            <!-- FOR IE9 below -->
            <!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

        <!-- SweetAlert2 CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
        <!-- SweetAlert2 JS -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>    
        
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
                                <h3 style="color: #FF3B69; font-family: Open Sans, Arial, sans-serif;">Log in</h3>
                            </div>

                            <form class="form" action="/custom_login" method="post">
                                <div class="form-group">
                                    <label for="userId">아이디</label>
                                    <input type="text" id="userId" name="userId" placeholder="아이디를 입력하세요." required>
                                    <label for="userPw">비밀번호</label>
                                    <input type="password" id="userPw" name="userPw" placeholder="비밀번호를 입력하세요." required>
                                </div>
                                <button class="form-submit-btn" type="submit">Login</button>
                            </form>


                            <p class="signup-link">
                                회원이 아니신가요?
                                <a href="/joinForm" class="signup-link link"> 회원가입</a>
                            </p>
                            <!-- Google 로그인 버튼 -->
                            <button class="social-button google">
                                <a href="/oauth2/authorization/google" style="color: #4285F4 !important;">
                                    <svg class="svg" xmlns="http://www.w3.org/2000/svg" height="1em"
                                        viewBox="0 0 488 512">
                                        <path
                                            d="M488 261.8C488 403.3 391.1 504 248 504 110.8 504 0 393.2 0 256S110.8 8 248 8c66.8 0 123 24.5 166.3 64.9l-67.5 64.9C258.5 52.6 94.3 116.6 94.3 256c0 86.5 69.1 156.6 153.7 156.6 98.2 0 135-70.4 140.8-106.9H248v-85.3h236.1c2.3 12.7 3.9 24.9 3.9 41.4z">
                                        </path>
                                    </svg> 구글로 로그인하기
                                </a>
                            </button>

                            <!-- Naver 로그인 버튼 -->
                            <button class="social-button naver">
                                <a href="/oauth2/authorization/naver" style="color: #03C75A !important;">
                                    <svg class="svg" xmlns="http://www.w3.org/2000/svg" height="1em"
                                        viewBox="0 0 448 512">
                                        <path
                                            d="M448 32V480C448 497.7 433.7 512 416 512H320C302.3 512 288 497.7 288 480V294.2L160 480H64C46.33 480 32 465.7 32 448V32C32 14.33 46.33 0 64 0H160C177.7 0 192 14.33 192 32V217.8L320 32H416C433.7 32 448 46.33 448 64z">
                                        </path>
                                    </svg> 네이버로 로그인하기
                                </a>
                            </button>

                        </div>
                    </div>
                </div>


                <!-- END fh5co-page -->

            </div>

            <!-- 모달 추가 -->
            <!-- <div id="errorModal" class="modal-overlay">
                <div class="modal-container">
                    <div class="modal-title">
                        <h2>로그인 오류</h2> 
                    </div>
                    <div id="modalMessage" style="margin-bottom: 30px;">
                        아이디 또는 비밀번호가 일치하지 않습니다.
                    </div>
                    <div class="modal-buttons">
                        <button class="modal-button confirm-button" onclick="closeModal()">확인</button>
                    </div>
                </div>
            </div> -->
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
            window.onload = function () {
                var loginError = "${loginError}";
                if (loginError && loginError.trim() !== "") {
                    Swal.fire({
                        title: '로그인 오류',
                        text: '아이디 또는 비밀번호가 일치하지 않습니다.',
                        icon: 'error',
                        confirmButtonText: '확인',
                        customClass: {
                            confirmButton: 'custom-confirm-button'
                        }
                    });
                }
            };

                function showModal(message) {
                    const modal = document.getElementById('errorModal');
                    const modalMessage = document.getElementById('modalMessage');
                    modalMessage.textContent = message;
                    modal.style.display = 'flex';
                }

                function closeModal() {
                    const modal = document.getElementById('errorModal');
                    modal.style.display = 'none';
                }

                // 모달 외부 클릭 시 닫기
                window.onclick = function (event) {
                    const modal = document.getElementById('errorModal');
                    if (event.target === modal) {
                        closeModal();
                    }
                };

            </script>

        </body>

        </html>