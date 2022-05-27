<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/css/requestForm.css">
<link rel="stylesheet" href="/css/productRequest.css">

<section>
	<div class="form_container">
		<div class="form_title">
			<h1>주문서 작성</h1>
		</div>
		
		<form id="request" class="form request_form">
			
			<div class="form_heading">
				<h3>가입자 정보</h3>
				<span class="necessary">* 은 필수 입력 항목입니다.</span>
			</div>
			<div class="input_boxes">
			
				<div class="input_box">
					<label for="username" class="labels">명의자 이름<span class="point">*</span></label>
					<input id="username" class="input_item" type="text" required/>
				</div>
				
				<div class="input_box">
					<label for="birth" class="labels">생년월일<span class="point">*</span></label>
					<input id="birth" class="input_item" type="text" required/>
				</div>
				
				<div class="input_box">
					<label for="phone" class="labels">개통할 번호<span class="point">*</span></label>
					<input id="phone" class="input_item" type="text" required/>
				</div>
				
				<div class="input_box">
					<label for="email" class="labels">이메일<span class="point">*</span></label>
					<input id="email" class="input_item" type="email" required/>
				</div>
			</div>
			
			<!--배송지 입력-->
			<div class="form_heading">
				<h3>배송지 정보</h3>
				<span class="necessary">* 은 필수 입력 항목입니다.</span>
			</div>
			<div class="input_boxes">
				<div class="input_box">
					<label for="postName" class="labels">받으시는분<span class="point">*</span></label>
					<input id="postName" class="input_item" type="text" required/>
				</div>
				<div class="input_box">
					<label for="postTel" class="labels">배송연락처<span class="point">*</span></label>
					<input id="postTel" class="input_item" type="text" required/>
				</div>
				<div class="adress_boxes">
					<div class="adress_box">
						<label for="zipcode" class="labels">우편번호<span class="point">*</span></label>
						<input id="zipcode" name="zipcode" class="input_item" type="text"/>
						<input type="button" onclick="execPostCode();" class="btn btn_alt" value="우편번호찾기">
					</div>
					<div class="adress_box">
						<label for="address" class="labels">주소<span class="point">*</span></label>
						<input id="address" name="address" class="input_item" type="text"/>
					</div>
					<div class="adress_box">
						<label for="addrdetail" class="labels">상세 주소<span class="point">*</span></label>
						<input id="addrdetail" class="input_item" type="text"/>
					</div>
					<div class="adress_box">
						<label for="requestmsg" class="labels">요청사항</label>
						<input id="requestmsg" class="input_item" type="text"/>
					</div>
				</div>
			</div>
			
		</form>
		<div class="btns">
			<button type="button" id="" class="submit_btn">신청하기</button>
		</div>
	</div>
</section>

<script type="text/javascript" src="/script/user.js"></script>
<%@ include file="../layout/footer.jsp"%>