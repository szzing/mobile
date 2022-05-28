<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="../css/boardlist.css">
<link rel="stylesheet" href="../css/qna.css">
<link rel="stylesheet" href="../css/boardform.css">

<div class="page_title">
	<h1 class="title">고객센터</h1>
</div>

<section>

<!-- 	<aside class="side_menu_bar">	
		<h3>고객센터</h3>
		<ul class="side_menu_box">
			<li class="side_menu_item menu_now"><a href="/notice">공지사항</a></li>
			<li class="side_menu_item"><a href="/test/qna">1:1 문의</a></li>
		</ul>
	</aside> -->
	
	<div class="board_container">	
		<h2>FAQ 상세보기</h2>
		<div class="buttons">
			<a><button class="btn skyblue" onclick="history.back()">목록으로 돌아가기</button></a>
			
			<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SYSTEM')">
			<div class="detail_btns">
				<button type="button" class="pink" onclick="location.href='/board/${board.id}/faqUpdate'">수정</button>
				<button id="btn-delete" class="pink">삭제</button>
			</div>
		</sec:authorize>
		</div>
		<!-- 수정, 삭제시 ajax로 글번호 정보를 전송 -->
		<input id="id" type="hidden" value="${board.id}">
		<!--  -->
		
		<table class="board_list">
			<colgroup>
				<col width="10%">
				<col width="90%">
			</colgroup>
			<thead class="board_index">
				<tr class="board_list">
					<th>제목</th>
					<td>${board.title}</td>
				</tr>
			</thead>
			
			<tbody>
				<tr  class="board_list">
					<th>내용</th>
					<td class="board_content">${board.content}</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: right; font-size: 12px;">
						<span>작성일 : <fmt:formatDate value="${board.createDate}" pattern="YYYY-MM-dd HH:mm" /></span>
						<span>조회수 : ${board.count}</span>
					</td>
				</tr>	
			</tbody>
			
		</table>
		
	</div>

</section>
<script type="text/javascript" src="/script/board.js"></script>
<%@ include file="../layout/footer.jsp"%>