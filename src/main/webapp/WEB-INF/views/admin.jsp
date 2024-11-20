<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default"
    data-template="vertical-menu-template-free">

<head>
    <!-- 메타 데이터 및 기본 설정 -->
    <meta charset="utf-8" />
    <meta name="viewport"
        content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
    <title>관리자 대시보드</title>
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
</head>

<body class="Omyu">
    <!-- 레이아웃 래퍼 -->
    <div class="layout-wrapper layout-content-navbar">
        <div class="layout-container">
            <!-- 사이드바 메뉴 -->
            <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
            <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
                <div class="app-brand demo">
                    <!-- 브랜드 로고 -->
                    <a href="/" class="app-brand-link">
                        <span class="app-brand-logo demo">
                            <h1 id="fh5co-logo" style="margin-bottom: 25px;"><a href="/">New Face</a></h1>
                        </span>
                    </a>
                </div>
                <div class="menu-inner-shadow"></div>
                <ul class="menu-inner py-1">
                    <!-- 대시보드 링크 -->
                    <li class="menu-item ${currentMenu == 'dashboard' ? 'active' : ''}">
                        <a href="/admin" class="menu-link">
                            <i class="menu-icon tf-icons bx bx-home-circle"></i>
                            <div data-i18n="Analytics">대시보드</div>
                        </a>
                    </li>
                
                    <!-- 유저 관리 링크 -->
                    <li class="menu-item ${currentMenu == 'user-list' ? 'active' : ''}">
                        <a href="user-list" class="menu-link">
                            <i class="menu-icon tf-icons bx bx-dock-top"></i>
                            <div data-i18n="Account Settings">유저 관리</div>
                        </a>
                    </li>
                
                    <!-- 로그아웃 링크 -->
                    <li class="menu-item">
                        <a href="/logout" class="menu-link">
                            <i class="menu-icon tf-icons bx bx-log-out-circle"></i>
                            <div data-i18n="Basic">로그아웃</div>
                        </a>
                    </li>
                </ul>
            </aside>
            <!-- / 사이드바 메뉴 -->

            <!-- 레이아웃 페이지 -->
            <div class="layout-page">
                <!-- 콘텐츠 래퍼 -->
                <div class="content-wrapper">
                    <!-- 메인 콘텐츠 -->
                    <div class="container-xxl flex-grow-1 container-p-y">
                        <div class="row">
                            <!-- 총 수익 섹션 -->
                            <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4">
                                <div class="card">
                                    <div class="row row-bordered g-0">
                                        <!-- 매출 그래프 섹션 -->
                                        <div class="col-md-12">
                                            <div class="card">
                                                <div class="card-body">
                                                    <!-- 기간 선택 드롭다운 -->
                                                    <div class="text-center mb-3">
                                                        <select id="timeRange" class="form-select w-25 mx-auto">
                                                            <option value="daily">일별</option>
                                                            <option value="monthly" selected>주별</option>
                                                            <option value="yearly">월별</option>
                                                        </select>
                                                    </div>
                                    
                                                    <!-- 매출 그래프를 표시할 영역 -->
                                                    <div id="salesChart"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /질문 리스트 및 해결률 섹션 끝 -->

                            <!-- 가입자 수 및 방문자 수 섹션 -->
                            <div class="col-12 col-md-8 col-lg-4 order-3 order-md-2">
                                <div class="row">
                                    <!-- 가입자 수 카드 -->
                                    <div class="col-6 mb-4">
                                        <div class="card">
                                            <div class="card-body">
                                                <div
                                                    class="card-title d-flex align-items-start justify-content-between">
                                                    <div class="avatar flex-shrink-0">
                                                        <div class="spinner-grow text-primary" role="status">
                                                            <span class="visually-hidden">Loading...</span>
                                                        </div>
                                                    </div>
                                                    <div class="dropdown">
                                                        <button class="btn p-0" type="button" id="cardOpt4"
                                                            data-bs-toggle="dropdown" aria-haspopup="true"
                                                            aria-expanded="false">
                                                            <i class="bx bx-dots-vertical-rounded"></i>
                                                        </button>
                                                        <div class="dropdown-menu dropdown-menu-end"
                                                            aria-labelledby="cardOpt4">
                                                            <a class="dropdown-item" href="javascript:void(0);">View
                                                                More</a>
                                                            <a class="dropdown-item" href="javascript:void(0);">Delete</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <span class=" d-block mb-1">가입자 수</span>
                                                <h3 class="card-title text-nowrap mb-2">157</h3>
                                                <small class="text-primary"><i class="bx bx-up-arrow-alt"></i>
                                                    +14.82%</small>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- 방문자 수 카드 -->
                                    <div class="col-6 mb-4">
                                        <div class="card">
                                            <div class="card-body">
                                                <div
                                                    class="card-title d-flex align-items-start justify-content-between">
                                                    <div class="avatar flex-shrink-0">
                                                        <div class="spinner-grow text-success" role="status">
                                                            <span class="visually-hidden">Loading...</span>
                                                        </div>
                                                    </div>
                                                    <div class="dropdown">
                                                        <button class="btn p-0" type="button" id="cardOpt1"
                                                            data-bs-toggle="dropdown" aria-haspopup="true"
                                                            aria-expanded="false">
                                                            <i class="bx bx-dots-vertical-rounded"></i>
                                                        </button>
                                                        <div class="dropdown-menu" aria-labelledby="cardOpt1">
                                                            <a class="dropdown-item" href="javascript:void(0);">View
                                                                More</a>
                                                            <a class="dropdown-item" href="javascript:void(0);">Delete</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <span class="d-block mb-1">방문자 수</span>
                                                <h3 class="card-title mb-2">1,717</h3>
                                                <small class="text-success"><i class="bx bx-up-arrow-alt"></i>
                                                    +28.14%</small>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- 가입자 수 추이 -->
                                    <div class="col-12 mb-4">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="d-flex justify-content-between flex-sm-row flex-column gap-3">
                                                    <div class="d-flex flex-sm-column flex-row align-items-start justify-content-between">
                                                        <div class="card-title">
                                                            <h5 class="text-nowrap mb-2">가입자 수 추이</h5>
                                                            <span class="badge bg-label-info rounded-pill">Year
                                                                2024</span>
                                                        </div>
                                                        <div class="mt-sm-auto">
                                                            <small class="text-info text-nowrap"><i class="bx bx-chevron-up"></i> 68.2%</small>
                                                            <div class="user-progress d-flex align-items-center gap-1">
                                                                <span class="text-muted">전월대비</span>
                                                                <h6 class="mb-0">+ 82</h6>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div id="profileReportChart"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 인기 캐릭터 섹션 -->
                        <div class="row">
                            <!-- 인기 캐릭터 순위 섹션 -->
                            <div class="col-md-6 col-lg-4 col-xl-4 order-0 mb-4">
                                <div class="card h-100">
                                    <div class="card-header d-flex align-items-center justify-content-between">
                                        <h5 class="card-title m-0 me-2">인기 캐릭터 순위</h5>
                                    </div>
                                    <div class="card-body">
                                        <ul id="characterList" class="p-0 m-0">
                                            <!-- Model에 저장된 top5Characters를 반복문으로 출력 -->
                                            <c:forEach var="character" items="${topCharacters}" varStatus="status">
                                                <li class="d-flex mb-4 pb-1">
                                                    <div class="avatar flex-shrink-0 me-3">
                                                        <span class="avatar-initial rounded bg-label-primary">
                                                            <i class="ti ti-square-rounded-chevron-up"></i>
                                                        </span>
                                                    </div>
                                                    <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                                        <div class="me-2">
                                                            <small class="text-muted d-block mb-1">${status.index + 1}st</small>
                                                            <!-- 캐릭터 이름을 EL로 출력 -->
                                                            <h6 class="mb-0 ">${character.character.characterName}</h6>
                                                        </div>
                                                        <div class="user-progress d-flex align-items-center gap-1">
                                                            <!-- 결제 횟수를 EL로 출력 -->
                                                            <h6 class="mb-0">${character.paymentCount}</h6>
                                                            <span class="text-muted">번 체험</span>
                                                        </div>
                                                    </div>
                                                </li>
                                                
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        
                            <!-- 인기 게시글 섹션 -->
                            <div class="col-md-6 col-lg-4 order-1 mb-4">
                                <div class="card h-100">
                                    <div class="card-header d-flex align-items-center justify-content-between">
                                        <div class="card-title mb-0">
                                            <h5 class="m-0 me-2">인기 게시글</h5>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <ul class="p-0 m-0">
                                            <!-- 인기 게시글을 반복문으로 처리 -->
                                            <c:forEach var="post" items="${top5Posts}" varStatus="status">
                                                <li class="d-flex mb-4 pb-1">
                                                    <div class="avatar flex-shrink-0 me-3">
                                                    <span class="avatar-initial rounded bg-label-primary"
                                                        ><i class="ti ti-square-rounded-chevron-up"></i
                                                    ></span>
                                                    </div>
                                                    <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                                    <div class="me-2">
                                                        <small class="text-muted d-block mb-1">${post.boardTitle}</small>
                                                        <h6 class="mb-0 ">${post.user.userNickname}</h6>
                                                    </div>
                                                    <div class="user-progress d-flex align-items-center gap-1">
                                                        <span class="text-muted">${post.boardViewCount}</span>
                                                    </div>
                                                    </div>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        
                            <!-- 고객 지원 섹션 -->
                            <div class="col-md-6 col-lg-4 order-2 mb-4">
                                <div class="card h-100">
                                    <div class="card-header">
                                        <h5 class="card-title m-0">고객지원 게시글</h5>
                                    </div>
                                    <!-- 상품별 탭 메뉴 -->
                                    <ul class="nav nav-pills justify-content-center mt-2 mb-2" role="tablist">
                                        <li class="nav-item">
                                            <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab"
                                                data-bs-target="#navs-tabs-line-card-feed" aria-controls="navs-tabs-line-card-feed"
                                                aria-selected="true">공지</button>
                                        </li>
                                        <li class="nav-item">
                                            <button type="button" class="nav-link" role="tab" data-bs-toggle="tab"
                                                data-bs-target="#navs-tabs-line-card-snack" aria-controls="navs-tabs-line-card-snack"
                                                aria-selected="false">FAQ</button>
                                        </li>
                                        <li class="nav-item">
                                            <button type="button" class="nav-link" role="tab" data-bs-toggle="tab"
                                                data-bs-target="#navs-tabs-line-card-nutrients" aria-controls="navs-tabs-line-card-nutrients"
                                                aria-selected="false">요청</button>
                                        </li>
                                    </ul>
                                
                                    <div class="card-body">
                                        <!-- 공지사항 목록을 반복문으로 처리 -->
                                        <div class="tab-content p-0">
                                            <!-- 공지 -->
                                            <div class="tab-pane fade show active" id="navs-tabs-line-card-feed" role="tabpanel">
                                                <ul class="p-0 m-0">
                                                    <c:forEach var="notice" items="${notices}" varStatus="status">
                                                        <li class="d-flex mb-4 pb-1">
                                                            <div class="avatar flex-shrink-0 me-3">
                                                                <span class="avatar-initial rounded bg-label-primary">
                                                                    <i class="ti ti-number-${status.index + 1}"></i>
                                                                </span>
                                                            </div>
                                                            <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                                                <div class="me-2">
                                                                    <small class="text-muted d-block mb-1">${status.index + 1}st</small>
                                                                    <h6 class="mb-0">${notice.customerServiceTitle}</h6>
                                                                </div>
                                                                <div class="user-progress d-flex align-items-center gap-1">
                                                                    <h6 class="mb-0">${notice.formattedDate}</h6>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                
                                            <!-- FAQ -->
                                            <div class="tab-pane fade" id="navs-tabs-line-card-snack" role="tabpanel">
                                                <ul class="p-0 m-0">
                                                    <c:forEach var="faq" items="${faqs}" varStatus="status">
                                                        <li class="d-flex mb-4 pb-1">
                                                            <div class="avatar flex-shrink-0 me-3">
                                                                <span class="avatar-initial rounded bg-label-primary">
                                                                    <i class="ti ti-number-${status.index + 1}"></i>
                                                                </span>
                                                            </div>
                                                            <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                                                <div class="me-2">
                                                                    <small class="text-muted d-block mb-1">${status.index + 1}st</small>
                                                                    <h6 class="mb-0">${faq.customerServiceTitle}</h6>
                                                                </div>
                                                                <div class="user-progress d-flex align-items-center gap-1">
                                                                    <h6 class="mb-0">${faq.formattedDate}</h6>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                
                                            <!-- 요청 -->
                                            <div class="tab-pane fade" id="navs-tabs-line-card-nutrients" role="tabpanel">
                                                <ul class="p-0 m-0">
                                                    <c:forEach var="request" items="${requests}" varStatus="status">
                                                        <li class="d-flex mb-4 pb-1">
                                                            <div class="avatar flex-shrink-0 me-3">
                                                                <span class="avatar-initial rounded bg-label-primary">
                                                                    <i class="ti ti-number-${status.index + 1}"></i>
                                                                </span>
                                                            </div>
                                                            <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                                                <div class="me-2">
                                                                    <small class="text-muted d-block mb-1">${status.index + 1}st</small>
                                                                    <h6 class="mb-0">${request.customerServiceTitle}</h6>
                                                                </div>
                                                                <div class="user-progress d-flex align-items-center gap-1">
                                                                    <h6 class="mb-0">${request.formattedDate}</h6>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                        <!-- / 질문 및 상품 카테고리 섹션 끝 -->
                    </div>
                    <!-- / 메인 콘텐츠 끝 -->

                    <div class="content-backdrop fade"></div>
                </div>
                <!-- / 콘텐츠 래퍼 끝 -->
            </div>
            <!-- / 레이아웃 페이지 끝 -->
        </div>

        <!-- 레이아웃 오버레이 -->
        <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / 레이아웃 래퍼 끝 -->

    <!-- 스크립트 파일들 -->
    <!-- ApexCharts JS -->
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

    <script>
    // 초기 데이터: 월별 데이터
    var monthlyData = [45000, 54000, 65000, 50000, 75000, 86000, 100000];
    var dailyData = [5000, 6000, 7000, 8000, 7500, 6500, 9000, 8500, 9500, 11000, 10500]; // 일별 데이터 예시
    var yearlyData = [500000, 600000, 700000, 800000, 750000]; // 년별 데이터 예시

    // 그래프 옵션
    var options = {
        series: [{
            name: '매출',
            data: monthlyData // 초기 값은 월별
        }],
        chart: {
            height: 250, // 그래프 높이
            type: 'line',
            zoom: {
                enabled: false
            }
        },
        dataLabels: {
            enabled: false
        },
        stroke: {
            curve: 'smooth'
        },
        title: {
            text: '매출 그래프',
            align: 'left'
        },
        grid: {
            row: {
                colors: ['#f3f3f3', 'transparent'],
                opacity: 0.5
            },
        },
        xaxis: {
            categories: ['1월', '2월', '3월', '4월', '5월', '6월', '7월'] // 초기 카테고리 (월별)
        }
    };

    // 그래프 생성
    var chart = new ApexCharts(document.querySelector("#salesChart"), options);
    chart.render();

    // 기간 선택 시 데이터 변경
    document.querySelector('#timeRange').addEventListener('change', function() {
        var selectedValue = this.value;

        if (selectedValue === 'daily') {
            chart.updateOptions({
                series: [{
                    name: '매출',
                    data: dailyData // 일별 데이터
                }],
                xaxis: {
                    categories: ['1일', '2일', '3일', '4일', '5일', '6일', '7일', '8일', '9일', '10일', '11일'] // 일별
                }
            });
        } else if (selectedValue === 'monthly') {
            chart.updateOptions({
                series: [{
                    name: '매출',
                    data: monthlyData // 월별 데이터
                }],
                xaxis: {
                    categories: ['1월', '2월', '3월', '4월', '5월', '6월', '7월'] // 월별
                }
            });
        } else if (selectedValue === 'yearly') {
            chart.updateOptions({
                series: [{
                    name: '매출',
                    data: yearlyData // 년별 데이터
                }],
                xaxis: {
                    categories: ['2020년', '2021년', '2022년', '2023년', '2024년'] // 년별
                }
            });
        }
    });
    </script>
    


    <!-- 외부 라이브러리 및 주요 스크립트 -->
    <script src="vendor/libs/jquery/jquery.js"></script>
    <script src="vendor/libs/popper/popper.js"></script>
    <script src="vendor/js/bootstrap.js"></script>
    <script src="vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="vendor/js/menu.js"></script>


    <!-- GitHub 버튼 -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>

</body>

</html>
