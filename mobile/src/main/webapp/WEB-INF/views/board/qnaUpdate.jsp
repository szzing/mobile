<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/css/boardlist.css">
<link rel="stylesheet" href="/css/qna.css">
<link rel="stylesheet" href="/css/boardform.css">

<div class="page_title">
	<h1 class="title">고객센터</h1>
</div>

<section>
	<div class="board_container">
		<h2>1:1 문의글 수정</h2>
		<div class="buttons">
			<a><button class="btn skyblue" onclick="history.back()">돌아가기</button></a>
			<a><button class="btn pink"  onclick="location.href=''">다시작성</button></a>
		</div>
		
		<form class="board_form" method="post">
			<input id="id" type="hidden" value="${board.id}">
			<div class="board_input_boxes">
				<div class="board_input_box">
					<label for="title" class="labels">제목</label>
					<input type="text" class="input_item board_txt" value="${board.title}" id="title" name="title">
				</div>
			
				<c:if test="${empty board.user.username}">
					<!-- 로그인 하지않고 작성한 글일 경우에 비번 설정 -->
					<div class="board_input_box">
						<label for="writer" class="labels">작성자명</label>
						<input type="text" class="input_item board_txt" value="${board.writer}" id="writer" name="writer" readonly>
					</div>
					<div class="board_input_box">
						<label for="pass" class="labels">비밀번호</label>
						<input type="password" class="input_item board_txt" id="pass" name="pass">
					</div>
				</c:if>
				<!-- 항상 비밀글 -->
				<input type="hidden" id="secret" name="secret" value="true">
				<div class="board_input_box">
					<label for="content" class="labels">내용</label>
					<textarea id="summernote" name="editordata">${board.content}</textarea>
				</div>
			</div>
		</form>
		<div class="buttons_submit">
			<button id="btn-update" class="btn submit_btn">수정</button>
		</div>
	</div>
</section>
<script type="text/javascript" src="/script/summernote.js"></script>
<script type="text/javascript" src="/script/qnaboard.js"></script>        
<%@ include file="../layout/footer.jsp"%>