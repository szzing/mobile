<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MO:BILE</title>
<!-- css -->
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/index.css">
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</head>

<body>
	<header>
		<div class="header_logo">
			<a href="/"><h1>MO:BILE</h1></a>
		</div>
		<div class="header_menubar">
			<ul class="header_left_menu">
				<li class="menu_item"><a>제품</a></li>
				<li class="menu_item"><a>사용자후기</a></li>
				<li class="menu_item"><a>이벤트안내</a></li>
			</ul>
		<c:choose>
			<c:when test="${empty sessionScope.principal}">
				<ul class="header_right_menu">
					<li class="menu_item"><a>고객센터</a></li>
					<li class="menu_item"><a href="/user/loginForm">로그인</a></li>
					<li class="menu_item"><a href="/admin/joinForm">관리자회원가입폼(임시)</a></li>
				</ul>
			</c:when>
			<c:when test="${principal.roles eq 'ADMIN'}">
				<ul class="header_right_menu">
					<li class="menu_item"><a>고객센터</a></li>
					<li class="menu_item"><a href="/admin/adminPage">관리자페이지</a></li>
					<li class="menu_item"><a href="/logout">로그아웃</a></li>
				</ul>
			</c:when>
			<c:otherwise>
				<ul class="header_right_menu">
					<li class="menu_item"><a>고객센터</a></li>
					<li class="menu_item"><a href="/user/myPage">마이페이지</a></li>
					<li class="menu_item"><a href="/logout">로그아웃</a></li>
				</ul>
			</c:otherwise>
		</c:choose>
			
		</div>
		<div class="menu_toggle toggle_btn">
			<i class="bi bi-three-dots-vertical"></i>
		</div>
	</header>
	
	<script type="text/javascript" src="../script/header.js"></script>