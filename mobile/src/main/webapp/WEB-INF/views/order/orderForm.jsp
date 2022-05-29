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
		
		<form class="form request_form">
		
			<div class="form_heading">
				<h3>주문 상품 내역</h3>
				<div class="delivery_wrap">
					<table class="delivery_list">
						<colgroup>
							<col width="30%">
							<col width="35%">
							<col width="35%">
						</colgroup>
						<thead class="delivery_index">
							<tr>
								<th>상품</th>
								<th>상품이름</th>
								<th>옵션</th>
							</tr>
						</thead>
						<tbody class="delivery_items">
							<tr class="delivery_item">
								<td><img src="/images/${cart.product.imgName}" width="100px"></td>
								<td>${cart.product.name}</td>
								<td>
									색상 : ${cart.color}<br>
									용량 : ${cart.storage}<br>
									기존통신사 : ${cart.beforetel}<br>
									변경통신사 : ${cart.aftertel}<br>
									요금제 : ${cart.telfee.feeName}<br>
									선택사항 : ${cart.dcchoice}<br>
									할인금액 : ${cart.dc_option}원<br>
									지불방법 : ${cart.period}개월<br>
									<input type="hidden" id="color" value="${cart.color}"/>
									<input type="hidden" id="storage" value="${cart.storage}"/>
									<input type="hidden" id="beforetel" value="${cart.beforetel}"/>
									<input type="hidden" id="aftertel" value="${cart.aftertel}"/>
									<input type="hidden" id="telfeeid" value="${cart.telfee.id}"/>
									<input type="hidden" id="productid" value="${cart.product.id}"/>
									<input type="hidden" id="userid" value="${principal.user.id}"/>
									<input type="hidden" id="dcchoice" value="${cart.dcchoice}"/>
									<input type="hidden" id="dc_option" value="${cart.dc_option}"/>
									<input type="hidden" id="period" value="${cart.period}"/>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="form_heading">
				<h3>가입자 정보</h3>
				<span class="necessary">* 은 필수 입력 항목입니다.</span>
			</div>
			<div class="input_boxes">
			
				<div class="input_box">
					<label for="username" class="labels">명의자 이름<span class="point">*</span></label>
					<input id="username"  value="${principal.user.username}" class="input_item" type="text" required/>
				</div>
				
				<div class="input_box">
					<label for="birth" class="labels">생년월일<span class="point">*</span></label>
					<input id="birth" class="input_item" type="date" required/>
				</div>
				
				<div class="input_box">
					<label for="newphone" class="labels">개통할 번호<span class="point">*</span></label>
					<input id="newphone" value="${principal.user.phone}" class="input_item" type="text" required/>
				</div>
				
				<div class="input_box">
					<label for="email" class="labels">이메일<span class="point">*</span></label>
					<input id="email" value="${principal.user.email}" class="input_item" type="email" required/>
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
					<input id="postName" value="${principal.user.username}" class="input_item" type="text" required/>
				</div>
				<div class="input_box">
					<label for="postTel" class="labels">배송연락처<span class="point">*</span></label>
					<input id="postTel" value="${principal.user.phone}" class="input_item" type="text" required/>
				</div>
				<div class="adress_boxes">
					<div class="adress_box">
						<label for="zipcode" class="labels">우편번호<span class="point">*</span></label>
						<input id="zipcode" name="zipcode" value="${principal.user.zipcode}" class="input_item" type="text"/>
						<input type="button" onclick="execPostCode();" class="btn btn_alt" value="우편번호찾기">
					</div>
					<div class="adress_box">
						<label for="address" class="labels">주소<span class="point">*</span></label>
						<input id="address" name="address" value="${principal.user.address}" class="input_item" type="text"/>
					</div>
					<div class="adress_box">
						<label for="addrdetail" class="labels">상세 주소<span class="point">*</span></label>
						<input id="addrdetail" class="input_item" value="${principal.user.addrdetail}" type="text"/>
					</div>
					<div class="adress_box">
						<label for="requestmsg" class="labels">요청사항</label>
						<input id="requestmsg" class="input_item" type="text"/>
					</div>
				</div>
			</div>
			
		</form>
		<div class="btns">
			<button type="button" id="btn_order" class="submit_btn">신청하기</button>
		</div>
	</div>
</section>
<script type="text/javascript" src="/script/order.js"></script>
<script type="text/javascript" src="/script/user.js"></script>
<%@ include file="../layout/footer.jsp"%>