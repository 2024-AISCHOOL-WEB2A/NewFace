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
            var paragraphs = document.querySelectorAll('.character-info p');
            paragraphs.forEach(function (p) {
                p.innerHTML = p.textContent.replace(/\n/g, '<br>');
            });
        });

    </script>

</body>

</html>