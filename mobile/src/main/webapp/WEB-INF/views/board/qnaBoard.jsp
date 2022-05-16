<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/css/boardlist.css">
<link rel="stylesheet" href="/css/qna.css">

<div class="page_title">
	<h1 class="title">고객센터</h1>
</div>

<section class="board_wrap">

	<aside class="side_menu_bar">
		<h3>고객센터</h3>
		<ul class="side_menu_box">
			<li class="side_menu_item"><a href="/auth/notice">공지사항</a></li>
			<li class="side_menu_item menu_now"><a href="/auth/qna">1:1 문의</a></li>
			<li class="side_menu_item"><a href="/auth/faq">FAQ</a></li>
		</ul>
	</aside>
	
		<div class="board_container">	
			<h2>1:1 문의</h2>
			
					<div class="buttons">
						<a href="/"><button class="btn skyblue">메인으로 돌아가기</button></a>
						<c:choose>
							<c:when test="${empty principal}">
								<!-- 비로그인으로 문의하기 -->
								<a href="/auth/qnaForm"><button class="btn pink">문의하기</button></a>
							</c:when>
							<c:otherwise>
								<!--  로그인 상태에서 문의하기 -->
								<a href="/qnaForm"><button class="btn pink">문의하기</button></a>
							</c:otherwise>
						</c:choose>
					</div>
				
				
			
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
					<c:if test="${board.secret eq 'true'}">
						<!-- 비밀글은 작성자 본인과 관리자만 상세보기 가능 -->
							<tr class="board_item">
								<td>${board.id}</td>
								<c:choose>
									<c:when test="board.users.id == principal.user.id || principal.user.roles eq 'ADMIN'||principal.user.roles eq 'SYSTEM'">
										<td onclick="location.href='/qna/${board.id}'">
											<c:out value="${board.title}[${board.replyCnt}]"/>
										</td>
									</c:when>
									<c:otherwise>
										<td>
											<img src="/css/icon/lock_icon.png" width="15px">
											<c:out value="${board.title}[${board.replyCnt}]"/>
										</td>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${empty board.users.username}">
										<td>${board.writer}</td>
									</c:when>
									<c:otherwise>
										<td>${board.users.username}</td>
									</c:otherwise>
								</c:choose>
								<td><fmt:formatDate value="${board.createDate}" pattern="YYYY-MM-dd"/></td>
							</tr>
						
					</c:if>
					<c:if test="${board.secret eq 'false'}">
					<!-- 공개글은 누구나 상세보기 가능-->
						<tr class="board_item">
							<td>${board.id}</td>
							<td onclick="location.href='/qna/${board.id}'">${board.title}[${board.replyCnt}]</td>
							<c:choose>
								<c:when test="${empty board.users.username}">
									<td>${board.writer}</td>
								</c:when>
								<c:otherwise>
									<td>${board.users.username}</td>
								</c:otherwise>
							</c:choose>
							<td><fmt:formatDate value="${board.createDate}" pattern="YYYY-MM-dd"/></td>
						</tr>
					</c:if>
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