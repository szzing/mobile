<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/css/boardlist.css">
<link rel="stylesheet" href="/css/boardform.css">
<section>
	<div class="board_container">
	
	<h1>상품수정페이지</h1>
		
		
		<form class="board_form" action="/admin/proUpdate" method="post" enctype="multipart/form-data">
		<!-- 수정, 삭제시 정보 전송 -->
		<input id="id" name="id" type="hidden" value="${product.id}">
		<input id="imgName" name="imgName" type="hidden" value="${product.imgName}">
		<input id="imgOriName" name="imgOriName" type="hidden" value="${product.imgOriName}">
		<input id="imgUrl" name="imgUrl" type="hidden" value="${product.imgUrl}">
		<!--   -->
				<div class="board_input_boxes">
					<div class="board_input_box">
						<label for="imgproduct" class="labels">상품이미지</label>
						<input type="file"  class="input_item board_txt" id="imgproduct" name="imgproduct">
					</div>
					<div class="board_input_box">
						<label for="name" class="labels">상품명</label>
						<input type="text" class="input_item board_txt" value="${product.name}" id="name" name="name">
					</div>
					<div class="board_input_box">
						<label for="maker" class="labels">제조사</label>
						<input type="text" class="input_item board_txt" value="${product.maker}" id="maker" name="maker">
					</div>
					<div class="board_input_box">
						<label for="category" class="labels">상품종류</label>
						<input type="text" class="input_item board_txt" value="${product.category}" id="category" name="category">
					</div>
					<div class="board_input_box">
						<label for="price" class="labels">출고가</label>
						<input type="text" class="input_item board_txt" value="${product.price}" id="price" name="price">
					</div>
					<div class="board_input_box">
						<label for="dcprice" class="labels">할인가</label>
						<input type="text" class="input_item board_txt" value="${product.dcprice}" id="dcprice" name="dcprice">
					</div>
					<div class="board_input_box">
						<label for="storage" class="labels">용량(G)</label>
						<input type="text" class="input_item board_txt" value="${product.storage}" id="storage" name="storage">
					</div>
					<div class="board_input_box">
						<label for="color" class="labels">색상</label>
						<input type="text" class="input_item board_txt" value="${product.color}" id="color" name="color">
					</div>
					<div class="board_input_box">
						<label for="content" class="labels">상품설명</label>
						<textarea id="summernote" name="content">${product.content}</textarea>
					</div>
				</div>
			<div class="buttons_submit">
				<button type="submit" id="btn-proupdate" class="btn submit_btn">상품 수정</button>
			</div>
		</form>
		
	</div>
</section>

<script type="text/javascript" src="/script/summernote.js"></script>
<script type="text/javascript" src="/script/board.js"></script>
<%@ include file="../layout/footer.jsp" %>