<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${character.characterName} - 상세정보</title>
    <link rel="stylesheet" href="/css/styles.css">
    <link rel="stylesheet" href="/css/character_intro_detail.css">
</head>

<body>
    <jsp:include page="common/header.jsp" />
    <section class="character-detail">
            <!--모달 창-->
            <div id="paymentModal" class="modal">
            <div class="modal-content">
                <h2>결제 확인</h2>
                <p>${character.characterName} 캐릭터를 1일 동안 이용하시겠습니까?</p>
                <p><img src="/image/happy.png">필요 스마일: 30P</p>
                <div class="modal-buttons">
                    <button id="confirmPayment">확인</button>
                    <button id="cancelPayment">취소</button>
                </div>
            </div>
        </div>
        <div class="character-info">
            <h1>${character.characterName}</h1>
            <p>${character.characterDescription}</p>
            <button class="cta-button">체험하기 ➔</button>
            <table class="character-details">
                <tr>
                    <th>성별</th>
                    <td>${character.characterGender}</td>
                </tr>
                <tr>
                    <th>좋아하는것</th>
                    <td>${character.characterLikes}</td>
                </tr>
                <tr>
                    <th>싫어하는것</th>
                    <td>${character.characterNolike}</td>
                </tr>
            </table>
        </div>

        <div class="character-image">
            <img src="${character.characterImage}" alt="${character.characterName}">
        </div>
    </section>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var paragraphs = document.querySelectorAll('.character-info p');
            paragraphs.forEach(function(p) {
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
                    if(result === 'success') {
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