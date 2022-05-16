<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="../css/boardlist.css">
<link rel="stylesheet" href="../css/qna.css">
<link rel="stylesheet" href="../css/boardform.css">

<div class="page_title">
	<h1 class="title">고객센터</h1>
</div>

<section class="board_wrap">

	<aside class="side_menu_bar">	
		<h3>고객센터</h3>
		<ul class="side_menu_box">
			<li class="side_menu_item"><a href="/auth/notice">공지사항</a></li>
			<li class="side_menu_item"><a href="/auth/qna">1:1 문의</a></li>
			<li class="side_menu_item menu_now"><a href="/auth/faq">FAQ</a></li>
		</ul>
	</aside>
	
	<div class="board_container">	
			<h2>FAQ</h2>
			
			<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SYSTEM')">
					<div class="buttons">
						<a href="/"><button class="btn skyblue">메인으로 돌아가기</button></a>
						<a href="/board/faqForm"><button class="btn pink">FAQ작성</button></a>
					</div>
			</sec:authorize>
			<sec:authorize access="isAnonymous()">
					<div class="buttons">
						<a href="/"><button class="btn skyblue">메인으로 돌아가기</button></a>
					</div>
			</sec:authorize>
				
			<table class="board_list">
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
					<tr class="board_item" onclick="location.href='/faq/${board.id}'">
						<td>${board.id}</td>
						<td>${board.title}</td>
						<td>관리자</td>
						<td><fmt:formatDate value="${board.createDate}" pattern="YYYY-MM-dd"/></td>
					</tr>
				</c:forEach>
				
				</tbody>
			
			</table>

			<div class="pagination">
				<a><button class="page_item">이전페이지</button></a>
				<a><button class="page_item">다음페이지</button></a>
			</div>
		</div>
	</section>
	
<%@ include file="../layout/footer.jsp"%>