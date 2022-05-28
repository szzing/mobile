<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="../css/adminpage.css">

<section>
	<div class="adminpage_card">
		<div class="adminpage_user">
			<div class="greeting">
				<h3>[${principal.username}]님의</h3>
				<h2>관리자 페이지</h2>
			</div>
		</div>
		<ul class="adminpage_menu">
			<li class="adminpage_menu_item"><a href="/auth/admin/joinForm">관리자 계정생성</a></li>
			<li class="adminpage_menu_item"><a href="/admin/telecom">통신사 관리 및 요금제 관리</a></li>
			<li class="adminpage_menu_item"><a href="/admin/product">관리자용 상품목록페이지</a></li>
			<li class="adminpage_menu_item"><a href="">주문 배송 관리(미구현)</a></li>
		</ul>
	</div>
</section>