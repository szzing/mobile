<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="../css/boardlist.css">
<link rel="stylesheet" href="../css/qna.css">
<link rel="stylesheet" href="../css/boardform.css">
<section>

비밀번호 입력
<form>
	<input type="hidden" value="${board.id}" id="id" name="id"/>
	<input type="password" id="pass" name="pass"/>
</form>
<button id="btn-qnachk">확인</button>
</section>
<script type="text/javascript" src="/script/qnaboard.js"></script>
<%@ include file="../layout/footer.jsp"%>