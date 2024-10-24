<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/character_intro_detail.css">
</head>

<body>
    <!--header 위치 -->
    <jsp:include page="common/header.jsp" />
    <section class="character-detail">
        <!--모달 창-->
        <div id="paymentModal" class="modal">
            <div class="modal-content">
                <h2>결제 확인</h2>
                <p>하츄핑 캐릭터를 1일 동안 이용하시겠습니까?</p>
                <p>필요 포인트: 30P</p>
                <div class="modal-buttons">
                    <button id="confirmPayment">확인</button>
                    <button id="cancelPayment">취소</button>
                </div>
            </div>
        </div>
        <div class="character-info">
            <h1>하츄핑</h1>
            <p>
                사랑의 티니핑, 하츄핑<br>
                사랑이 넘치는 애교 많은 사랑둥이.<br>
                배려심이 많은 다정다감한 성격의 사랑스러운 리더!<br>
                로미와 극강의 케미스트리를 자랑하는 로미의 단짝 친구
            </p>
            <button class="cta-button">체험하기 ➔</button>
            <table class="character-details">
                <tr>
                    <th>성별</th>
                    <td>여성</td>
                </tr>
                <tr>
                    <th>좋아하는것</th>
                    <td>딸기 생크림 케이크</td>
                </tr>
                <tr>
                    <th>싫어하는것</th>
                    <td>신맛나는 것</td>
                </tr>
            </table>
        </div>

        <div class="character-image">
            <img src="https://i.namu.wiki/i/hjrN5j3Uezsw31gxN37TwnCxJoqpHkXYc5Yle7xWlgDLu7tWg4qhqUwsn6dIredn-kaLarg-eIKQX-vBtFEToMnuKiBJr0aboEwop8jmlcfyB2XDat0VjA-I6L16SzKqvOy9fmgNFm9icboWoROF_g.webp" alt="하츄핑">
        </div>
    </section>

    <script>
        window.addEventListener('DOMContentLoaded', (event) => {
    // 줄바꿈 처리
    var paragraphs = document.querySelectorAll('.character-info p');
    paragraphs.forEach(function(p) {
        p.innerHTML = p.textContent.replace(/\n/g, '<br>');
    });

    // 모달 관련 요소들
    const modal = document.getElementById('paymentModal');
    const ctaButton = document.querySelector('.cta-button');
    const confirmBtn = document.getElementById('confirmPayment');
    const cancelBtn = document.getElementById('cancelPayment');

    // 체험하기 버튼 클릭 시
    ctaButton.addEventListener('click', () => {
        // 헤더의 로그인 상태 확인
        const isLoggedIn = document.querySelector('.greet') !== null;
        
        if (!isLoggedIn) {
            alert('로그인이 필요한 서비스입니다.');
            // 로그인 페이지로 이동
            window.location.href = '/loginForm';
            return;
        }
        
        // 로그인 되어있다면 모달 표시
        modal.style.display = 'block';
    });

    // 확인 버튼 클릭 시
    confirmBtn.addEventListener('click', () => {
        fetch('/api/character/rental', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                characterIdx: characterIdx,
                points: 30,
                days: 1  // 1일 대여로 수정
            })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                const startDate = new Date(data.startDate).toLocaleString();
                const endDate = new Date(data.endDate).toLocaleString();
                alert(`캐릭터 대여가 완료되었습니다.\n사용 기간: ${startDate} ~ ${endDate}`);
                window.location.href = '/characterExperience';
            } else {
                alert(data.message || '포인트가 부족합니다.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('처리 중 오류가 발생했습니다.');
        });
        
        modal.style.display = 'none';
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
});

    </script>

</body>

</html>