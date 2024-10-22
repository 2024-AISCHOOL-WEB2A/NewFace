<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <!-- 임시 - 연주 -->
    <meta charset="UTF-8">
    <title>캐릭터 소개</title>
    <style>
        .character-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .character-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-top: 20px;
        }
        
        .grid-item {
            text-align: center;
        }
        
        .grid-item img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
        }
        
        .grid-item p {
            margin-top: 10px;
            font-weight: bold;
        }
        
        .title {
            color: #ff1493;
            text-align: center;
            font-size: 24px;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
    <div class="character-container">
        <h1 class="title"># 캐릭터 소개</h1>
        
        <!-- 메인 캐릭터 영역 -->
        <div class="main-character-grid">
            <c:forEach items="${characters}" var="character">
                <div class="grid-item" style="cursor: pointer;" onclick="loadCategory('${character.characterCategory}')">
                    <img src="${character.characterImage}" alt="${character.characterName}">
                    <p>${character.characterName}</p>
                </div>
            </c:forEach>
        </div>

        <!-- 카테고리별 캐릭터 영역이 아래에 표시됨 -->
        <div class="category-character-grid">
            <!-- AJAX로 로드될 영역 -->
        </div>
    </div>
    
    <style>
        .grid-item {
            cursor: pointer;
        }
        .grid-item:hover {
            transform: scale(1.05);
            transition: transform 0.3s ease;
        }
        .main-character-grid, .category-character-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin: 20px 0;
        }
    </style>
    
    <script>
    function loadCategory(category) {
        console.log("Category clicked:", category);  // 클릭 확인용 로그
        fetch('/character/ajax/' + category)  // fetch → ajax요청을 보내는 JavaScript 내장 함수 1. 서버에 요청 보냄
            .then(response => response.json())  // 2. 서버 응답을 json으로 변환
            .then(data => {  // 3. 변환된 json 데이터로 작업
                console.log("Received data:", data);  // 데이터 확인용 로그
                const container = document.querySelector('.category-character-grid');  // 4. html 컨테이너 찾기
                container.innerHTML = '';  // 5. 기존 내용 비우기
                
                data.forEach(character => {  // 6. 새로운 데이터로 화면 갱신
                    const div = document.createElement('div');
                    div.className = 'grid-item';
                    div.onclick = function() {  // 클릭 시 상세페이지로 이동
                        console.log('Character ID:', character.characterIdx);
                        location.href = `/character/detail/\${character.characterIdx}`;  // 이스케이프 처리
                    };
                    div.innerHTML = `
                        <img src="\${character.characterImage}" alt="\${character.characterName}">
                        <p>\${character.characterName}</p>
                    `;
                    container.appendChild(div);
                });
            })
            .catch(error => console.error('Error:', error));
    }
    </script>
</body>