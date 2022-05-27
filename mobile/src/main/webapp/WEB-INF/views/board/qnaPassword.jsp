<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="../css/forms.css">

<section>
	<div class="form_container">
		<div class="form_title">
			<h1>caution</h1>
			<p>
			해당글에 접근하려면 권한이 필요합니다.<br>
			비밀번호를 입력하세요.
		</p>
		</div>
		
		<form>
			<div class="caution_box">
				<input type="hidden" value="${board.id}" id="id" name="id"/>
				<input type="password" id="pass" name="pass" autofocus="autofocus" placeholder="비밀번호"/>
			</div>
		</form>
		<div class="btns">
			<button id="btn-qnachk">확인</button>
		</div>
	</div>
</section>
<script type="text/javascript" src="../script/qnaboard.js"></script>
<%@ include file="../layout/footer.jsp"%>