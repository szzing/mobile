<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<link rel="stylesheet" href="../css/forms.css">

<section>

	<div class="form_container">
	
		<div class="form_title">
			<h1><span class="logo">MO:BILE</span> 회원가입</h1>
		</div>
		
		<form id="join" class="form join_form">
			<!--필수정보 입력란-->
			<div class="form_heading">
				<h3>[기본] 회원 정보를 입력해주세요.</h3>
				<span class="necessary">* 은 필수 입력 항목입니다.</span>
			</div>
			
			<div class="input_box">
				<label for="userid" class="labels">아이디<span class="point">*</span></label>
				<input id="userid" class="input_item" type="text" required/>
				<input type="button" class="btn btn_alt" value="중복확인">
			</div>
				
			<div class="input_box">
				<label for="password"  class="labels">비밀번호<span class="point">*</span></label>
			<input id="password" class="input_item" type="password" required/>
			</div>
						
			<div class="input_box">
				<label for="password"  class="labels">비밀번호 확인<span class="point">*</span></label>
				<input id="pwcheck" class="input_item" type="password" required/>
			</div>
			
			<div class="input_box">
				<label for="name" class="labels">이름<span class="point">*</span></label>
				<input id="name" class="input_item" type="text" required/>
			</div>
				
			<div class="input_box">
				<label for="tel" class="labels">전화번호<span class="point">*</span></label>
				<input id="tel" class="input_item" type="tel" required/>
			</div>
				
			<div class="input_box">
				<label for="email" class="labels">이메일<span class="point">*</span></label>
				<input id="email" class="input_item" type="email" required/>
			</div>
			
			<!--추가정보 입력란-->
			<div class="form_heading">
				<h3>[선택] 배송 정보를 입력해주세요.</h3>
			</div>
			
			<div class="input_box">
				<label for="postnum" class="labels">우편번호</label>
				<input id="postnum" class="input_item" type="text"/>
				<input type="button" class="btn btn_alt" value="우편번호찾기">
			</div>
			<div class="input_box">
				<label for="address" class="labels">주소</label>
				<input id="address" class="input_item" type="text"/>
			</div>
			<div class="input_box">
				<label for="addrdetail" class="labels">상세 주소</label>
				<input id="addrdetail" class="input_item" type="text"/>
			</div>
			
		</form>
		
		<div class="btns">
			<button type="submit" class="btn submit_btn">회원가입</button>
		</div>
		
	</div>
	
</section>

<%@ include file="../layout/footer.jsp"%>