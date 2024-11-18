<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Module &mdash; 100% Free Fully Responsive HTML5 Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
    <meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
    <meta name="author" content="FREEHTML5.CO" />

    <link rel="shortcut icon" href="favicon.ico">
    <link rel="stylesheet" href="/css/animate.css">
    <link rel="stylesheet" href="/css/icomoon.css">
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/css/superfish.css">
    <link rel="stylesheet" href="/css/magnific-popup.css">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/payment.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">

    <script src="/js/modernizr-2.6.2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>

<body>
    <div id="fh5co-wrapper">
        <div id="fh5co-page">
            <jsp:include page="common/header.jsp" />

            <div class="content-container">
                <div class="profile-section" style="box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);">
                    <img class="circle-image" 
                        src="${empty user.userProfilePicture || user.userProfilePicture eq 'default.jpg' ? '/image/default.png' : user.userProfilePicture}" 
                        alt="프로필 이미지">
                    <h2 class="username">${user.userNickname} 님</h2>
                    <p class="email">${user.userEmail}</p>

                    <div class="button-section">
                        <div class="point-display">
                            <img src="/image/happy.png" alt="포인트 아이콘">
                            <span class="point-amount">${currentTotal}</span>
                        </div>
                        <button class="charge-button" id="chargeBtn" style="margin-bottom: 10px;">충전하기</button>
                        <button class="charge-button" id="edit-btn" 
                            style="background-color: white; border:1px solid#FF3B69; color: #FF3B69;">수정하기</button>
                    </div>
                </div>

                <div class="usage-section" style="box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);">
                    <div class="usage-header">
                        <img src="/image/happy.png" alt="사용 내역 아이콘" class="section-icon">
                        <h2 style="margin: 0;">사용 내역</h2>
                    </div>
                    <div class="usage-list">
                        <c:forEach var="payment" items="${allPayments}">
                            <div class="usage-item">
                                <div class="item-title">
                                    ${payment.pointAmount > 0 ? '스마일 충전' : '스마일 사용'}
                                </div>
                                <div class="item-date">
                                    ${payment.formattedPointDate}
                                </div>
                                <div class="item-amount ${payment.pointAmount > 0 ? 'positive' : 'negative'}">
                                    ${payment.pointAmount > 0 ? '+' : ''}${payment.pointAmount}
                                </div>
                                <div class="item-total">${payment.totalPoints}</div>
                            </div>
                        </c:forEach>

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
                                <div class="profile-image-upload">
                                    <img id="profilePreview" 
                                        src="${user.userProfilePicture != null ? user.userProfilePicture : '/image/default-profile.png'}" 
                                        alt="프로필 이미지">
                                    <input type="file" id="profileImage" name="profileImage" accept="image/*">
                                    <label for="profileImage" class="upload-btn">이미지 수정</label>
                                </div>

                                <div class="edit-form-group">
                                    <label for="userId">아이디</label>
                                    <input type="text" id="userId" value="${user.userId}" readonly class="readonly-input">
                                </div>

                                <div class="edit-form-group">
                                    <label for="nickname">닉네임</label>
                                    <input type="text" id="nickname" name="userNickname" value="${user.userNickname}">
                                </div>

                                <div class="edit-form-group">
                                    <label for="userEmail">이메일</label>
                                    <input type="email" id="userEmail" value="${user.userEmail}" readonly class="readonly-input">
                                </div>

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
    </div>

    <!-- jQuery -->
    <script src="/js/jquery.min.js"></script>
    <script src="/js/jquery.easing.1.3.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/jquery.waypoints.min.js"></script>
    <script src="/js/sticky.js"></script>
    <script src="/js/jquery.stellar.min.js"></script>
    <script src="/js/hoverIntent.js"></script>
    <script src="/js/superfish.js"></script>
    <script src="/js/jquery.magnific-popup.min.js"></script>
    <script src="/js/magnific-popup-options.js"></script>
    <script src="/js/main.js"></script>
    <script src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

    <script>
        var IMP = window.IMP;
        IMP.init("imp17165638");
        
        let selectedAmount = 0;
        let selectedPoint = 0;

        document.addEventListener('DOMContentLoaded', function() {
            const editProfileModal = document.getElementById('editProfileModal');
            const profileEditBtn = document.getElementById('edit-btn');
            const profileCloseBtn = editProfileModal.querySelector('.close');
            const profileForm = document.getElementById('profileEditForm');
            const profileImageInput = document.getElementById('profileImage');
            const profilePreview = document.getElementById('profilePreview');
            const deleteAccountBtn = document.querySelector('.delete-account-btn');
            const chargeBtn = document.getElementById('chargeBtn');

            // 충전하기 버튼 클릭 이벤트
            chargeBtn.addEventListener('click', function() {
                Swal.fire({
                    title: '<div style="display: flex; align-items: center; justify-content: center; gap: 10px;"><img src="/image/happy.png" style="width: 30px; height: 30px;">스마일 충전</div>',
                    html: `
                        <div class="charge-options" style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 10px; margin: 20px 0;">
                            <button class="charge-option" data-amount="100" data-point="100" style="padding: 15px; border: 1px solid #ddd; border-radius: 8px; background: white; cursor: pointer;">
                                <div style="font-size: 16px; font-weight: bold;">100 스마일</div>
                                <div style="color: #666;">100원</div>
                            </button>
                            <button class="charge-option" data-amount="300" data-point="300" style="padding: 15px; border: 1px solid #ddd; border-radius: 8px; background: white; cursor: pointer;">
                                <div style="font-size: 16px; font-weight: bold;">300 스마일</div>
                                <div style="color: #666;">300원</div>
                            </button>
                            <button class="charge-option" data-amount="500" data-point="500" style="padding: 15px; border: 1px solid #ddd; border-radius: 8px; background: white; cursor: pointer;">
                                <div style="font-size: 16px; font-weight: bold;">500 스마일</div>
                                <div style="color: #666;">500원</div>
                            </button>
                            <button class="charge-option" data-amount="1000" data-point="1000" style="padding: 15px; border: 1px solid #ddd; border-radius: 8px; background: white; cursor: pointer;">
                                <div style="font-size: 16px; font-weight: bold;">1000 스마일</div>
                                <div style="color: #666;">1,000원</div>
                            </button>
                        </div>
                    `,
                    showCancelButton: true,
                    confirmButtonText: '충전',
                    cancelButtonText: '취소',
                    confirmButtonColor: '#FF3B69',
                    cancelButtonColor: '#6c757d',
                    showConfirmButton: true,
                    width: '500px',
                    didOpen: () => {
                        document.querySelectorAll('.charge-option').forEach(button => {
                            button.addEventListener('click', function() {
                                document.querySelectorAll('.charge-option').forEach(btn => {
                                    btn.style.border = '1px solid #ddd';
                                    btn.style.background = 'white';
                                });
                                this.style.border = '2px solid #FF3B69';
                                this.style.background = '#fff5f7';
                                selectedAmount = parseInt(this.dataset.amount);
                                selectedPoint = parseInt(this.dataset.point);
                            });
                        });
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        if (!selectedAmount) {
                            Swal.fire({
                                icon: 'warning',
                                title: '알림',
                                text: '충전할 금액을 선택해주세요.',
                                confirmButtonColor: '#FF3B69'
                            });
                            return;
                        }
                        requestPayment();
                    }
                });
            });

            function requestPayment() {
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
                                Swal.fire({
                                    icon: 'success',
                                    title: '충전 완료!',
                                    text: '스마일 충전이 완료되었습니다.',
                                    confirmButtonColor: '#FF3B69'
                                }).then((result) => {
                                    if (result.isConfirmed) {
                                        location.reload();
                                    }
                                });
                            },
                            error: function (error) {
                                Swal.fire({
                                    icon: 'error',
                                    title: '오류 발생',
                                    text: '스마일 적립 중 오류가 발생했습니다.',
                                    confirmButtonColor: '#FF3B69'
                                });
                            }
                        });
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: '결제 실패',
                            text: '결제에 실패하였습니다.\n' + rsp.error_msg,
                            confirmButtonColor: '#FF3B69'
                        });
                    }
                });
            }

                            // 프로필 수정 모달 열기
                            profileEditBtn.addEventListener('click', function() {
                                editProfileModal.style.display = 'block';
                            });

                            // 프로필 수정 모달 닫기
                            profileCloseBtn.addEventListener('click', function() {
                                editProfileModal.style.display = 'none';
                            });

                            // 이미지 미리보기
                            profileImageInput.addEventListener('change', function() {
                                const file = this.files[0];
                                if (file) {
                                    const reader = new FileReader();
                                    reader.onload = function(e) {
                                        profilePreview.src = e.target.result;
                                    }
                                    reader.readAsDataURL(file);
                                }
                            });

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