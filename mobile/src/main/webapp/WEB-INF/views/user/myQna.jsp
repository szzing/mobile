<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/css/boardlist.css">
<link rel="stylesheet" href="../css/userpage.css">

<div class="board_container">
	<h2>나의 문의</h2>
	<div class="buttons">
		<a href="/user/myPage"><button class="btn skyblue">마이페이지로</button></a>
		<a href="/auth/qnaForm"><button class="btn pink">문의하기</button></a>
	</div>
	<table class="board_list">
		<colgroup>
			<col width="10%">
			<col width="60%">
			<col width="15%">
			<col width="15%">
		</colgroup>
			<thead class="board_index">
				<tr>
					<th>번호</th>
					<th class="list_title">제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
				
			<tbody class="board_items">
			<c:forEach var="board" items="${boards.content}">
				<tr class="board_item" onclick="location.href='/qna/${board.id}'">
					<td>${board.id}</td>
					<td>${board.title}[${board.replyCnt}]</td>
					<td>${board.user.username}</td>
					<td><fmt:formatDate value="${board.createDate}" pattern="YYYY-MM-dd"/></td>
				</tr>
			</c:forEach>
	
		</tbody>			
	</table>
</div>
<%@ include file="../layout/footer.jsp"%>