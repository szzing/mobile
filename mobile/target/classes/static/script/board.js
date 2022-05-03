let index = {
	init: function() {
		$("#btn-eventsave").on("click", () => {
			this.eventsave();
		});
		
		$("#btn-noticesave").on("click", () => {
			this.noticesave();
		});
		
		$("#btn-faqsave").on("click", () => {
			this.faqsave();
		});
		
		$("#btn-delete").on("click", () => {
			this.deleteById();
		});
		$("#btn-update").on("click", () => {
			this.update();
		});
		
		$("#btn-reply-save").on("click", () => {
			this.replySave();
		});
		
	},
	
	
	eventsave:function(){
		let data={
			title: $("#title").val(),
			category: $("#category").val(),
			content: $("#content").val()
		};
		$.ajax({ 
			type:"POST",
			url:"/api/adminboard",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json" 
		}).done(function(resp){
			alert("글쓰기가 완료되었습니다.");
			location.href="/event";

		}).fail(function(error){
			alert(JSON.stringify(error));

		});
	},
	
	noticesave:function(){
		let data={
			title: $("#title").val(),
			category: $("#category").val(),
			content: $("#content").val()
		};
		$.ajax({ 
			type:"POST",
			url:"/api/adminboard",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json" 
		}).done(function(resp){
			alert("글쓰기가 완료되었습니다.");
			location.href="/notice";

		}).fail(function(error){
			alert(JSON.stringify(error));

		});
	},
	
	faqsave:function(){
		let data={
			title: $("#title").val(),
			category: $("#category").val(),
			content: $("#content").val()
		};
		$.ajax({ 
			type:"POST",
			url:"/api/adminboard",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json" 
		}).done(function(resp){
			alert("글쓰기가 완료되었습니다.");
			location.href="/faq";

		}).fail(function(error){
			alert(JSON.stringify(error));

		});
	},
	
	deleteById: function(){
		var id=$("#id").val();
		$.ajax({ 
			type:"DELETE",
			url:"/api/board/"+id,
			dataType:"json" 

		}).done(function(resp){
			alert("삭제가 완료되었습니다.");
			location.href = document.referrer;	// 삭제된 게시판 목록 새로고침
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
	update: function(){
		var id=$("#id").val();
		let data={
			title: $("#title").val(),
			content: $("#content").val()
		};
		$.ajax({ 
			type:"PUT",
			url:"/api/board/"+id,
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json" 
		}).done(function(resp){
			alert("글 수정이 완료되었습니다.");
			location.href = document.referrer;
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
	replySave:function(){
		let data={
			userId: $("#userId").val(),
			boardId: $("#boardId").val(),
			content: $("#reply-content").val()
		};
		
		$.ajax({ 
			type:"POST",
			url:`/api/board/${data.boardId}/reply`,
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json" 
		}).done(function(resp){
			alert("댓글 작성이 완료되었습니다.");
			location.href=`/board/${data.boardId}`;

		}).fail(function(error){
			alert(JSON.stringify(error));

		});
	},
	
	replyDelete : function(boardId, replyId){
			$.ajax({ 
				type: "DELETE",
				url: `/api/board/${boardId}/reply/${replyId}`,
				dataType: "json"
			}).done(function(resp){
				alert("댓글삭제 성공");
				location.href = `/board/${boardId}`;
			}).fail(function(error){
				alert(JSON.stringify(error));
			}); 
		},
}
index.init();