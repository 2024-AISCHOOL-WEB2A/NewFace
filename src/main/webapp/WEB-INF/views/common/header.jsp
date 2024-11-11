<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<header id="fh5co-header-section" class="sticky-banner">
    <div class="container">
        <div class="nav-header">
            <a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle dark"><i></i></a>
            <h1 id="fh5co-logo"><a href="/">New Face</a></h1>
            <!-- START #fh5co-menu-wrap -->
            <nav id="fh5co-menu-wrap" role="navigation">
                <ul class="sf-menu" id="fh5co-primary-menu">
                    <li><a href="/" class="<%= request.getRequestURI().equals("/") ? "active" : "" %>">홈</a></li>
                    <li><a href="/start_virtual" class="<%= request.getRequestURI().contains("start_virtual") ? "active" : "" %>">게임하기</a></li>
                    <li><a href="/character_intro" class="<%= request.getRequestURI().contains("character_intro") ? "active" : "" %>">캐릭터 소개</a></li>
                    <li><a href="/pride_board" class="<%= request.getRequestURI().contains("pride_board") ? "active" : "" %>">자랑 게시판</a></li>
                    <li><a href="/customerService" class="<%= request.getRequestURI().contains("support") ? "active" : "" %>">고객지원</a></li>


                    <li><a></a></li>
                    <li><a></a></li>
                    <li><a></a></li>
                    <li><a></a></li>

                    
                    <li><a href="/joinForm" >Sign up</a></li>
                    <li><a href="/loginForm" >Log in</a></li>

                </ul>
            </nav>
        </div>
    </div>
</header>