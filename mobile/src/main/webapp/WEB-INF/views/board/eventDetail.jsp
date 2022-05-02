<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="../css/boardlist.css">
<link rel="stylesheet" href="../css/event.css">

<div class="page_title">
	<h1 class="title">이벤트 안내</h1>
</div>

<section>
	<div class="board_container">	
		<h2>이벤트 상세보기</h2>
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
		
		<c:if test="${principal.roles eq 'ADMIN'}"> 
			<div class="detail_btns">
				<a href="/board/${board.id}/updateForm"><button type="button">수정</button></a>
				<button id="btn-delete">삭제</button>
			</div>
		</c:if> 
	</div>

</section>

<script type="text/javascript" src="/js/board.js"></script>
<%@ include file="../layout/footer.jsp"%>