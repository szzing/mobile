<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/css/boardlist.css">
<link rel="stylesheet" href="/css/boardform.css">
<section>
	<div class="board_container">
	<h1>일단 만들어둔 상품등록페이지</h1>
		<form class="board_form" method="post">
				<div class="board_input_boxes">
					<div class="board_input_box">
						<label for="title" class="labels">상품명</label>
						<input type="text" class="input_item board_txt" placeholder="상품명을 입력해주세요" id="title">
					</div>
		
					<div class="board_input_box">
						<label for="content" class="labels">상품설명</label>
						<textarea id="summernote" name="editordata">일단 게시판 폼 복붙! 이미지나 옵션 등 테이블 생성 및 코드작성 후 추가예정!</textarea>
					</div>
				</div>
		</form>
		<div class="buttons_submit">
			<button id="btn-regiproduct" class="btn submit_btn">상품 등록(미구현)</button>
		</div>
	</div>
</section>

<script type="text/javascript" src="/script/summernote.js"></script>
<script type="text/javascript" src="/script/board.js"></script>
<%@ include file="../layout/footer.jsp" %>