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
    <link rel="stylesheet" href="css/character_intro.css">
</head>

<body>
    <!--header 위치 -->
    <jsp:include page="common/header.jsp" />

    <main class="character-gallery">
        <!-- 카테고리 section-->
        <section class="category-section">
            <h2 class="category-title">
                <span class="title-icon">🎥 </span> #캐릭터 소개
            </h2>
            <div class="category-wrapper">
                <c:forEach items="${characters}" var="character">
                    <div class="category-item" style="cursor: pointer;" onclick="loadCategory('${character.characterCategory}')">
                        <img src="${character.characterImage}" alt="${character.characterName}">
                        <p>${character.characterName}</p>
                    </div>
                </c:forEach>
            </div>
        </section>

        <!-- grid section-->
        <section class="grid-section">
            <div class="grid-container">
                <!-- ajax -->
                <!-- 추가 캐릭터들 여기에 배치 -->
            </div>
        </section>


        <!--footer 위치 -->
        <jsp:include page="common/footer.jsp" />
        
    </main>

    <script>

        window.addEventListener('scroll', function () {
            var categorySection = document.querySelector('.category-section');
            var sticky = categorySection.offsetTop;

            if (window.pageYOffset > sticky) {
                categorySection.classList.add('sticky');
            } else {
                categorySection.classList.remove('sticky');
            }
        });

    </script>

    <script>
    function loadCategory(category) {
        console.log("Category clicked:", category);  // 클릭 확인용 로그
        fetch('/character_intro/ajax/' + category)  // fetch → ajax요청을 보내는 JavaScript 내장 함수 1. 서버에 요청 보냄
            .then(response => response.json())  // 2. 서버 응답을 json으로 변환
            .then(data => {  // 3. 변환된 json 데이터로 작업
                console.log("Received data:", data);  // 데이터 확인용 로그
                const container = document.querySelector('.grid-container');  // 4. html 컨테이너 찾기
                container.innerHTML = '';  // 5. 기존 내용 비우기
                
                data.forEach(character => {  // 6. 새로운 데이터로 화면 갱신
                    const div = document.createElement('div');
                    div.className = 'grid-item';
                    div.onclick = function() {  // 클릭 시 상세페이지로 이동
                        console.log('Character ID:', character.characterIdx);
                        location.href = `/character_intro/detail/\${character.characterIdx}`;  // 이스케이프 처리
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

</html>