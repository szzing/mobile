<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="../css/product.css">
<section>
결제페이지? 주문확인페이지?
주문자 정보 : ${principal.username}

주문정보 : ${order}
</section>
<%@ include file="../layout/footer.jsp"%>