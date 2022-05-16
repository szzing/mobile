<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="../css/product.css">

<div class="page_title">
	<h1 class="title">관리자 상품관리 페이지</h1>
</div>
<h2><a href="/admin/regiProduct">여기를 클릭하면 상품등록페이지로 이동</a></h2>
<section>
<h3>DB에 저장되어있는 등록상품 목록</h3>
<h3>상품정보 표시영역을 누르면 상품 상세페이지로 이동함</h3>
<c:forEach var="product" items="${product}">
<div>
	<span onclick="location.href='/product/${product.id}'">
		<img src="/images/${product.imgName}" width="100px">
		상품명 : ${product.name} / 제조사 : ${product.maker} / 상품분류 : ${product.category}
		 / 출고가 : ${product.price} / 용량 : ${product.storage}G / 색상 : ${product.color}
	</span>
	 <a href="/product/${product.id}/proUpdate"><button type="button">수정</button></a>
	 <button onClick="index.proDelete(${product.id})">삭제</button>
 </div>
 <hr>
 </c:forEach>
</section>
<script type="text/javascript" src="/script/product.js"></script>
<%@ include file="../layout/footer.jsp"%>