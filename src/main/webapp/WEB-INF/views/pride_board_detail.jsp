<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Face - Shorts Detail</title>
    <link rel="stylesheet" href="/css/styles.css"> <!-- 기존의 header와 footer 스타일 포함 -->
    <link rel="stylesheet" href="/css/shorts-detail.css">  <!-- 별도의 shorts 상세 페이지 스타일 포함 -->
</head>
<body>

    <!--header-->
    <jsp:include page="common/header.jsp" />

    <!-- Main Content -->
    <main class="shorts-detail">
        <!-- 왼쪽: 비디오 플레이어 영역 -->
        <div class="video-section">
            <div class="video-container">
                <!-- 여기에 비디오가 들어감 -->
                <video>
                    <source src="video/video.mp4" type="video/mp4">
                    Your browser does not support the video tag.
                </video>
            </div>
        </div>

        <!-- 오른쪽: 상세 정보 및 댓글 -->
        <div class="detail-section">
            <div class="detail-header">
                <h2>PLAVE (플레이브) - 버추얼 아이돌</h2>
                <p>조회수 <span id="views">00만</span>회</span> · <span id="time">2개월 </span>전</p>
                <p id="channel">MBCKpop</p>
            </div>
            

            <div class="interaction">
                <p>내용을 입력해주세요</p>
            </div>
        </div>
    </main>
</html>
