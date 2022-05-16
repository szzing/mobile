<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/css/boardlist.css">
<link rel="stylesheet" href="/css/boardform.css">

<section>
	<div class="board_container">
		
		<h2>[관리자] 이벤트 등록</h2>
		
		<div class="buttons">
			<a><button class="btn skyblue" onclick="history.back()">돌아가기</button></a>
			<a><button class="btn pink"  onclick="location.href=''">다시작성</button></a>
		</div>
		
		<form class="board_form" method="post">
			<div class="board_input_boxes">
				<div class="board_input_box">
					<label for="title" class="labels">제목</label>
					<input type="text" class="input_item board_txt" placeholder="제목을 입력해주세요." id="title">
					
					<select id="category" class="select_category" disabled>
				    	<option value="event">이벤트</option>
					</select>
				</div>
	
				<div class="board_input_box">
					<label for="content" class="labels">내용</label>
					<textarea id="summernote" name="editordata"></textarea>
				</div>
			</div>
		</form>
		<div class="buttons_submit">
			<button id="btn-eventsave" class="btn submit_btn">이벤트 등록</button>
		</div>
	</div>

</section>
<script type="text/javascript" src="/script/summernote.js"></script>
<script type="text/javascript" src="/script/board.js"></script>
<%@ include file="../layout/footer.jsp" %>