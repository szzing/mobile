<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<div class="container">
	<form>
		<h1>글 작성하기</h1><br/>
		<div>
			<label for="title"></label>
			<input type="text" placeholder="Enter title" id="title">
		</div>
		<div>
			<select id="category">
				<!-- ajax 카테고리 값 전송을 위해 필수입니다 보이지않게 숨기려면 id="category" 보존하여 hidden으로-->
			    <option value="notice">공지사항</option>
			</select>
		</div>
		<div>
			<label for="content"></label>
			<textarea rows="5" id="content"></textarea>
		</div>
	</form>
	<div>
	<button id="btn-noticesave">작성하기</button>
	</div>

</div>
<script type="text/javascript" src="/script/board.js"></script>
<%@ include file="../layout/footer.jsp" %>