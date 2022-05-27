<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="../css/product.css">
<section>
장바구니(임시)

<hr>

<hr>
<br>
<hr>
<c:forEach var="cartitem" items="${cartitems.content}">
----jstl 반복문 시작구간------<br>
상품 : ${cartitem.product.name}<br>
색상 : ${cartitem.color}/용량 : ${cartitem.storage}<br>
기존통신사 : ${cartitem.beforetel}/
변경통신사 : ${cartitem.aftertel}<br>
요금제 : ${cartitem.telfee.feeName}<br>
선택사항 : ${cartitem.dcchoice}/
할인금액 : ${cartitem.dc_option}원
지불방법 : ${cartitem.period}개월<br>
----jstl 반복문 끝------<br>
각각 옆에 삭제버튼 추가예정
<hr>
</c:forEach>

</section>
<%@ include file="../layout/footer.jsp"%>