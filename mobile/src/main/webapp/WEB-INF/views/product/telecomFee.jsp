<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="../css/boardlist.css">
<style>
.feeHide{
display:none;
}
</style>
<section class="board_wrap">
<aside class="side_menu_bar">	
		<h3>통신사/요금제 관리</h3>
		<ul class="side_menu_box">
			<li class="side_menu_item telecom">통신사관리</li>
			<li class="side_menu_item fee">요금제 관리</li>
		</ul>
	</aside>
<div class="board_container">
	<!-- 통신사 영역 시작 -->
	<div class="telecomHide">
		<h2>통신사 관리</h2>
		<form>
		 	통신사 추가
			<input id="telname" type="text">
		</form>
		<button id="btn-telsave">통신사 추가</button>
		<hr>
		<div>
		--DB에 저장된 통신사 목록--
		<!-- 반복문으로 통신사명 출력 -->
		<c:forEach var="telecom" items="${telecom}">
			<div>
				${telecom.name}
				<button onClick="index.telDelete(${telecom.id})">삭제</button>
			</div>
		</c:forEach>
		</div>
	</div>
	<!-- 통신사 영역 끝 -->
	<!-- 요금제 영역 시작 -->
	<div class="feeHide">
		<h2>요금제 관리</h2>
		<form>
			<select id="productid">
				<c:forEach var="product" items="${product}">
					<option value="${product.id}">${product.name}</option>
				</c:forEach>
			</select>
			<select id="telid">
				<c:forEach var="telecom" items="${telecom}">
					<option value="${telecom.id}">${telecom.name}</option>
				</c:forEach>
			</select>
			<label for="feename">요금제명</label>
			<input type="text" id="feename"/>
			<label for="fee">요금(원)</label>
			<input type="text" id="fee"/>
			<br/>
			<label for="officialDc">공시지원(원)</label>
			<input type="text" id="officialDc"/>
			<label for="contractDc">선약할인(원)</label>
			<input type="text" id="contractDc"/>
			
		</form>
		<button id="btn-feesave">요금제 등록</button>
		<hr>
		--DB에 저장된 요금제 목록--
				<!-- 반복문으로 요금제 목록 출력 -->
		<c:forEach var="telecomfee" items="${telecomfee}">
			<div>
				상품명 ${telecomfee.product.name}/
				통신사명 ${telecomfee.telecom.name}/
				요금제명 ${telecomfee.feeName}/
				요금(원) ${telecomfee.fee}/
				공시지원 ${telecomfee.officialDc}/
				선약할인 ${telecomfee.contractDc}
				<button onClick="index.feeDelete(${telecomfee.id})">삭제</button>
			</div>
		</c:forEach>
	</div>
</div>
</section>
<script>
$(".fee").click(function() {
	$(".feeHide").css('display','block');
	$(".telecomHide").css('display','none');
});

$(".telecom").click(function() {
	$(".feeHide").css('display','none');
	$(".telecomHide").css('display','block');
});	

</script>
<script type="text/javascript" src="/script/product.js"></script>
<%@ include file="../layout/footer.jsp"%>