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
					<c:if test="${board.secret eq 'true'}">
					<!-- 비밀글 작성자 본인과 관리자만 상세보기 가능 -->
						<tr class="board_item">
							<td>${board.id}</td>
								<c:if test="${empty board.user.username}">
									<!-- 비회원 글작성 -->
									<c:choose>
										<c:when test="${principal.user.roles eq 'ADMIN'||principal.user.roles eq 'SYSTEM'}">
											<!-- 관리자 상세보기 가능 -->
											<td onclick="location.href='/qna/${board.id}'">
												<img src="/css/icon/lock_icon.png" width="15px">
												<c:out value="${board.title}[${board.replyCnt}]"/>
											</td>
										</c:when>
										<c:otherwise>
											<!-- 관리자가 아니면 비번확인 페이지로 -->
											<td onclick="location.href='/qnachk/${board.id}'">
												<img src="/css/icon/lock_icon.png" width="15px">
												<c:out value="${board.title}[${board.replyCnt}]"/>
											</td>
										</c:otherwise>
									</c:choose>
								</c:if>
								<c:if test="${empty board.writer}">
									<!-- 회원 글작성 -->
									<c:choose>
										<c:when test="${!empty principal && board.user.id == principal.user.id 
										|| principal.user.roles eq 'ADMIN'||principal.user.roles eq 'SYSTEM'}">
											<!-- 글작성 회원 본인 & 관리자 상세보기 가능 -->
											<td onclick="location.href='/qna/${board.id}'">
												<img src="/css/icon/lock_icon.png" width="15px">
												<c:out value="${board.title}[${board.replyCnt}]"/>
											</td>
										</c:when>
										<c:otherwise>
											<!-- 그 외 접근은 클릭불가 -->
											<td>
												<img src="/css/icon/lock_icon.png" width="15px">
												<c:out value="${board.title}[${board.replyCnt}]"/>
											</td>
										</c:otherwise>
									</c:choose>
								</c:if>
				
								<!-- 작성자명 시작 -->
								<c:choose>
									<c:when test="${empty board.user.username}">
										<td>${board.writer}</td>
									</c:when>
									<c:otherwise>
										<td>${board.user.username}</td>
									</c:otherwise>
								</c:choose>
								<!-- 작성자명 끝 -->
								<td><fmt:formatDate value="${board.createDate}" pattern="YYYY-MM-dd"/></td>
							</tr>
						
					</c:if>

<%-- 					<c:if test="${board.secret eq 'false'}">
					<!-- 공개글은 누구나 상세보기 가능-->
						<tr class="board_item">
							<td>${board.id}</td>
							<td onclick="location.href='/qna/${board.id}'">${board.title}[${board.replyCnt}]</td>
							<c:choose>
								<c:when test="${empty board.user.username}">
									<td>${board.writer}</td>
								</c:when>
								<c:otherwise>
									<td>${board.user.username}</td>
								</c:otherwise>
							</c:choose>
							<td><fmt:formatDate value="${board.createDate}" pattern="YYYY-MM-dd"/></td>
						</tr>
					</c:if> --%>
				</c:forEach>
				
				</tbody>
			
			</table>

			<div class="pagination">
				<c:choose>
					<c:when test="${board.first}">
						<a><button class="page_item disabled">이전페이지</button></a>
					</c:when>
					<c:otherwise>
						<a href="?page=${board.number-1}"><button class="page_item">이전페이지</button></a>
					</c:otherwise>
				</c:choose>
				
				<!-- 숫자 블럭 영역 -->
				<c:forEach var="i" begin="${startBlockPage}" end="${endBlockPage}">
					<c:choose>
						<c:when test="${board.pageable.pageNumber+1==i}">
							<a class="disable" href="?page=${i-1}">[${i}]</a>
						</c:when>
						<c:otherwise>
							<a href="?page=${i-1}">[${i}]</a>
						</c:otherwise>
					</c:choose>
		        </c:forEach>
				<!--  -->
				
				<c:choose>
					<c:when test="${board.last}">
						<a><button class="page_item disabled">다음페이지</button></a>
					</c:when>
					<c:otherwise>
						<a href="?page=${board.number+1}"><button class="page_item">다음페이지</button></a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</section>
        
<%@ include file="../layout/footer.jsp"%>