<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-static-path="../static/"
    data-template="vertical-menu-template-free">

<head>
    <meta charset="utf-8" />
    <meta name="viewport"
        content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
    <title>유저 페이지 - 유저 목록</title>
    <meta name="description" content="" />

    <!-- 파비콘 설정 -->
    <link rel="icon" type="image/x-icon" href="../static/img/favicon/favicon.ico" />

    <!-- 폰트 설정 -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
        rel="stylesheet" />

    <!-- 아이콘 설정 -->
    <link rel="stylesheet" href="vendor/fonts/boxicons.css" />

    <!-- 코어 CSS 파일 -->
    <link rel="stylesheet" href="vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="css/demo.css" />

    <!-- 외부 라이브러리 CSS -->
    <link rel="stylesheet" href="vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
    <link rel="stylesheet" href="vendor/libs/apex-charts/apex-charts.css" />

    <!-- 헬퍼 스크립트 -->
    <script src="vendor/js/helpers.js"></script>

    <!-- 아이콘 패키지 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/dist/tabler-icons.min.css" />

    <style>
        body {
            font-family: 'Omyu', sans-serif;
            font-size: 18px;
            /* 기본 폰트 사이즈를 설정합니다 */
        }

        h4,
        h5 {
            font-size: 25px;
            /* 필요한 경우 다른 요소의 폰트 사이즈를 설정할 수 있습니다 */
        }

        p,
        label,
        div,
        a,
        button,
        table,
        td,
        h1,
        h2,
        h3,
        h6 {
            font-size: 20px;
        }

        span {
            font-size: 20px;
        }

        .pagination {
            display: flex;
            justify-content: center;
        }

        .table th,
        .table td {
            text-align: center;
            vertical-align: middle;
        }

        .table th.id,
        .table td.id {
            width: 20%;
        }

        .table th.username,
        .table td.username {
            width: 30%;
        }

        .table th.phone,
        .table td.phone {
            width: 30%;
        }

        .table th.status,
        .table td.status {
            width: 20%;
        }
    </style>
</head>

<body class="Omyu">
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
        <div class="layout-container">
            <!-- Menu -->
            <!-- 사이드바 메뉴 -->
            <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
            <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
                <div class="app-brand demo">
                    <!-- 브랜드 로고 -->
                    <a href="/" class="app-brand-link">
                        <span class="app-brand-logo demo">
                            <img src="image/logo.png" width="150" />
                        </span>
                    </a>
                </div>
                <div class="menu-inner-shadow"></div>
                <ul class="menu-inner py-1">
                    <!-- 대시보드 링크 -->
                    <li class="menu-item active">
                        <a href="/admin" class="menu-link">
                            <i class="menu-icon tf-icons bx bx-home-circle"></i>
                            <div data-i18n="Analytics">대시보드</div>
                        </a>
                    </li>

                    <!-- 관리 메뉴 -->
                    <li class="menu-header small text-uppercase">
                        <span class="menu-header-text">관리</span>
                    </li>
                    <li class="menu-item">
                        <a href="user-list" class="menu-link menu-toggle">
                            <i class="menu-icon tf-icons bx bx-dock-top"></i>
                            <div data-i18n="Account Settings">사용자 페이지</div>
                        </a>
                    </li>

                    <!-- 계정 메뉴 -->
                    <li class="menu-header small text-uppercase"><span class="menu-header-text">계정</span></li>
                    <li class="menu-item">
                        <a href="/logout" class="menu-link">
                            <i class="menu-icon tf-icons bx bx-log-out-circle"></i>
                            <div data-i18n="Basic">로그아웃</div>
                        </a>
                    </li>
                </ul>
            </aside>
            <!-- / 사이드바 메뉴 -->

            <!-- Layout container -->
            <div class="layout-page">
                <!-- Content wrapper -->
                <div class="content-wrapper">
                    <!-- Content -->
                    <div class="container-xxl flex-grow-1 container-p-y">
                        <h4 class="py-3 mb-2">사용자 정보 리스트</h4>

                        <hr class="my-4" />

                        <div class="card">
                            <h5 class="card-header">사용자 정보 리스트 상세</h5>
                            <div class="table-responsive text-nowrap">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th class="id" style="font-size: 18px;">유저 ID</th>
                                            <th class="username" style="font-size: 18px;">이름</th>
                                            <th class="phone" style="font-size: 18px;">이메일</th>
                                            <th class="smile_point" style="font-size: 18px;">스마일 포인트</th>
                                            <th class="status" style="font-size: 18px;">탈퇴여부</th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-border-bottom-0">
                                        <c:forEach var="user" items="${users}">
                                            <tr>
                                                <td class="id">${user.userId}</td>
                                                <td class="username">${user.userNickname}</td>
                                                <td class="phone">${user.userEmail}</td>
                                                <td class="smile_point">${user.userPoint}</td>
                                                <td class="status">
                                                    <span class="badge ${user.userIsActive == 1 ? 'bg-label-success' : 'bg-label-warning'} me-1">
                                                        ${user.userIsActive == 1 ? '활성' : '탈퇴'}
                                                    </span>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <hr class="my-4" />

                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <!-- 첫 페이지로 -->
                                <li class="page-item first ${currentPage == 1 ? 'disabled' : ''}">
                                    <a class="page-link" href="user-list?page=1"><i
                                            class="tf-icon bx bx-chevrons-left"></i></a>
                                </li>
                                <!-- 이전 페이지로 -->
                                <li class="page-item prev ${currentPage == 1 ? 'disabled' : ''}">
                                    <a class="page-link" href="user-list?page=${currentPage - 1}">
                                        <i class="tf-icon bx bx-chevron-left"></i>
                                    </a>
                                </li>
                                <!-- 페이지 번호 -->
                                <c:forEach begin="1" end="${totalPages}" var="i">
                                    <c:if test="${i >= currentPage - 2 && i <= currentPage + 2}">
                                        <li class="page-item ${currentPage == i ? 'active' : ''}">
                                            <a class="page-link" href="user-list?page=${i}">${i}</a>
                                        </li>
                                    </c:if>
                                </c:forEach>

                                <!-- 다음 페이지로 -->
                                <li class="page-item next ${currentPage == totalPages ? 'disabled' : ''}">
                                    <a class="page-link" href="user-list?page=${currentPage + 1}">
                                        <i class="tf-icon bx bx-chevron-right"></i>
                                    </a>
                                </li>
        
                                <!-- 마지막 페이지로 -->
                                <li class="page-item last ${currentPage == totalPages ? 'disabled' : ''}">
                                    <a class="page-link" href="user-list?page=${totalPages}">
                                        <i class="tf-icon bx bx-chevrons-right"></i>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    <!-- / Content -->
                    <div class="content-backdrop fade"></div>
                </div>
                <!-- Content wrapper -->
            </div>
            <!-- / Layout page -->
        </div>
        <!-- Overlay -->
        <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->

    <!-- Core JS -->
    <!-- build:js static/vendor/js/core.js -->
    <script src="vendor/libs/jquery/jquery.js"></script>
    <script src="vendor/libs/popper/popper.js"></script>
    <script src="vendor/js/bootstrap.js"></script>
    <script src="vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="vendor/js/menu.js"></script>
    <!-- endbuild -->
    <!-- Vendors JS -->
    <!-- Main JS -->
    <script src="../static/js/main.js"></script>
    <!-- Page JS -->
    <!-- Place this tag in your head or just before your close body tag. -->
</body>

</html>