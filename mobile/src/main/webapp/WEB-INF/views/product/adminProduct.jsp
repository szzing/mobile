<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="../css/boardlist.css">

<style>
table td {
	padding: 0.5rem;
}
</style>

<section>
	<div class="board_container">
		<h2>등록된 상품목록</h2>
		<a href="/admin/regiProduct"><button class="btn skyblue">상품등록하기</button></a>
		<table class="board_list" style="text-align: center">

			<thead class="board_index">
				<tr>
					<th>상품명</th>
					<th>제조사</th>
					<th>상품분류</th>
					<th>출고가</th>
					<th>용량</th>
					<th>색상</th>
					<th>삭제</th>
				</tr>
			</thead>

			<tbody class="board_items">
				<c:forEach var="product" items="${product}">
					<tr style="border-top: 1px solid" onclick="location.href='/product/${product.id}'">
						<td>${product.name}</td>
						<td>${product.maker}</td>
						<td>${product.category}</td>
						<td>${product.price}</td>
						<td>${product.storage}G</td>
						<td>${product.color}</td>
						<td><a href="/product/${product.id}/proUpdate"><button type="button" class="pink">수정</button></a>
	 <button onClick="index.proDelete(${product.id})" class="pink">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>

		</table>

	</div>
</section>
<script type="text/javascript" src="/script/product.js"></script>
<%@ include file="../layout/footer.jsp"%>