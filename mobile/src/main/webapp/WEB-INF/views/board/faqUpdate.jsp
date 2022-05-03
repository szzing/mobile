<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<link rel="stylesheet" href="../css/boardlist.css">
<link rel="stylesheet" href="../css/boardform.css">

<section>
	<div class="board_container">
		
		<h2>[관리자] FAQ 수정</h2>
		
		<div class="buttons">
			<a><button class="btn skyblue" onclick="history.back()">돌아가기</button></a>
		</div>
		
		<form class="board_form">
			<input type="hidden" id="id" value="${board.id}"/>
			<div class="board_input_boxes">
			<div class="board_input_box">
				<label for="title" class="labels">제목</label>
				<input type="text" class="input_item board_txt" id="title">
				
				<select id="category" class="select_category" disabled>
			    	<option value="faq">FAQ</option>
				</select>
			</div>

			<div class="board_input_box">
				<label for="content" class="labels">내용</label>
				<textarea class="input_item board_textarea" id="content" rows="15" style="resize:none;">${board.content}</textarea>
			</div>
			</div>
		</form>

		<div class="buttons_submit">
			<button id="btn-update" class="btn submit_btn">FAQ 수정</button>
		</div>
	
	</div>

</section>

<script type="text/javascript" src="/script/board.js"></script>
<%@ include file="../layout/footer.jsp" %>