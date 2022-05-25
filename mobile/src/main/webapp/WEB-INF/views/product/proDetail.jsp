<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="../css/product.css">
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
<div>
	<!-- 상품이미지 출력 (외부경로에 맞는 파일이 있어야 출력됨) -->
	<img src="/images/${product.imgName}" width="300px">
</div>
상품명 : ${product.name} <br/>
제조사 : ${product.maker} <br/>
상품분류 : ${product.category} <br/>
출고가 : ${product.price} <br/>
MO:BILE 할인 : ${product.dcprice} <br/>
할부원금은 출고가-할인액-추가할인액-선택요금제에 따라서 결정<br/>
용량 : ${product.storage}G <br/>
--고객이 선택하는 옵션 영역이 별도로 필요--
<form action="/order" method="get">
<input id="productid" name="productid" type="hidden" value="${product.id}">

	<div>
		사용중인 통신사 : 
		<input name="beforetel" id="beforetel1" value="SKT" type="radio">
		<label for="tel1">SKT</label>
		<input name="beforetel" id="beforetel2" value="KT" type="radio">
		<label for="tel2">KT</label>
		<input name="beforetel" id="beforetel3" value="LGUplus" type="radio">
		<label for="tel3">LGU+</label>
		<input name="beforetel" id="beforetel4" value="altteul" type="radio">
		<label for="tel4">알뜰폰</label>
	</div>

	<div>
		사용하실 통신사 : 
		<input name="tel" id="tel1" value="SKT" type="radio">
		<label for="tel1">SKT</label>
		<input name="tel" id="tel2" value="KT" type="radio">
		<label for="tel2">KT</label>
		<input name="tel" id="tel3" value="LGUplus" type="radio">
		<label for="tel3">LGU+</label>
	</div>
	<div id="colors" class="colors">
		자바스크립트로 색상옵션 출력하는 영역
	</div>
	<div>
		<input type="radio" id="storage" name="storage" value="128">
		128G/
		용량도 색상처럼 js로 출력해서 선택 예정
	</div>
	<hr>
	<div>
		- 옵션으로 선택가능할 요금제 영역 - (순서상 SKT가 기본이며 '사용하실 통신사' 선택시 그 통신사 요금제만 나옴)
		<!-- 반복문으로 요금제 목록 출력 -->
		<c:forEach var="telecomfee" items="${telecomfee}">
			<div class="skt">
				<c:if test="${telecomfee.telecom.name eq 'SKT'}">
					<input type="hidden" id="telfeeid" name="telfeeid" value="${telecomfee.id}"/>
							<div>(SKT만 출력)</div>
							통신사명 ${telecomfee.telecom.name}/
							요금제명 ${telecomfee.feeName}/
							요금(원) ${telecomfee.fee}/
							<hr>
							---선약할인 또는 공시할인을 선택---<br>
							<input type="radio" name="dc" value="선택약정">
								<input type="hidden" name="contractDc" value="${telecomfee.contractDc}">
							<label for="dc">선약할인</label> ${telecomfee.contractDc}원
							<br>
							<input type="radio" name="dc" value="공시지원">
								<input type="hidden" name="officialDc" value="${telecomfee.officialDc}">
							<label for="dc">공시할인</label> ${telecomfee.officialDc}원
							<br>
						
						<hr>
						<div class="contractDc">
						-선약할인 선택 시 할부원금 -<br>
						
							출고가(${product.price})-MO:BILE 할인(${product.dcprice})-선약할인(${telecomfee.contractDc})=
							할부원금 : <c:out value="${product.price-product.dcprice-telecomfee.contractDc}"/>원
						</div>
						<hr>
						<div class="officialDc">
						-공시할인 선택 시 할부원금 -<br>
						
							출고가(${product.price})-MO:BILE 할인(${product.dcprice})-공시할인(${telecomfee.officialDc})
							할부원금 : <c:out value="${product.price-product.dcprice-telecomfee.officialDc}"/>원
						</div>
				</c:if>
			</div>
			<div class="kt">
				<c:if test="${telecomfee.telecom.name eq 'KT'}">
					<input type="hidden" id="telfeeid" name="telfeeid" value="telecomfee.id"/>
						<div>(KT만 출력)</div>
						통신사명 ${telecomfee.telecom.name}/
						요금제명 ${telecomfee.feeName}/
						요금(원) ${telecomfee.fee}/
						<hr>
						---선약할인 또는 공시할인을 선택---<br>
							<input type="radio" name="dc" value="선택약정">
								<input type="hidden" name="contractDc" value="${telecomfee.contractDc}">
							<label for="dc">선약할인</label> ${telecomfee.contractDc}원
							<br>
							<input type="radio" name="dc" value="공시지원">
								<input type="hidden" name="officialDc" value="${telecomfee.officialDc}">
							<label for="dc">공시할인</label> ${telecomfee.officialDc}원
							<br>
							
						<hr>
						<div class="contractDc">
						-선약할인 선택 시 할부원금 -<br>
						
							출고가(${product.price})-MO:BILE 할인(${product.dcprice})-선약할인(${telecomfee.contractDc})=
							할부원금 : <c:out value="${product.price-product.dcprice-telecomfee.contractDc}"/>원
						</div>
						<hr>
						<div class="officialDc">
						-공시할인 선택 시 할부원금 -<br>
						
							출고가(${product.price})-MO:BILE 할인(${product.dcprice})-공시할인(${telecomfee.officialDc})
							할부원금 : <c:out value="${product.price-product.dcprice-telecomfee.officialDc}"/>원
						</div>
				</c:if>
			</div>
			<div class="lguplus">
				<c:if test="${telecomfee.telecom.name eq 'LGUplus'}">
					<input type="hidden" id="telfeeid" name="telfeeid" value="telecomfee.id"/>
							<div>(LGUplus만 출력)</div>
							통신사명 ${telecomfee.telecom.name}/
							요금제명 ${telecomfee.feeName}/
							요금(원) ${telecomfee.fee}/
							<hr>
							---선약할인 또는 공시할인을 선택---<br>
							<input type="radio" name="dc" value="선택약정">
								<input type="hidden" id="contractDc" name="contractDc" value="${telecomfee.contractDc}">
							<label for="dc">선약할인</label> ${telecomfee.contractDc}원
							<br>
							<input type="radio" name="dc" value="공시지원">
								<input type="hidden" id="officialDc" name="officialDc" value="${telecomfee.officialDc}">
							<label for="dc">공시할인</label> ${telecomfee.officialDc}원
							<br>
						
						<hr>
						<div class="contractDc">
						-선약할인 선택 시 할부원금 -<br>
						
							출고가(${product.price})-MO:BILE 할인(${product.dcprice})-선약할인(${telecomfee.contractDc})=
							할부원금 : <c:out value="${product.price-product.dcprice-telecomfee.contractDc}"/>원
						</div>
						<hr>
						<div class="officialDc">
						-공시할인 선택 시 할부원금 -<br>
						
							출고가(${product.price})-MO:BILE 할인(${product.dcprice})-공시할인(${telecomfee.officialDc})
							할부원금 : <c:out value="${product.price-product.dcprice-telecomfee.officialDc}"/>원
						</div>
				</c:if>
			</div>
		</c:forEach>
		<hr>
		<div>
			 약정기간 선택
			<input name="period" id="1" value="1" type="radio" onclick='getPeriod(event)'>
			<label for="period">일시불</label>
			<input name="period" id="24" value="24" type="radio" onclick='getPeriod(event)'>
			<label for="period">24개월</label>
			<input name="period" id="30" value="30" type="radio" onclick='getPeriod(event)'>
			<label for="period">30개월</label>
			<input name="period" id="36" value="36" type="radio" onclick='getPeriod(event)'>
			<label for="period">36개월</label>
		</div>
		<div>
			월 납부액 = 할부원금(선택 요금제에 따라 값 바뀜)
			/약정기간 <span id="getperiod"></span>개월 + 선택요금제(월)
		</div>
	</div>
<button type="submit">신청하기</button>
</form>

<hr>
//상품상세내용// <br>
${product.content}
</section>
		<script>
		function getPeriod(event){
			document.getElementById('getperiod').innerText = 
			    event.target.value;
		}
			//DB 상품 색상 옵션을 가져옴
			var beforeStr = "${product.color}";
			//여러 색상이 저장되어있어 , 로 나누어 배열로 저장함
			var afterStr = beforeStr.split(',');
			for(var i=0; i< afterStr.length; i++){
				// 콘솔에서 배열로 저장된 색상옵션 확인 가능함
				console.log(afterStr[i]);
			}
	
			// 요소 생성 함수
			function createInput(color) {
				for(var i=0; i< afterStr.length; i++){
					
					// input 태그를 만든다.
					var $input = document.createElement('input');
					// 태그의 name을 설정한다.
					$input.name = color;
					// 태그의 type을 설정한다.
					$input.type = "radio";
					// 생성된 태그를 리턴한다.
					return $input;
				}
				
			}
			var colors = document.getElementById('colors')
			for(var i=0; i< afterStr.length; i++){
				// id가 color+i+1이고 value가 컬러 옵션명
				$input = createInput("color");
				$input.id = "color"+(i+1);
				// 태그의 value를 설정한다.
				$input.value = afterStr[i];
				// colors에 input 태그를 추가
				colors.appendChild($input);
				// input(radio) 앞에 컬러옵션명 출력
				$input.before('/ '+afterStr[i]+'');
			}
</script>
<script type="text/javascript" src="/script/product.js"></script>
<%@ include file="../layout/footer.jsp"%>