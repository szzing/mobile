<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="../css/forms.css">

<section>

	<div class="form_container">
	
		<div class="form_title">
			<h1><span class="logo">MO:BILE</span> 로그인</h1>
		</div>
		
		<form id="login" class="form login_form">
				<div class="input_box">
					<label for="userid" class="labels">아이디</label>
					<input id="userid" class="input_item" type="text" required/>
				</div>
				
				<div class="input_box">
					<label for="password"  class="labels">비밀번호</label>
					<input id="password" class="input_item" type="password" required/>
				</div>
		</form>
		
		<div class="btns">
			<button type="submit" class="btn submit_btn">로그인</button>
			<button type="button" class="btn button_btn skyblue">아이디 찾기</button>
			<button type="button" class="btn button_btn pink">비밀번호 찾기</button>
		</div>
		
		
		<div class="form_heading">
			<h3>SNS 계정으로 로그인</h3>
			<div class="sns_icons">
				<a href="#"><img alt="kakaotalk" src="../css/icon/kakao-talk.png" class="sns_icon"/></a>
				<a href="#"><img alt="naver" src="../css/icon/naver.png" class="sns_icon"/></a>
				<a href="#"><img alt="google" src="../css/icon/google.png" class="sns_icon"/></a>
			</div>
			<span class="span_txt">아직 회원이 아니신가요? <a><b>회원가입하러 가기</b></a></span>
		</div>
		
	</div>
	
</section>

<%@ include file="../layout/footer.jsp"%>