<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="../css/delivery.css">

<div class="page_title">
	<h1 class="title">주문내역조회</h1>
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
				<col width="55%">
				<col width="15%">
				<col width="15%">
			</colgroup>
			
			<thead class="delivery_index">
				<tr>
					<th>주문날짜</th>
					<th>상품</th>
					<th>옵션</th>
					<th>상태</th>
				</tr>
			</thead>

			<tbody class="delivery_items">

				<!-- 반복문시작 -->
				<!-- 조건문1 시작  -->
				<!-- 주문내역을 조회할 수 없다면 -->
				<tr class="delivery_item">
					<td colspan="4">해당 기간의 주문 내역이 없습니다.</td>
				</tr>
				<!-- 이외의 경우 -->
				<%-- <c:forEach var="board" items="${}"> --%>
				<tr class="delivery_item">
					<td>{주문날짜}</td>
					<td>{상품이름}</td>
					<td>{상품옵션}</td>
					<td>
						{상태}
						<!-- 조건문2 시작 -->
						<!-- 배송중 상태라면 -->
						<a href="https://service.epost.go.kr/trace.RetrieveDomRigiTraceList.comm?sid1=%EC%86%A1%EC%9E%A5%EB%B2%88%ED%98%B8&displayHeader=N" onclick="window.open(this.href, '_blank', 'width=700, height=300, resizeable=no, scrollbars=no, toolbar=no'); return false;">
                        	<button>배송조회</button>
                        </a>
                        
                        <!-- 배송 완료상태 + 리뷰를 작성하지 않았다면 -->
                        <a href="/test/reviewForm">
                        	<button>리뷰작성</button>
                        </a>
                        
                        <!-- 리뷰 작성이 끝났다면 -->
                       	<a href="">
                        	<button>작성한리뷰</button>
                        </a>
						<!-- 조건문2 끝 -->
					</td>
				</tr>
				<%-- </c:forEach> --%>
				<!-- 조건문1 끝  -->
				<!-- 반복문끝 -->

			</tbody>

		</table>
	</div>
</section>

<%@ include file="../layout/footer.jsp"%>