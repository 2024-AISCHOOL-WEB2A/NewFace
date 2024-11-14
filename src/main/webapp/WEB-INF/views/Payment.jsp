<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                    <link rel="stylesheet" href="/css/payment.css">



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


                            <div class="content-container">
                                <div class="profile-section" style="box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);">
                                    <img class="circle-image"
                                        src="${empty user.userProfilePicture || user.userProfilePicture eq 'default.jpg' ? '/image/default.png' : user.userProfilePicture}" alt="프로필 이미지">
                                    <h2 class="username">${user.userNickname}님</h2>
                                    <button class="edit-btn">수정</button>
                                    <p class="email">${user.userEmail}</p>

                                    <div class="button-section">
                                        <div class="point-display">
                                            <img src="/image/happy.png" alt="포인트 아이콘">
                                            <span class="point-amount">${currentTotal}</span>
                                        </div>
                                        <button class="charge-button">충전하기</button>
                                    </div>
                                </div>


                                <div class="usage-section" style="box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);">
                                    <div class="usage-header">
                                        <img src="/image/happy.png" alt="사용 내역 아이콘" class="section-icon">
                                        <h2 style="margin: 0;">사용 내역</h2>
                                    </div>
                                    <div class="usage-list">
                                        <!-- 충전 내역 -->
                                        <c:forEach var="payment" items="${allPayments}">
                                            <div class="usage-item">
                                                <div class="item-title">
                                                    ${payment.pointAmount > 0 ? '스마일 충전' : '스마일 사용'}
                                                </div>
                                                <div class="item-date">
                                                    ${payment.formattedPointDate}
                                                </div>
                                                <div
                                                    class="item-amount ${payment.pointAmount > 0 ? 'positive' : 'negative'}">
                                                    ${payment.pointAmount > 0 ? '+' : ''}${payment.pointAmount}
                                                </div>
                                                <div class="item-total">${payment.totalPoints}</div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <!-- 사용 내역 -->
                                    <c:forEach var="usePayment" items="${usePayments}">
                                        <div class="usage-item">
                                            <div class="item-title">스마일 사용${character.character_name}</div>
                                            <div class="item-date">
                                                ${usePayment.formattedPointDate}
                                            </div>
                                            <div class="item-amount negative">${usePayment.pointAmount}</div>
                                            <div class="item-total">${usePayment.totalPoints}</div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>

                    <!-- 충전 모달 -->
                    <div class="modal" id="chargeModal">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h2><img src="/image/happy.png">스마일 충전</h2>
                                <span class="close">&times;</span>
                            </div>
                            <div class="modal-body">
                                <div class="charge-options">
                                    <button class="charge-option" data-amount="100" data-point="100">
                                        <span class="point-amount">100 스마일</span>
                                        <span class="price">100원</span>
                                    </button>
                                    <button class="charge-option" data-amount="300" data-point="300">
                                        <span class="point-amount">300 스마일</span>
                                        <span class="price">300원</span>
                                    </button>
                                    <button class="charge-option" data-amount="500" data-point="500">
                                        <span class="point-amount">500 스마일</span>
                                        <span class="price">500원</span>
                                    </button>
                                    <button class="charge-option" data-amount="1000" data-point="1000">
                                        <span class="point-amount">1000 스마일</span>
                                        <span class="price">1,000원</span>
                                    </button>
                                </div>
                                <button class="charge-button" onclick="requestPayment()" disabled>충전하기</button>
                            </div>
                        </div>
                    </div>

                    <!-- 회원정보 수정 모달 -->
                    <div class="edit-profile-modal" id="editProfileModal">
                        <div class="edit-profile-content">
                            <div class="edit-profile-header">
                                <h2>회원정보 수정</h2>
                                <span class="close">&times;</span>
                            </div>
                            <div class="edit-profile-body">
                                <form id="profileEditForm" method="post" enctype="multipart/form-data">
                                    <div class="profile-edit-section">
                                        <input type="hidden" name="userIdx" value="${user.userIdx}">
                                        <!-- 프로필 이미지 영역 -->
                                        <div class="profile-image-upload">
                                            <img id="profilePreview"
                                                src="${user.userProfilePicture != null ? user.userProfilePicture : '/image/default-profile.png'}"
                                                alt="프로필 이미지">
                                            <input type="file" id="profileImage" name="profileImage" accept="image/*">
                                            <label for="profileImage" class="upload-btn">이미지 수정</label>
                                        </div>

                                        <!-- 개인정보 입력 영역 -->
                                        <div class="edit-form-group">
                                            <label for="userId">아이디</label>
                                            <input type="text" id="userId" value="${user.userId}" readonly
                                                class="readonly-input">
                                        </div>

                                        <div class="edit-form-group">
                                            <label for="nickname">닉네임</label>
                                            <input type="text" id="nickname" name="userNickname"
                                                value="${user.userNickname}">
                                        </div>

                                        <div class="edit-form-group">
                                            <label for="userEmail">이메일</label>
                                            <input type="email" id="userEmail" value="${user.userEmail}" readonly
                                                class="readonly-input">
                                        </div>

                                        <!-- 버튼 영역 -->
                                        <div class="edit-button-group">
                                            <button type="submit" class="save-profile-btn">저장하기</button>
                                            <button type="button" class="delete-account-btn">회원탈퇴</button>
                                        </div>
                                    </div>
                                </form>
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
                    <script src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>


                    <script>
                        var IMP = window.IMP;
                        IMP.init("imp17165638");

                        let selectedAmount = 0;
                        let selectedPoint = 0;

                        document.addEventListener('DOMContentLoaded', function () {
                            const modal = document.getElementById('chargeModal');

                            // 충전하기 버튼 클릭시 모달 열기
                            document.querySelector('.profile-section .charge-button').onclick = function () {
                                modal.style.display = 'block';
                            }

                            // 모달 닫기
                            document.querySelector('.close').onclick = function () {
                                modal.style.display = 'none';
                            }

                            // 모달 외부 클릭시 닫기
                            window.onclick = function (event) {
                                if (event.target == modal) {
                                    modal.style.display = 'none';
                                }
                            }

                            // 충전 금액 선택 처리
                            document.querySelectorAll('.charge-option').forEach(button => {
                                button.addEventListener('click', function () {
                                    document.querySelectorAll('.charge-option').forEach(btn => {
                                        btn.classList.remove('selected');
                                    });
                                    this.classList.add('selected');
                                    selectedAmount = parseInt(this.dataset.amount);
                                    selectedPoint = parseInt(this.dataset.point);
                                    document.querySelector('.modal .charge-button').disabled = false;
                                });
                            });
                        });

                        function requestPayment() {
                            if (selectedAmount <= 0) {
                                alert('충전할 금액을 선택해주세요.');
                                return;
                            }

                            IMP.request_pay({
                                pg: 'html5_inicis.INIpayTest',
                                pay_method: 'card',
                                merchant_uid: "order_" + new Date().getTime(),
                                name: selectedPoint + ' 스마일 충전',
                                amount: selectedAmount,
                                buyer_email: '${user.userEmail}',
                                buyer_name: '${user.userNickname}'
                            }, function (rsp) {
                                if (rsp.success) {
                                    // 결제 성공 시 포인트 적립 요청
                                    $.ajax({
                                        url: '/payment/complete',
                                        method: 'POST',
                                        data: {
                                            amount: selectedAmount,
                                            userId: '${user.userIdx}',
                                            paymentId: rsp.imp_uid,
                                            points: selectedPoint
                                        },
                                        success: function (response) {
                                            alert('스마일 충전이 완료되었습니다.');
                                            location.reload();
                                        },
                                        error: function (error) {
                                            alert('스마일 적립 중 오류가 발생했습니다.');
                                        }
                                    });
                                } else {
                                    alert('결제에 실패하였습니다.\n' + rsp.error_msg);
                                }
                                modal.style.display = 'none';
                            });
                        }
                    </script>


                    <script>
                        document.addEventListener('DOMContentLoaded', function () {
                            const chargeModal = document.getElementById('chargeModal');
                            const profileEditModal = document.getElementById('editProfileModal');
                            const profileEditBtn = document.querySelector('.profile-section .edit-btn');
                            const profileCloseBtn = profileEditModal.querySelector('.close');
                            const profileForm = document.getElementById('profileEditForm');
                            const profileImageInput = document.getElementById('profileImage');
                            const profilePreview = document.getElementById('profilePreview');
                            const deleteAccountBtn = document.querySelector('.delete-account-btn');

                            // 충전하기 버튼 클릭시 모달 열기
                            document.querySelector('.profile-section .charge-button').onclick = function () {
                                chargeModal.style.display = 'block';
                            }

                            // 충전 모달 닫기
                            document.querySelector('#chargeModal .close').onclick = function () {
                                chargeModal.style.display = 'none';
                            }

                            // 수정 버튼 클릭시 모달 열기
                            profileEditBtn.onclick = function () {
                                profileEditModal.style.display = 'block';
                            }

                            // 프로필 수정 모달 닫기
                            document.querySelector('#editProfileModal .close').onclick = function () {
                                profileEditModal.style.display = 'none'
                            }

                            // 모달 외부 클릭시 닫기
                            window.onclick = function (event) {
                                if (event.target == chargeModal) {
                                    chargeModal.style.display = 'none';
                                }
                                if (event.target == profileEditModal) {
                                    profileEditModal.style.display = 'none';
                                }
                            }

                            // 이미지 미리보기
                            profileImageInput.onchange = function () {
                                const file = this.files[0];
                                if (file) {
                                    const reader = new FileReader();
                                    reader.onload = function (e) {
                                        profilePreview.src = e.target.result;
                                    }
                                    reader.readAsDataURL(file);
                                }
                            }

                            // 프로필 수정 제출
                            profileForm.onsubmit = function (e) {
                                e.preventDefault();
                                const formData = new FormData(this);

                                $.ajax({
                                    url: '/user/updateProfile',
                                    type: 'POST',
                                    data: formData,
                                    processData: false,  // FormData를 처리하지 않도록 설정
                                    contentType: false,  // 컨텐츠 타입을 설정하지 않도록 설정
                                    success: function (response) {
                                        console.log('Response:', response);  // 응답 확인을 위한 로그
                                        alert('프로필이 성공적으로 수정되었습니다.');
                                        location.reload();
                                    },
                                    error: function (error) {
                                        console.error('Error:', error);
                                        alert('프로필 수정에 실패했습니다.');
                                    }
                                });
                            };


                            // 회원 탈퇴
                            deleteAccountBtn.onclick = function () {
                                if (confirm('정말로 탈퇴하시겠습니까? 이 작업은 되돌릴 수 없습니다.')) {
                                    $.ajax({
                                        url: '/user/delete',
                                        type: 'POST',
                                        beforeSend: function (xhr) {
                                            xhr.setRequestHeader("X-CSRF-TOKEN", $("meta[name='_csrf']").attr("content"));
                                        },
                                        success: function (response) {
                                            if (response.success) {
                                                alert('회원탈퇴가 완료되었습니다.');
                                                window.location.href = '/';
                                            } else {
                                                alert(response.error || '회원탈퇴에 실패했습니다.');
                                            }
                                        },
                                        error: function (xhr) {
                                            if (xhr.status === 401) {
                                                window.location.href = '/loginForm';
                                            } else {
                                                alert('회원탈퇴 처리 중 오류가 발생했습니다.');
                                            }
                                        }
                                    });
                                }
                            }
                        }
                        );
                    </script>



                </body>

                </html>