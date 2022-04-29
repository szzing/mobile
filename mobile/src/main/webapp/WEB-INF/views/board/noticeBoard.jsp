<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
	<h1>공지사항</h1>
	<br/>
	<c:choose>
		<c:when test="${principal.roles eq 'ADMIN'}">
			<a href="/board/noticeForm">공지사항 게시판에 글쓰기(클릭시 작성페이지 이동)</a>
		</c:when>
	</c:choose>
	<br/>
	<br/>//이하로는 게시판 목록 출력 테스트, 글 작성 시 출력됩니다//
	<br/>//로그인한 관리자 계정만 글작성 링크가 출력되는 상태//
	<br/>//카테고리는 메소드가 게시판별로 구분하여 출력하는지 확인위해 표시중//
	<br/>
	<hr>
	<div class="container">
	<c:forEach var="board" items="${boards.content }">
		<div>카테고리 : <b>${board.category }</b></div>
		<div>작성일시 : <fmt:formatDate value="${board.createDate}" pattern="YYYY-MM-dd"/></div>
		<div>조회수 : ${board.count }</div>
		<h4><a href="/notice/${board.id}"> 글제목(클릭시 글 상세보기 페이지) :  ${board.title }</a></h4>
		<hr>
	</c:forEach>
	</div>
<%@ include file="../layout/footer.jsp"%>