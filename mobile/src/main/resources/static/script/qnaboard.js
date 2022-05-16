$(document).on("click", "#btn-qnasave", function(){
		let data={
			title: $("#title").val(),
			writer: $("#writer").val(),
			password: $("#password").val(),
			secret: $("input:checkbox[id='secret']").prop("checked"),
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
})

$(document).on("click", "#btn-delete", function(){
		var id=$("#id").val();
		$.ajax({ 
			type:"DELETE",
			url:"/api/qnaboard/"+id,
			dataType:"json" 

		}).done(function(resp){
			alert("삭제가 완료되었습니다.");
			location.href = document.referrer;	// 삭제된 게시판 목록 새로고침
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
})