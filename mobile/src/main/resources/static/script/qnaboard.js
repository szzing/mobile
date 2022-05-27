let index = {
	replyDelete : function(boardId, replyId){
			$.ajax({ 
				type: "DELETE",
				url: `/api/qna/${boardId}/reply/${replyId}`,
				dataType: "json"
			}).done(function(resp){
				alert("댓글삭제 성공");
				location.href = `/qna/${boardId}`;
			}).fail(function(error){
				alert(JSON.stringify(error));
			}); 
		},
}


$(document).on("click", "#btn-replydelete", function(boardId, replyId){
		console.log(boardId)
		console.log(replyId)
			$.ajax({ 
				type: "DELETE",
				url: `/api/qna/${boardId}/reply/${replyId}`,
				dataType: "json"
			}).done(function(resp){
				alert("댓글삭제 성공");
				location.href = `/qna/${boardId}`;
			}).fail(function(error){
				alert(JSON.stringify(error));
			}); 
});

$(document).on("click", "#btn-replysave", function(){
	let data={
			userId: $("#userId").val(),
			qnaboardId: $("#boardId").val(),
			writer: $("#writer").val(),
			content: $("#replycontent").val()
		};
		
		$.ajax({ 
			type:"POST",
			url:`/api/qna/${data.qnaboardId}/reply`,
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json" 
		}).done(function(resp){
			alert("댓글 작성이 완료되었습니다.");
			location.href=`/qna/${data.qnaboardId}`;
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
});

$(document).on("click", "#btn-qnachk", function(){
	let id = $("#id").val();
	let data={
		id: $("#id").val(),
		pass: $("#pass").val()
	}	
	$.ajax({
			type:"post",
			url:"/api/qnapass",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json"
		}).done(function(resp){
			if(resp.check == 1) {
				location.href = "/qna/"+id
			} else {
				alert("비밀번호가 맞지 않습니다. 다시 확인해주세요.");
			}
		}).fail(function(error){
			// alert(JSON.stringify(error));
		});

});

$(document).on("click", "#btn-update", function(){
	var id=$("#id").val();
		let data={
			title: $("#title").val(),
			pass: $("#pass").val(),
			secret: $("#secret").val(),
/* 비밀글 체크박스 필요할 때 secret: $('input[name="secret"]:checked').val(),*/
			content: $("#summernote").val()
		};
		$.ajax({ 
			type:"PUT",
			url:"/api/qna/"+id,
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json" 
		}).done(function(resp){
			alert("글 수정이 완료되었습니다.");
			location.href="/auth/qna";
			// location.href = document.referrer;
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
});

$(document).on("click", "#btn-qnasave", function(){
		let data={
			title: $("#title").val(),
			writer: $("#writer").val(),
			pass: $("#loginpass").val(),
			secret: $("#secret").val(),
/* 비밀글 체크박스 필요할 때 secret: $('input[name="secret"]:checked').val(),*/
			content: $("#summernote").val()
		};
		$.ajax({ 
			type:"POST",
			url:"/api/qnaboard",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json" 
		}).done(function(resp){
			alert("글쓰기가 완료되었습니다.");
			location.href="/auth/qna";

		}).fail(function(error){
			alert(JSON.stringify(error));

		});
});

$(document).on("click", "#btn-qnasave2", function(){
		let data={
			title: $("#title").val(),
			writer: $("#writer").val(),
			pass: $("#pass").val(),
			secret: $("#secret").val(),
/* 비밀글 체크박스 필요할 때 secret: $('input[name="secret"]:checked').val(),*/
			content: $("#summernote").val()
		};
		$.ajax({ 
			type:"POST",
			url:"/api/qna",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json" 
		}).done(function(resp){
			alert("글쓰기가 완료되었습니다.");
			location.href="/auth/qna";

		}).fail(function(error){
			alert(JSON.stringify(error));

		});
})

$(document).on("click", "#btn-delete", function(){
		var id=$("#id").val();
		$.ajax({ 
			type:"DELETE",
			url:"/api/qnaboard/"+id,
			dataType:"json" 

		}).done(function(resp){
			alert("삭제가 완료되었습니다.");
			location.href = "/auth/qna";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
})