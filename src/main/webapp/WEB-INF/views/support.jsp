<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>고객 지원</title>
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet" href="css/support.css">
<script>
    function goToLink(url) {
        window.location.href = url;
    }
</script>
</head>
<body>
    <jsp:include page="common/header.jsp" />
    <div class="content-wrapper">
        <h2 class="category-title">
            # 고객지원
        </h2>
        <table>
            <thead>
                <tr>
                    <th>순번</th>
                    <th>제목</th>
                    <th>날짜</th>
                </tr>
            </thead>
            <tbody>
                <tr onclick="goToLink('details.jsp?id=1')">
                    <td class="sequence">1</td>
                    <td class="title notice">[공지] 서비스 점검 안내</td>
                    <td class="date">2023.10.01 09:00</td>
                </tr>
                <tr onclick="goToLink('details.jsp?id=2')">
                    <td class="sequence">2</td>
                    <td class="title faq">[FAQ] 결제 오류 해결 방법</td>
                    <td class="date">2023.10.02 10:00</td>
                </tr>
                <tr onclick="goToLink('details.jsp?id=3')">
                    <td class="sequence">3</td>
                    <td class="title normal">사용자 피드백 감사합니다</td>
                    <td class="date">2023.10.03 11:00</td>
                </tr>
                <tr onclick="goToLink('details.jsp?id=4')">
                    <td class="sequence">4</td>
                    <td class="title notice">[공지] 신규 기능 업데이트 안내</td>
                    <td class="date">2023.10.04 12:00</td>
                </tr>
                <tr onclick="goToLink('details.jsp?id=5')">
                    <td class="sequence">5</td>
                    <td class="title normal">유지보수 일정 안내</td>
                    <td class="date">2023.10.05 13:00</td>
                </tr>
                <tr onclick="goToLink('details.jsp?id=6')">
                    <td class="sequence">6</td>
                    <td class="title normal">제품 업데이트 안내</td>
                    <td class="date">2023.10.06 14:00</td>
                </tr>
                <tr onclick="goToLink('details.jsp?id=7')">
                    <td class="sequence">7</td>
                    <td class="title normal">연말 할인 이벤트 시작</td>
                    <td class="date">2023.10.07 15:00</td>
                </tr>
                <tr onclick="goToLink('details.jsp?id=8')">
                    <td class="sequence">8</td>
                    <td class="title faq">[FAQ] 회원 가입 관련 문의</td>
                    <td class="date">2023.10.08 16:00</td>
                </tr>
                <tr onclick="goToLink('details.jsp?id=9')">
                    <td class="sequence">9</td>
                    <td class="title notice">[공지] 개인정보 처리방침 변경 안내</td>
                    <td class="date">2023.10.09 17:00</td>
                </tr>
                <tr onclick="goToLink('details.jsp?id=10')">
                    <td class="sequence">10</td>
                    <td class="title normal">새로운 서비스 런칭 예정</td>
                    <td class="date">2023.10.10 18:00</td>
                </tr>
            </tbody>
        </table>
    </div>

    <jsp:include page="common/footer.jsp" />
</body>
</html>
