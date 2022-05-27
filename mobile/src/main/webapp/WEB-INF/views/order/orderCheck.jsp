<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/css/requestForm.css">
<link rel="stylesheet" href="/css/productRequest.css">

<section>
	<div class="form_container">
		<div class="form_title">
			<h1>주문 확인</h1>
		</div>
		
		<div class="request_option_box">
			주문자 정보 : ${principal.username}	
			주문정보 : ${order}
		</div>
		
		<form class="check-box">
			<input id="order-check" type="checkbox"><label for="order-check">주문 옵션을 확인 하였습니다.</label>
		</form>
		
		<div class="btns">
			<button type="button" id="" class="submit_btn">주문서 작성하기</button>
		</div>
	</div>
</section>

<%@ include file="../layout/footer.jsp"%>