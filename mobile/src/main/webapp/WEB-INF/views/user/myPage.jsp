<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="../css/userpage.css">

<section>
	<div class="mypage_card">
		<div class="mypage_user">
			<div class="greeting">
				<i class="bi bi-person-fill"></i>
				<h3>${principal.username}님, 환영합니다!</h3>
			</div>
		</div>
		<ul class="mypage_menu">
			<li class="mypage_menu_item"><a href="/user/updateForm"><i class="bi bi-pencil-fill"></i> 회원정보 수정</a></li>
			<li class="mypage_menu_item"><a><i class="bi bi-question-circle-fill"></i> 나의 문의</a></li>
			<li class="mypage_menu_item"><a><i class="bi bi-bag-fill"></i> 장바구니</a></li>
			<li class="mypage_menu_item"><a><i class="bi bi-card-checklist"></i> 주문목록</a></li>
			<li class="mypage_menu_item"><a href="https://service.epost.go.kr/trace.RetrieveDomRigiTraceList.comm?sid1=%EC%86%A1%EC%9E%A5%EB%B2%88%ED%98%B8&displayHeader=N"
                                onclick="window.open(this.href, '_blank', 'width=700, height=300, resizeable=no, scrollbars=no, toolbar=no'); return false;"><i class="bi bi-cart-fill"></i> 배송조회</a></li>
		</ul>
	</div>
	
	<div class="mypage_card">
		<h3 class="mypage_title">주문 진행 단계</h3>
		<ul class="mypage_process">
			<li class="mypage_process_item nowhere">
				<img alt="입금대기" src="../css/images/mypage/1.png">
				<span>입금대기</span>
			</li>
			<li class="process_arrow"><img alt=">" src="../css/images/mypage/v.png"></li>
			<li class="mypage_process_item">
				<img alt="결제완료" src="../css/images/mypage/2.png">
				<span>결제완료</span>
			</li>
			<li class="process_arrow"><img alt=">" src="../css/images/mypage/v.png"></li>
			<li class="mypage_process_item">
				<img alt="상품준비" src="../css/images/mypage/3.png">
				<span>상품준비</span>
			</li>
			<li class="process_arrow"><img alt=">" src="../css/images/mypage/v.png"></li>
			<li class="mypage_process_item">
				<img alt="배송중" src="../css/images/mypage/4.png">
				<span>배송중</span>
			</li>
			<li class="process_arrow"><img alt=">" src="../css/images/mypage/v.png"></li>
			<li class="mypage_process_item">
				<img alt="배송완료" src="../css/images/mypage/5.png">
				<span>배송완료</span>
			</li>
		</ul>
	</div>
	
</section>

<%@ include file="../layout/footer.jsp"%>