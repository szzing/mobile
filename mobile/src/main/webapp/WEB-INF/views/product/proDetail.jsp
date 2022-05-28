<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="../css/product.css">
<link rel="stylesheet" href="../css/productDetail.css">

<!-- 

주문 뷰로 보내는 정보

상품 id(product 형식)(join)
상품 수량
색상
용량
수량
전통신사
바꿀통신사
신청요금제id(join)
약정기간

 -->
<section>
	<div class="product_container">
		<div class="product_info">
			<img src="/images/${product.imgName}" width="200px"
				class="product_image">

			<table class="product_info_detail">
				<tr>
					<th>상품명</th>
					<td>${product.name}</td>
				</tr>
				<tr>
					<th>제조사</th>
					<td>${product.maker}</td>
				</tr>
				<tr>
					<th>분 류</th>
					<td>${product.category}</td>
				</tr>
			</table>

			<div class="calc_price1">
				<div class="calc_price_item">
					<label for="product_price">출고가</label> <input id="product_price"
						type="number" hidden="hidden" value="${product.price}">
					<fmt:formatNumber value="${product.price}" pattern="#,###원" />
				</div>

				<div class="calc_price_item">
					<label for="product_dcprice">MO:BILE 할인</label> <input
						id="product_dcprice" type="number" hidden="hidden"
						value="${product.dcprice}">
					<fmt:formatNumber value="${product.dcprice}" pattern="#,###원" />
				</div>
				<hr>
				<div class="calc_price_item">
					<label for="product_infoprice">할인가</label>
					<!-- <input
							id="product_principal" type="text" disabled> -->
					<input id="product_infoprice" type="text"
						class="input_emph" disabled />
				</div>
			</div>
			
		</div>
		
		<div class="product_options">
			<form>
				<input id="productid" name="productid" type="hidden"
					value="${product.id}">
					
				<div class="options_box">
					<h3>상품옵션 선택</h3>
					<!-- 용량옵션 -->
					<div class="option_div" id="storages">
						<span class="option_name">용량</span>
					</div>

					<!-- 색상옵션 -->
					<div class="option_div" id="colors">
						<span class="option_name">색상</span>
					</div>
				</div>
				
				<div class="options_box" id="telecom_options">
					<h3>통신사 옵션 선택</h3>

					<!-- 사용중인 통신사 -->
					<div class="option_div">
						<span class="option_name">사용중인 통신사</span><input name="beforetel"
							id="beforetel1" value="SKT" type="radio"><label
							for="beforetel1">SKT</label><input name="beforetel"
							id="beforetel2" value="KT" type="radio"><label
							for="beforetel2">KT</label><input name="beforetel"
							id="beforetel3" value="LGUplus" type="radio"><label
							for="beforetel3">LGU+</label><input name="beforetel"
							id="beforetel4" value="altteul" type="radio"><label
							for="beforetel4">알뜰폰</label>
					</div>

					<!-- 변경 통신사 -->
					<div class="option_div">
						<span class="option_name">사용하실 통신사</span><input name="aftertel"
							id="aftertel1" value="SKT" type="radio"><label
							for="aftertel1">SKT</label><input name="aftertel" id="aftertel2"
							value="KT" type="radio"><label for="aftertel2">KT</label><input
							name="aftertel" id="aftertel3" value="LGUplus" type="radio"><label
							for="aftertel3">LGU+</label>
					</div>

					<!-- 요금제 옵션 선택 -->
					<div class="option_div">
						<select class="fee_select" id="telecom_fee_option">
							<option selected disabled hidden="hidden" value="0">옵션을
								선택하세요</option>
							<c:forEach var="telecomfee" items="${telecomfee}">
								<c:choose>
									<c:when test="${telecomfee.telecom.name eq 'SKT'}">
										<option class="skt" value="${telecomfee.fee}+${telecomfee.officialDc}">${telecomfee.feeName}</option>
									</c:when>
									<c:when test="${telecomfee.telecom.name eq 'KT'}">
										<option class="kt" value="${telecomfee.fee}+${telecomfee.officialDc}">${telecomfee.feeName}</option>
									</c:when>
									<c:when test="${telecomfee.telecom.name eq 'LGUplus'}">
										<option class="lguplus" value="${telecomfee.fee}+${telecomfee.officialDc}">${telecomfee.feeName}</option>
									</c:when>
								</c:choose>
							</c:forEach>
						</select>
					</div>
					
					<!-- 할인옵션 -->
					<div class="option_div">
						<span class="option_name">할인옵션</span><input name="dcoption"
							id="dcoption1" type="radio" value="선택약정"><label
							for="dcoption1">선택약정</label><input name="dcoption" id="dcoption2"
							type="radio" value="공시지원"><label for="dcoption2">공시지원</label>
					</div>


					<!-- 약정기간 -->
					<div class="option_div" id="period_sel">
						<span class="option_name">약정기간 선택</span> <input name="period"
							id="period1" value="1" type="radio"><label for="period1">일시불</label><input
							name="period" id="period24" value="24" type="radio"><label
							for="period24">24개월</label><input name="period" id="period30"
							value="30" type="radio"><label for="period30">30개월</label><input
							name="period" id="period36" value="36" type="radio"><label
							for="period36">36개월</label>
					</div>
				</div>
				
				<div class="calc_price">
					<div class="calc_price_item">
						<label for="product_principal">할부원금</label>
						<input
							id="product_principal" type="text" disabled>
					</div>
					<hr>
					<div class="calc_price_item">
						<label for="dc_option">옵션할인</label> <input
							id="dc_option" type="text" disabled>
					</div>
					<div class="calc_price_item">
						<label for="month_price">월할부금</label> <input id="month_price"
							type="text" disabled>
					</div>
					<div class="calc_price_item">
						<label for="month_fee">요금제</label> <input id="month_fee"
							type="text" disabled>
					</div>
					<hr>
					<div class="calc_price_item">
						<label for="month_total">월납부액</label> <input id="month_total"
							type="text" class="input_emph" disabled>
					</div>

				</div>

			</form>
			<c:choose>
				<c:when test="${empty principal}">
					<div class="btns">
						<span>로그인 후 신청 가능합니다</span>
						<button type="button" class="login_btn"
							onclick="location.href='/auth/loginForm'">로그인하기</button>
					</div>
				</c:when>
				<c:otherwise>
					<button type="button" id="btn-buy" class="buy_btn">신청하기</button>
				</c:otherwise>
			</c:choose>

		</div>
	</div>

	<div class="detail_content">
		<div class="detail_content_head">제품정보</div>
		<div class="detail_content_body">${product.content}</div>

	</div>
</section>



<!-- 자바스크립트 -->
<script>
	// 라벨 생성 함수
	function createLabel(arr, labelfor, labelval) {
		for (let i = 0; i < arr.length; i++) {
			let $label = document.createElement('label');
			$label.htmlFor = labelfor;
			$label.innerText = labelval;
			return $label;
		}
	}
	
	// 인풋 생성 함수
	function createInput(arr, input) {
		for (let i = 0; i < arr.length; i++) {
			let $input = document.createElement('input');
			$input.type = "radio";
			$input.name = input;
			return $input;
		}
	}
	
	//색상 옵션
	let productColors = "${product.color}";
	let colorArr = productColors.split(', ');
	
	// 색상 옵션 생성
	let colors = document.getElementById('colors');
	for (let i = 0; i < colorArr.length; i++) {
		let $input = createInput(colorArr, "color");
		$input.id = "color" + (i + 1);
		$input.value = colorArr[i];
		
		let $label = createLabel(colorArr, $input.id, $input.value);
		colors.appendChild($input);
		colors.appendChild($label);
	}
	
	// 용량옵션
	let productStorages = "${product.storage}";
	let storageArr = productStorages.split(', ');
	
	// 용량 옵션 생성
	let storages = document.getElementById('storages');
	for (let i = 0; i < storageArr.length; i++) {
		let $input = createInput(storageArr, "storage");
		$input.id = "storage" + (i + 1);
		$input.value = storageArr[i];
		
		let $label = createLabel(storageArr, $input.id, $input.value);
		storages.appendChild($input);
		storages.appendChild($label);
	}
</script>

<script type="text/javascript" src="/script/product.js"></script>
<script type="text/javascript" src="/script/productDetail.js"></script>
<%@ include file="../layout/footer.jsp"%>