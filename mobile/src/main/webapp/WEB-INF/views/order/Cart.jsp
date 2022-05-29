<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="../css/product.css">
<link rel="stylesheet" href="../css/delivery.css">

<div class="page_title">
	<h1 class="title">장바구니</h1>
</div>

<section>
	<div class="delivery_wrap">
		<table class="delivery_list">
			<colgroup>
				<col width="10%">
				<col width="25%">
				<col width="15%">
				<col width="35%">
				<col width="20%">
			</colgroup>
			
			<thead class="delivery_index">
				<tr>
					<th>삭제</th>
					<th>상품</th>
					<th>상품이름</th>
					<th>옵션</th>
					<th>주문</th>
				</tr>
			</thead>

			<tbody class="delivery_items">
				<c:forEach var="cartitem" items="${cartitems.content}">
					<c:choose>
						<c:when test="${empty cartitems}">
							<tr class="delivery_item">
								<td colspan="5">장바구니 내역이 없습니다</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr class="delivery_item">
								<td><button onClick="index.cartDelete(${cartitem.id})">삭제</button></td>
								<td><img src="/images/${cartitem.product.imgName}" width="100px"></td>
								<td>${cartitem.product.name}</td>
								<td>
									색상 : ${cartitem.color}<br>
									용량 : ${cartitem.storage}<br>
									기존통신사 : ${cartitem.beforetel}<br>
									변경통신사 : ${cartitem.aftertel}<br>
									요금제 : ${cartitem.telfee.feeName}<br>
									선택사항 : ${cartitem.dcchoice}<br>
									할인금액 : ${cartitem.dc_option}원<br>
									지불방법 : ${cartitem.period}개월<br>
								</td>
								<td>
									<button type="button" id="btn-order" class="order_btn" onclick="location.href='/cart/order/${cartitem.id}'">주문하기</button>
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</c:forEach>

			</tbody>

		</table>
	</div>
</section>

<script type="text/javascript" src="../script/cart.js"></script>
<%@ include file="../layout/footer.jsp"%>