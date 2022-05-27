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
		<h2>1:1문의 상세보기</h2>
		<div class="buttons">
			<a href="/auth/qna"><button class="btn skyblue">목록으로 돌아가기</button></a>
		</div>
		<input id="id" type="hidden" value="${board.id}">
		
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
		<!-- 글작성자 본인과 관리자만 삭제버튼 -->
		<c:choose>
			<c:when test="${!empty principal && board.users.id == principal.user.id 
			|| principal.user.roles eq 'ADMIN'||principal.user.roles eq 'SYSTEM'}">
				<div class="detail_btns">
					<!-- 글 작성자 본인만 수정버튼 -->
					<c:if test="${board.users.id == principal.user.id}">
						<a href="/board/${board.id}/qnaUpdate"><button type="button">수정</button></a>
					</c:if>
					<button id="btn-delete">삭제</button>
				</div>
			</c:when>
			<c:otherwise>
				<!-- 비로그인 사용자가 작성한 글 -->
				 <c:if test="${empty board.users.username}">
					<div class="detail_btns">
							<a href="/board/${board.id}/qnaUpdate"><button type="button">수정</button></a>
							<button id="btn-delete">삭제</button>
					</div>
				</c:if>
			</c:otherwise>
		</c:choose>
		
		
		<!-- 댓글 표시 영역 -->
	<div>
		<br><hr>
		<h2>댓글표시영역</h2>
		<c:forEach var="reply" items="${board.reply}">
				<c:choose>
					<c:when test="${empty reply.users.username&&empty reply.writer}">
						<b>작성자 : 알 수 없음</b>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${!empty reply.writer}">
								<b>작성자 :${reply.writer}</b>
							</c:when>
							<c:otherwise>
								<b>작성자 : ${reply.users.username}</b>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
				작성일자 : <fmt:formatDate value="${reply.createDate}" pattern="YYYY-MM-dd HH:mm" />
				<div>내용 : ${reply.content}</div>
				<div class="detail_btns">
					<button onClick="index.replyDelete(${board.id}, ${reply.id})">삭제</button>
				</div>
		</c:forEach>
	</div>
		<!-- 댓글 작성 영역 -->
		<c:choose>
			<c:when test="${!empty principal}">
			<!-- 로그인 댓글작성 -->
			<form>
			 	<input type="hidden" id="userId" value="${principal.user.id}" /> 
				<input type="hidden" id="boardId" value="${board.id}" />
				<div class="board_input_box">
				
					<label for="content" class="labels">댓글 작성</label>
					<textarea class="input_item board_textarea" placeholder="댓글을 입력해주세요. rows 변경해도 영역 크기가 안줄어드는것같아요" id="replycontent" rows="2"></textarea>
				</div>
			</form>
			<div class="detail_btns">
				<button type="button" id="btn-replysave" >댓글 등록</button>
			</div>
			</c:when>
			<c:otherwise>
				<form>
					<input type="hidden" id="boardId" value="${board.id}" />
					<div>
							<!-- json 전송용 데이터 -->
							<input type="hidden" id="userId" value="100"/>
							<!-- 로그인 안한 사용자는 작성자명 직접 입력함 -->
							작성자명 : <input type="text" id="writer" name="writer"/> 
				
						<label for="content" class="labels">댓글 작성</label>
						<textarea placeholder="댓글을 입력해주세요." id="replycontent" rows="3" cols="100"></textarea>
					</div>
				</form>
				<div class="detail_btns">
					<button type="button" id="btn-replysave" >댓글 등록</button>
				</div>
			</c:otherwise>
		</c:choose>	 
			
		
	</div>
</section>
<script type="text/javascript" src="/script/qnaboard.js"></script>
<%@ include file="../layout/footer.jsp"%>