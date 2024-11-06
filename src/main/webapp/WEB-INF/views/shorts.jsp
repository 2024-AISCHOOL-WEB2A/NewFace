<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>New Face - Shorts</title>
                    <link rel="stylesheet" href="css/styles.css"> <!-- 기존의 header와 footer 스타일 포함 -->
                    <link rel="stylesheet" href="css/shorts.css"> <!-- 별도의 shorts 페이지 스타일 포함 -->
                </head>

                <body>

                    <!--header-->
                    <jsp:include page="common/header.jsp" />

                    <!-- Shorts 게시판 섹션 -->
                    <main>
                        <section class="shorts-section">
                            <div class="shorts-header">
                                <img src="image/youtube.png" alt="Shorts Icon" class="shorts-icon">
                                <h2>#Shorts</h2>
                            </div>
                            <div class="shorts-container">
                                <div class="shorts-item">
                                    <div class="short-thumbnail"></div>
                                    <a href="shorts-detail"><p class="short-title">버추얼 아이돌 보컬</p></a>
                                    <p class="short-views">조회수 <span class="views-number">1.3만</span>회</p>
                                </div>
                                <div class="shorts-item">
                                    <div class="short-thumbnail"></div>
                                    <p class="short-title">버추얼 아이돌 댄스</p>
                                    <p class="short-views">조회수 <span class="views-number">2.5만</span>회</p>
                                </div>
                                <div class="shorts-item">
                                    <div class="short-thumbnail"></div>
                                    <p class="short-title">버추얼 아이돌 퍼포먼스</p>
                                    <p class="short-views">조회수 <span class="views-number">3.1만</span>회</p>
                                </div>
                                <div class="shorts-item">
                                    <div class="short-thumbnail"></div>
                                    <p class="short-title">버추얼 아이돌 인터뷰</p>
                                    <p class="short-views">조회수 <span class="views-number">4.0만</span>회</p>
                                </div>
                                <div class="shorts-item">
                                    <div class="short-thumbnail"></div>
                                    <p class="short-title">버추얼 아이돌 토크쇼</p>
                                    <p class="short-views">조회수 <span class="views-number">5.5만</span>회</p>
                                </div>
                            </div>
                        </section>



                        <!-- 게시글 섹션 -->
                        <section class="board-section">
                            <div class="board-item">
                                <div class="board-thumbnail"></div>
                                <div class="board-content">
                                    <h3>PLAVE (플레이브) - 버추얼 아이돌 | 쇼 음악중심 in JAPAN</h3>
                                    <p>조회수 <span class="views-number">60만</span>회 · <span class="posted-time">2개월
                                        </span>전</p>
                                    <p>MBCkpop</p>
                                    <p>#버추얼아이돌</p>
                                </div>
                            </div>

                            <!-- 동일한 board-item을 복사하여 여러 개 추가 -->
                            <div class="board-item">
                                <div class="board-thumbnail"></div>
                                <div class="board-content">
                                    <h3>PLAVE (플레이브) - 버추얼 아이돌 | 쇼 음악중심 in JAPAN</h3>
                                    <p>조회수 <span class="views-number">60만</span>회 · <span class="posted-time">2개월
                                            전</span></p>
                                    <p>MBCkpop</p>
                                    <p>#버추얼아이돌</p>
                                </div>
                            </div>

                            <!-- 추가 게시물 생략 -->
                        </section>

                        <!-- Search 섹션 -->
                        <section class="search-section">
                            <div class="search-container">
                                <select class="search-select">
                                    <option value="title">제목</option>
                                    <option value="content">내용</option>
                                </select>

                                <input type="text" class="search-input" placeholder="검색어를 입력하세요.">

                                <button class="search-button">검색</button>

                                <c:if test="${not empty sessionScope.userNickname}">
                                    <a href="shorts-writer"><button class="register-button" id="registerButton">등록하기</button></a>
                                </c:if>

                            </div>
                        </section>

                        <!-- 페이징 섹션 -->
                        <section class="pagination-section">
                            <div class="pagination">
                                <a href="#" class="pagination-arrow">&lt;</a>
                                <a href="#" class="pagination-number">1</a>
                                <a href="#" class="pagination-number">2</a>
                                <a href="#" class="pagination-number">3</a>
                                <a href="#" class="pagination-number">4</a>
                                <a href="#" class="pagination-number">5</a>
                                <a href="#" class="pagination-number">6</a>
                                <a href="#" class="pagination-number">7</a>
                                <a href="#" class="pagination-number">8</a>
                                <a href="#" class="pagination-number">9</a>
                                <a href="#" class="pagination-number">10</a>
                                <a href="#" class="pagination-arrow">&gt;</a>
                            </div>
                        </section>
                    </main>

                    <!-- footer 재사용 -->
                    <jsp:include page="common/footer.jsp" />
                </body>

                </html>