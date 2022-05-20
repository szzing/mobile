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
		
		<h2>1:1 문의글 작성</h2>
		
		<div class="buttons">
			<a><button class="btn skyblue" onclick="history.back()">돌아가기</button></a>
			<a><button class="btn pink"  onclick="location.href=''">다시작성</button></a>
		</div>
		
		<form class="board_form" method="post">
			<div class="board_input_boxes">
				<div class="board_input_box">
					<label for="title" class="labels">제목</label>
					<input type="text" class="input_item board_txt" placeholder="제목을 입력해주세요." id="title" name="title">
				</div>
			
				<c:if test="${empty principal}">
					<!-- 로그인 상태가 아닐때 작성자명과 비번 설정 -->
					<div class="board_input_box">
						<label for="writer" class="labels">작성자명</label>
						<input type="text" class="input_item board_txt" placeholder="작성자명을 입력해주세요." id="writer" name="writer">
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
					<textarea id="summernote" name="editordata"></textarea>
				</div>
			</div>
		</form>
		
		<c:choose>
			<c:when test="${empty principal}">
			<!-- 비로그인 -->
				<div class="buttons_submit">
					<button id="btn-qnasave2" class="btn submit_btn">등록</button>
				</div>
			</c:when>
			<c:otherwise>
			<!-- 로그인 -->
				<div class="buttons_submit">
					<button id="btn-qnasave" class="btn submit_btn">등록</button>
				</div>
			</c:otherwise>
		</c:choose>
		
		
	
	</div>

</section>
<script type="text/javascript" src="/script/summernote.js"></script>
<script type="text/javascript" src="/script/qnaboard.js"></script>        
<%@ include file="../layout/footer.jsp"%>