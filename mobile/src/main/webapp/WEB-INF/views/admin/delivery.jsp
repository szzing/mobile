<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="../css/delivery.css">

<div class="page_title">
	<h1 class="title">관지라 주문 관리</h1>
</div>

<section>
	<div class="delivery_wrap">
		<form class="select_period">
			<div class="select_period_radio">
				<input type="radio" id="period01" name="period">
				<label for="period01">전체</label>
				
				<input type="radio" id="period02" name="period">
				<label for="period02">1주일</label>
				
				<input type="radio" id="period03" name="period">
				<label for="period03">1개월</label>
				
				<input type="radio" id="period04" name="period">
				<label for="period04">3개월</label>
				
				<input type="radio" id="period05" name="period">
				<label for="period05">6개월</label>
			</div>

			<div class="select_period_date">
				<input type='date' name='deldatestart' /> <i class="bi bi-slash-lg"></i>
				<input type='date' name='deldatestart' />
				<button class="btn_search" type="submit">조회</button>
			</div>
		</form>

		<table class="delivery_list">
		
			<colgroup>
				<col width="15%">
				<col width="10%">
				<col width="15%">
				<col width="35%">
				<col width="15%">
			</colgroup>
			
			<thead class="delivery_index">
				<tr>
					<th>주문번호</th>
					<th>고객명</th>
					<th>상품이름</th>
					<th>옵션</th>
					<th>배송상태</th>
				</tr>
			</thead>

			<tbody class="delivery_items">

				<c:forEach var="deliveryitem" items="${deliveryitems.content}">
					<c:choose>
						<c:when test="${empty deliveryitems}">
							<tr class="delivery_item">
								<td colspan="4">해당 기간의 주문 내역이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr class="delivery_item">
								<td>${deliveryitem.id}</td>
								<td>${deliveryitem.user.username}</td>
								<td><a href="/product/${deliveryitem.product.id}">${deliveryitem.product.name}</a></td>
								<td>
									색상 : ${deliveryitem.color}<br>
									용량 : ${deliveryitem.storage}<br>
									기존통신사 : ${deliveryitem.beforetel}<br>
									변경통신사 : ${deliveryitem.aftertel}<br>
									요금제 : ${deliveryitem.telfee.feeName}<br>
									선택사항 : ${deliveryitem.dcchoice}<br>
									할인금액 : ${deliveryitem.dc_option}원<br>
									<c:choose>
										<c:when test="${deliveryitem.period==0}">
										지불방법 : 일시불<br>
										</c:when>
										<c:otherwise>
											지불방법 : ${deliveryitem.period}개월<br>
										</c:otherwise>
									</c:choose>
								</td>
								<td>${deliveryitem.status}
								<form>
								<input id="orderid" type="hidden" value="${deliveryitem.id}"/>
								<select id="updateDelivery">
									<option value="상품준비중">상품준비중</option>
									<option value="배송준비중">배송준비중</option>
									<option value="배송중">배송중</option>
									<option value="배송완료">배송완료</option>
								</select>
								</form>
									<button id="btn-updateOrder">주문상태변경</button>
									<a href="https://service.epost.go.kr/trace.RetrieveDomRigiTraceList.comm?sid1=%EC%86%A1%EC%9E%A5%EB%B2%88%ED%98%B8&displayHeader=N" onclick="window.open(this.href, '_blank', 'width=700, height=300, resizeable=no, scrollbars=no, toolbar=no'); return false;">
   			                     		<button>배송조회</button>
   			                     	</a>
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</tbody>
		</table>
	</div>
</section>
<script type="text/javascript" src="/script/order.js"></script>
<%@ include file="../layout/footer.jsp"%>