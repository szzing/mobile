<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MO:BILE</title>
<!-- isAuthenticated() 권한에 관계없이 로그인 인증 받은 경우 -->
<!-- 표현식이 지정한 권한에 맞을때만 출력 -->
<sec:authorize access="isAuthenticated()">
	<!-- principal : 현재 유저 오브젝트에 직접 접근 허용 -->
	<sec:authentication property="principal" var="principal" />
</sec:authorize>
<!-- css -->
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/index.css">
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<!-- summernote -->
<script src="/summernote/summernote-lite.js"></script>
<script src="/summernote/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/summernote/summernote-lite.css">
</head>

<body>
	<header>
		<div class="header_logo">
			<a href="/" class="logo">MO:BILE</a>
		</div>
		<div class="header_menubar">
			<ul class="header_left_menu">
				<li class="menu_item"><a href="/auth/product">제품</a></li>
				<li class="menu_item"><a href="/test/review">사용자후기</a></li>
				<li class="menu_item"><a href="/auth/event">이벤트안내</a></li>
			</ul>
			
			<sec:authorize access="isAnonymous()">
				<ul class="header_right_menu">
					<li class="menu_item"><a href="/auth/notice">고객센터</a></li>
					<li class="menu_item"><a href="/auth/loginForm">로그인</a></li>
					<li class="menu_item"><a href="/auth/joinForm">회원가입</a></li>
				</ul>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_USER')">
				<ul class="header_right_menu">
					<li class="menu_item"><a href="/auth/notice">고객센터</a></li>
					<li class="menu_item"><a href="/user/myPage">마이페이지</a></li>
					<li class="menu_item"><a href="/logout">로그아웃</a></li>
				</ul>
			</sec:authorize>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SYSTEM')">
				<ul class="header_right_menu">
					<li class="menu_item"><a href="/auth/notice">고객센터</a></li>
					<li class="menu_item"><a href="/admin/adminPage">관리자페이지</a></li>
					<li class="menu_item"><a href="/logout">로그아웃</a></li>
					<li class="menu_item"><a href="/auth/admin/joinForm">관리자계정생성(임시)</a></li>
				</ul>
			</sec:authorize>
			
		</div>
		<div class="menu_toggle toggle_btn">
			<i class="bi bi-three-dots-vertical"></i>
		</div>
	</header>
	<div class="header"></div>
	
	<script type="text/javascript" src="/script/header.js"></script>
	<script type="text/javascript" src="/script/jquery.form.min.js"></script>