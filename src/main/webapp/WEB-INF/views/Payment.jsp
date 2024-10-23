<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>결제 페이지</title>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <link rel="stylesheet" href="/resources/css/Payment.css">
    <!-- 포트원 SDK -->
    <script src="https://cdn.portone.io/v2/browser-sdk.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <script>
        var IMP = window.IMP; 
        IMP.init("imp17165638"); 
        
        function requestPayment() {
            IMP.request_pay({
                pg : 'html5_inicis.INIpayTest', 
                pay_method : 'card', 
                merchant_uid: "order_" + new Date().getTime(), 
                name : '포인트 충전',
                amount : 100,
                buyer_email : 'test@test.com', 
                buyer_name : '테스트', 
                buyer_tel : '010-1234-5678',
            }, function(rsp) { 
                if (rsp.success) {
                alert('결제가 완료되었습니다.');
                location.reload();
            } else {
                alert('결제에 실패하였습니다.\n' + rsp.error_msg);
            }
            });
        }
    </script>
</head>
<body class="main-body">
    <nav class="navigation">
        <div class="nav-items">
            <a href="#" class="nav-item">HOME</a>
            <a href="#" class="nav-item">Start Virtual</a>
            <a href="#" class="nav-item">캐릭터 소개</a>
            <a href="#" class="nav-item">자랑 게시판</a>
            <a href="#" class="nav-item">고객지원</a>
            <span class="nav-point">00님</span>
            <button class="nav-button">로그아웃</button>
        </div>
    </nav>

    <div class="content-container">
        <div class="profile-section">
            <div class="profile-image">
                <div class="circle-image"></div>
            </div>
            <div class="profile-info">
                <h2 class="username">00님</h2>
                <p class="email">00000000@gmail.com</p>
                <div class="point-display">
                    <img src="/resources/images/smile.png" alt="포인트 아이콘" class="point-icon">
                    <span class="point-amount">500</span>
                </div>
                <button class="charge-button" onclick="requestPayment()">충전하기</button>
            </div>
        </div>

        <div class="usage-section">
            <h2 class="section-title">
                <img src="/resources/images/smile.png" alt="사용 내역 아이콘" class="section-icon">
                사용 내역
            </h2>
            <div class="usage-list">
                <div class="usage-item">
                    <div class="item-info">
                        <span class="item-name">포슬핑</span>
                        <span class="item-date">2000.00.00 00:00:00</span>
                    </div>
                    <div class="item-amount negative">-300</div>
                    <div class="item-total">500</div>
                </div>
                <div class="usage-item">
                    <div class="item-info">
                        <span class="item-name">충전</span>
                        <span class="item-date">2000.00.00 00:00:00</span>
                    </div>
                    <div class="item-amount positive">+800</div>
                    <div class="item-total">800</div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>