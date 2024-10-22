<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <!-- 임시 - 연주 -->
    <meta charset="UTF-8">
    <title>캐릭터 상세정보</title>
    <style>
        .character-detail {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            display: flex;
        }
        .character-image {
            flex: 1;
            text-align: center;
        }
        .character-image img {
            max-width: 400px;
        }
        .character-info {
            flex: 1;
            padding: 20px;
        }
        .character-name {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .info-item {
            margin: 10px 0;
        }
    </style>
    </head>
    <body>
    <div class="character-detail">
        <div class="character-image">
            <img src="${character.characterImage}" alt="${character.characterName}">
        </div>
        <div class="character-info">
            <div class="character-name">${character.characterName}</div>
            <button onclick="history.back()" style="margin-top: 20px;">목록으로</button>
        </div>
    </div>
    </body>