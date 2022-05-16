<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/css/boardlist.css">
<link rel="stylesheet" href="/css/event.css">

<div class="page_title">
	<h1 class="title">이벤트 안내</h1>
</div>

<section>
	<div class="board_container">	
		<h2>이벤트 상세보기</h2>
		<!-- 수정, 삭제시 ajax로 글번호 정보를 전송 -->
		<input id="id" type="hidden" value="${board.id}">
		<!--  -->
		<div class="buttons">
			<a><button class="btn skyblue" onclick="history.back()">목록으로 돌아가기</button></a>
		</div>
		
		<div class="detail_info">
			<span>작성일 : <fmt:formatDate value="${board.createDate}" pattern="YYYY-MM-dd HH:mm" /></span>
			<span>조회수 : ${board.count}</span>
		</div>
		
		<table class="board_list">
			<thead class="board_index">
				<tr class="board_list">
					<th>제목</th>
					<td>${board.title}</td>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td colspan="9" class="board_content">${board.content}</td>
				</tr>		
			</tbody>
			
		</table>
		
		<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SYSTEM')">
			<div class="detail_btns">
				<a href="/board/${board.id}/eventUpdate"><button type="button">수정</button></a>
				<button id="btn-delete">삭제</button>
			</div>
		</sec:authorize>
	</div>

</section>

<script type="text/javascript" src="/script/board.js"></script>
<%@ include file="../layout/footer.jsp"%>