<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="../css/qna.css">
<link rel="stylesheet" href="../css/boardform.css">
<link rel="stylesheet" href="../css/boardlist.css">

<div class="page_title">
	<h1 class="title">고객센터</h1>
</div>

<section>
	
	<div class="board_container">	
		<h2>1:1문의 상세보기</h2>
		<div class="buttons">
			<a href="/auth/qna"><button class="btn skyblue">목록으로 돌아가기</button></a>
			
			<!-- 글작성자 본인과 관리자만 삭제버튼 -->
			<c:choose>
				<c:when
					test="${!empty principal && board.user.id == principal.user.id 
			|| principal.user.roles eq 'ADMIN'||principal.user.roles eq 'SYSTEM'}">
					<div class="detail_btns">
						<!-- 글 작성자 본인만 수정버튼 -->
						<c:if test="${board.user.id == principal.user.id}">
							<button type="button" class="pink" onclick="location.href='/board/${board.id}/qnaUpdate'">수정</button>
						</c:if>
						<button id="btn-delete" class="pink">삭제</button>
					</div>
				</c:when>
				<c:otherwise>
					<!-- 비로그인 사용자가 작성한 글 -->
					<c:if test="${empty board.user.username}">
						<div class="detail_btns">
							<button type="button" class="pink" onclick="location.href='/board/${board.id}/qnaUpdate'">수정</button>
							<button id="btn-delete" class="pink">삭제</button>
						</div>
					</c:if>
				</c:otherwise>
			</c:choose>
		
		</div>
		<input id="id" type="hidden" value="${board.id}">
		
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
		
		<div class="reply_area">
		<div class="write_reply">
		<p class="labels">댓글 작성</p>
			<div class="reply_write">
		<!-- 댓글 작성 영역 -->
			<form>
			 	<input type="hidden" id="userId" value="${principal.user.id}" /> 
				<input type="hidden" id="boardId" value="${board.id}" />
				<textarea class="reply_textarea" placeholder="댓글을 입력해주세요." id="replycontent" rows="3" style="resize: none;"></textarea>
			</form>
			<div class="reply_btn">
				<a id="btn-replysave">등록</a>
			</div>
		</div>
		</div>
		
		<!-- 댓글 표시 영역 -->
		<div class="load_reply">
			<p class="labels">댓글 목록</p>
			<c:if test="${empty board.reply}">
			<div class="reply_box">
				<span class="sys_massage">아직 작성된 댓글이 없습니다.</span>
				</div>
			</c:if>

				<c:forEach var="reply" items="${board.reply}">
			<div class="reply_box">
					<div class="reply_writer">
						<c:choose>
							<c:when test="${empty reply.users.username&&empty reply.writer}">
								<div class="reply_writer"><i class="bi bi-person-fill"></i> 알 수 없음</div>
							</c:when>

							<c:otherwise>
								<c:choose>
									<c:when test="${!empty reply.writer}">
										<div class="reply_writer"><i class="bi bi-person-fill"></i> ${reply.writer}</div>
									</c:when>

									<c:otherwise>
										<div class="reply_writer"><i class="bi bi-person-fill"></i> ${reply.users.username}</div>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="reply_content">
						<p>${reply.content}</p>
						<p class="reply_date">
							<fmt:formatDate value="${reply.createDate}"
								pattern="YYYY-MM-dd HH:mm" />
						</p>
					</div>
					<div class="reply_btn">
						<a onClick="index.replyDelete(${board.id}, ${reply.id})">삭제</a>
					</div>
			</div>
				</c:forEach>
		</div>
		</div>		
	</div>
</section>
<script type="text/javascript" src="/script/qnaboard.js"></script>
<%@ include file="../layout/footer.jsp"%>