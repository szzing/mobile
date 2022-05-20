<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/css/boardlist.css">
<link rel="stylesheet" href="/css/boardform.css">
<section>
	<div class="board_container">
	<h1>일단 만들어둔 상품등록페이지</h1>
		<form class="board_form" action="/admin/saveproduct" method="post" enctype="multipart/form-data">
				<div class="board_input_boxes">
					<div class="board_input_box">
						<label for="imgproduct" class="labels">상품이미지</label>
						<input type="file" class="input_item board_txt" id="imgproduct" name="imgproduct">
					</div>
					<div class="board_input_box">
						<label for="name" class="labels">상품명</label>
						<input type="text" class="input_item board_txt" placeholder="상품명을 입력해주세요" id="name" name="name">
					</div>
					<div class="board_input_box">
						<label for="maker" class="labels">제조사</label>
						<input type="text" class="input_item board_txt" placeholder="제조사를 입력해주세요" id="maker" name="maker">
					</div>
					<div class="board_input_box">
						<label for="category" class="labels">상품종류</label>
						<input type="text" class="input_item board_txt" placeholder="상품의 종류를 입력해주세요" id="category" name="category">
					</div>
					<div class="board_input_box">
						<label for="price" class="labels">출고가</label>
						<input type="text" class="input_item board_txt" placeholder="출고가를 입력해주세요" id="price" name="price">
					</div>
					<div class="board_input_box">
						<label for="dcprice" class="labels">할인가</label>
						<input type="text" class="input_item board_txt" placeholder="출고가-할인가-(추가할인)=할부원금" id="dcprice" name="dcprice">
					</div>
					<div class="board_input_box">
						<label for="storage" class="labels">용량(G)</label>
						<input type="text" class="input_item board_txt" placeholder="단말기 용량을 입력해주세요(ex:128, 256)" id="storage" name="storage">
					</div>
					<div class="board_input_box">
						<label for="color" class="labels">색상</label>
						<input type="text" class="input_item board_txt" placeholder="색상을 입력해주세요(ex:블랙, 그린, 레드)" id="color" name="color">
					</div>
					<div class="board_input_box">
						<label for="content" class="labels">상품설명</label>
						<textarea id="summernote" name="content">일단 게시판 폼 복붙! 이미지나 옵션 등 테이블 생성 및 코드작성 후 추가예정!</textarea>
					</div>
				</div>
			<div class="buttons_submit">
				<button type="submit" id="btn-regiproduct" class="btn submit_btn">상품 등록</button>
			</div>
		</form>
		
	</div>
</section>

<script type="text/javascript" src="/script/summernote.js"></script>
<script type="text/javascript" src="/script/board.js"></script>
<%@ include file="../layout/footer.jsp" %>