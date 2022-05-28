<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="../css/product.css">
<link rel="stylesheet" href="../css/productList.css">

<div class="page_title">
	<h1 class="title">제품 페이지</h1>
</div>

<section>

	<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SYSTEM')">
		<div class="buttons">
			<a href="/"><button class="btn skyblue">메인으로 돌아가기</button></a> <a
				href="/admin/regiProduct"><button class="btn pink">상품등록페이지로
					이동</button></a>
		</div>
	</sec:authorize>

	<sec:authorize access="isAnonymous()">
		<div class="buttons">
			<a href="/"><button class="btn skyblue">메인으로 돌아가기</button></a>
		</div>
	</sec:authorize>

	<ul class="product_list">
	
		<c:forEach var="product" items="${product}">
			<li class="product_item" onclick="location.href='/product/${product.id}'">
				<div class="product_item_img">
				<!-- 상품을 등록한 경우 이미지 정상출력 -->
				<img src="/images/${product.imgName}" width="200px"></div>
				<div class="product_item_txt">
					<div class="product_item_name">[${product.maker}] ${product.name}</div>
					<div class="product_item_price">
						<span class="fx_price"><fmt:formatNumber value="${product.price}" pattern="#,###원"/></span>
						<span class="dc_price"><fmt:formatNumber value="${product.price-product.dcprice}" pattern="#,###원"/></span>
					</div>
				</div>
			</li>
		</c:forEach>
		
	</ul>

</section>

<%@ include file="../layout/footer.jsp"%>