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
    <link rel="stylesheet" href="/css/styles.css">
    <link rel="stylesheet" href="/css/character_intro_detail.css">
</head>

<body>
    <!--header 위치 -->
    <jsp:include page="common/header.jsp" />
    <section class="character-detail">
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
        window.addEventListener('DOMContentLoaded', (event) => {
            var paragraphs = document.querySelectorAll('.character-info p');
            paragraphs.forEach(function (p) {
                p.innerHTML = p.textContent.replace(/\n/g, '<br>');
            });
        });

    </script>

</body>

</html>