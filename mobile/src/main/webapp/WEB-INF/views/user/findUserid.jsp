<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/css/forms.css">

<section>
	<div class="form_container">
	
		<div class="form_title">
			<h1><span class="logo">MO:BILE</span> 회원 아이디 찾기</h1>
		</div>

		<form>
			<div class="input_box">
				<label for="username" class="labels">이름</label>
				<input id="username" name="username" type="text" class="input_item">
			</div>
		
			<div class="input_box">
				<label for="phone" class="labels">전화번호</label>
				<input id="phone" name="phone" type="text" placeholder="01x-xxxx-xxxx" class="input_item">
			</div>
		</form>
		
		<div class="btns">
			<button id="btn-finduserid" class="submit_btn">아이디 찾기</button>
		</div>
	
	</div>
</section>
<script type="text/javascript" src="/script/user.js"></script>
<%@ include file="../layout/footer.jsp"%>