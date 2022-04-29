<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="../css/boardlist.css">
<link rel="stylesheet" href="../css/qna.css">

<div class="page_title">
	<h1 class="title">1:1 문의</h1>
</div>

<section>
	<div class="board_container">
	
		<h3>전체 문의글 목록</h3>
		<div class="buttons">
			<a><button class="btn skyblue">돌아가기</button></a>
			<a><button class="btn pink">글 작성</button></a>
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
			<!-- 여기에 반복문 걸어주세요 -->
			<!-- 반복문 시작 -->
				<tr class="board_item">
					<td>{id}</td>
					<td>{title}</td>
					<td>{name}</td>
					<td>{date}</td>
				</tr>
			<!-- 반복문 끝 -->
			</tbody>
			
		</table>

		<div class="pagination">
			<a><button class="page_item">이전페이지</button></a>
			<a><button class="page_item">다음페이지</button></a>
		</div>
	</div>

</section>
        
<%@ include file="../layout/footer.jsp"%>