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
   <link rel="stylesheet" href="css/Payment.css">
   <link rel="stylesheet" href="css/style.css">
   <link rel="stylesheet" href="css/styles.css">
   <!-- 포트원 SDK -->
   <script src="https://cdn.portone.io/v2/browser-sdk.js"></script>
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
   <script>
       var IMP = window.IMP;
       IMP.init("imp17165638");

       let selectedAmount = 0;
       let selectedPoint = 0;

       document.addEventListener('DOMContentLoaded', function() {
           const modal = document.getElementById('chargeModal');

           // 충전하기 버튼 클릭시 모달 열기
           document.querySelector('.profile-section .charge-button').onclick = function() {
               modal.style.display = 'block';
           }

           // 모달 닫기
           document.querySelector('.close').onclick = function() {
               modal.style.display = 'none';
           }

           // 모달 외부 클릭시 닫기
           window.onclick = function(event) {
               if (event.target == modal) {
                   modal.style.display = 'none';
               }
           }

           // 충전 금액 선택 처리
           document.querySelectorAll('.charge-option').forEach(button => {
               button.addEventListener('click', function() {
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
           if(selectedAmount <= 0) {
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
           }, function(rsp) {
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
                       success: function(response) {
                           alert('스마일 충전이 완료되었습니다.');
                           location.reload();
                       },
                       error: function(error) {
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
</head>

<body class="main-body">
    <jsp:include page="common/header.jsp" />
    <div class="content-container">
    <div class="profile-section">
         <div class="circle-image"></div>
           <h2 class="username">${user.userNickname}님</h2>
           <p class="email">${user.userEmail}</p>
           
        <div class="button-section">
           <div class="point-display">
               <img src="/image/happy.png" alt="포인트 아이콘">
               <span class="point-amount">${currentTotal}</span>
        </div>
               <button class="charge-button">충전하기</button>
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

       <div class="usage-section">
        <div class="usage-header">
            <img src="/image/happy.png" alt="사용 내역 아이콘" class="section-icon">
            <h2>사용 내역</h2>
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
            <div class="item-amount ${payment.pointAmount > 0 ? 'positive' : 'negative'}">
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
</body>

</html>