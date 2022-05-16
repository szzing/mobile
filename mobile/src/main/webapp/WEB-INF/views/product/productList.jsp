<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="../css/product.css">
<link rel="stylesheet" href="../css/banner.css">
<link rel="stylesheet" href="../css/productList.css">

<div class="page_title">
	<h1 class="title">제품 페이지</h1>
</div>

<section class="product_wrap">

	<aside class="side_menu_bar">	
		<h3>제품페이지</h3>
		<ul class="side_menu_box">
			<li class="side_menu_item menu_now"><a href="#">스마트폰</a></li>
			<li class="side_menu_item"><a href="#">주변기기</a></li>
		</ul>
	</aside>

	<div class="product_inner_wrap">
		<ul class="product_menu_bar">
			<li class="product_menu_item tab_now">전체</li>
			<li class="product_menu_item">삼성</li>
			<li class="product_menu_item">애플</li>
		</ul>
	
		<ul class="product_list">
			<!-- 반복문 시작 -->
			<li class="product_item">
				<div class="product_item_img">{상품이미지}</div>
				<div class="product_item_name">{상품이름}</div>
				<div class="product_item_price">
					<span class="fx_price">{정가}</span>
					<span class="dc_price">{할인가}</span>
				</div>
			</li>
			<!-- 반복문 끝 -->
		</ul>
	</div>
</section>

<%@ include file="../layout/footer.jsp"%>