<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div class="container">

	<div>
		<br />
		<br /> <input type="hidden" value="${board.id }">
	</div>
	<table>
		<tbody>
			<tr>
				<th>제목</th>
				<td colspan="4"><b>${board.title }</b></td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td>${board.category }</td>
				
				<th>작성자</th>
				<td>관리자</td>
			</tr>
			<tr>
				<th class="table-light" scope="row" width="16%">작성일시</th>
				<td width="34%"><fmt:formatDate value="${board.createDate}" pattern="YYYY-MM-dd HH:mm" /></td>
				
				<th class="table-light" scope="row" width="16%">조회수</th>
				<td width="34%">${board.count }</td>
			</tr>
			<tr>
				<td colspan="4">${board.content }</td>
			</tr>
		</tbody>
	</table>

	<div>
		<button onclick="history.back()">돌아가기</button>
		<!-- 삭제, 수정버튼은 관리자에게만 생성 -->
		<c:if test="${principal.roles eq 'ADMIN'}">
			<button id="btn-delete">삭제</button>
			<a href="/board/${board.id}/updateForm">수정</a>
		</c:if>
	</div>
</div>
	<br>
<script type="text/javascript" src="/js/board.js"></script>
<%@ include file="../layout/footer.jsp"%>