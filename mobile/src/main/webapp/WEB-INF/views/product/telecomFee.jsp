<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="../css/boardlist.css">
<style>
.feeHide{
display:none;
}

.insert_telecom {
	font-size: 16px;
	margin: 1rem;
	padding: 1rem;
	background: #f3f3f3;
}

.insert_telecom input {
	font-size: inherit;
	border: none;
	outline: none;
	border-bottom: 1px solid;
	background: none;
}

table td {
	padding: 0.5rem;
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
			<form class="insert_telecom">
				통신사 추가 : <input id="telname" type="text">
			<button type="button" id="btn-telsave">통신사 추가</button>
			</form>
			<div>
				<table class="board_list" style="text-align: center">

					<thead class="board_index">
						<tr>
							<th colspan="2">통신사 목록</th>
						</tr>
					</thead>

					<tbody class="board_items">
						<c:forEach var="telecom" items="${telecom}">
							<tr style="border-top: 1px solid">
								<td>${telecom.name}</td>
								<td><button onClick="index.telDelete(${telecom.id})" class="pink">삭제</button></td>
							</tr>
						</c:forEach>
					</tbody>

				</table>

			</div>
		</div>
		<!-- 통신사 영역 끝 -->
	<!-- 요금제 영역 시작 -->
	<div class="feeHide">
		<h2>요금제 관리</h2>
		<form class="insert_telecom">
			<div>
			<label for="productid">제품명</label>
			<select id="productid">
				<c:forEach var="product" items="${product}">
					<option value="${product.id}">${product.name}</option>
				</c:forEach>
			</select>
			</div>
			
			<div>
			<label for="telid">통신사</label>
			<select id="telid">
				<c:forEach var="telecom" items="${telecom}">
					<option value="${telecom.id}">${telecom.name}</option>
				</c:forEach>
			</select>
			<label for="feename">요금제명</label>
			<input type="text" id="feename"/>
			<label for="fee">요금(원)</label>
			<input type="text" id="fee"/>
			</div>
			<div>
			<label for="officialDc">공시지원(원)</label>
			<input type="text" id="officialDc"/>
			<label for="contractDc">선약할인(원)</label>
			<input type="text" id="contractDc"/>
			<button type="button" id="btn-feesave">요금제 등록</button>
			</div>
		</form>
		
		<table class="board_list" style="text-align: center">

					<thead class="board_index">
						<tr>
							<th>상품명</th>
							<th>통신사명</th>
							<th>요금제명</th>
							<th>요금(원)</th>
							<th>공시지원</th>
							<th>선약할인</th>
							<th>삭제</th>
						</tr>
					</thead>

					<tbody class="board_items">
						<c:forEach var="telecomfee" items="${telecomfee}">
							<tr style="border-top: 1px solid">
								<td>${telecomfee.product.name}</td>
								<td>${telecomfee.telecom.name}</td>
								<td>${telecomfee.feeName}</td>
								<td>${telecomfee.fee}</td>
								<td>${telecomfee.officialDc}</td>
								<td>${telecomfee.contractDc}</td>
								<td><button onClick="index.feeDelete(${telecomfee.id})" class="pink">삭제</button></td>
							</tr>
						</c:forEach>
					</tbody>

				</table>

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