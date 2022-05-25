<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="../css/product.css">
<link rel="stylesheet" href="../css/productList.css">

<div class="page_title">
	<h1 class="title">제품 페이지</h1>
</div>
<h2><a href="/admin/regiProduct">여기를 클릭하면 상품등록페이지로 이동</a></h2>

<section>

	<ul class="product_list">
	
		<c:forEach var="product" items="${product}">
			<li class="product_item" onclick="location.href='/product/${product.id}'">
				<div class="product_item_img"><img src="../image/${product.category}/${product.name}.jpg" width="100%"></div>
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