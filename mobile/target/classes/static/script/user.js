let index = {
	init: function() {
		$("#btn-save").on("click", () => {
			this.save();
		});
		
		$("#btn-adminsave").on("click", () => {
			this.adminsave();
		});
		
		$("#btn-update").on("click", () => {
			this.update();
		});
		
		$("#btn-userdelete").on("click", () => {
			this.userDelete();
		});
	},

	save: function() {
		let data={
			userid: $("#userid").val(),
			username: $("#username").val(),
			password: $("#password").val(),
			phone: $("#phone").val(),
			email: $("#email").val()
		};
		console.log(data); //자바스크립트 오브젝트
		$.ajax({ 
			type:"POST",
			url:"/api/user",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",	
			dataType:"json" 
		}).done(function(resp){
			if(resp.status==500){
				alert("회원가입에 실패하였습니다.");
			}else{
				alert("회원가입이 완료되었습니다.");
				location.href="/";
			}
			
		}).fail(function(error){
			// alert(JSON.stringify(error));
		});
	},
	
	adminsave: function() {
		let data={
			userid: $("#userid").val(),
			username: $("#username").val(),
			password: $("#password").val(),
			phone: $("#phone").val(),
			email: $("#email").val()
		};
		console.log(data); //자바스크립트 오브젝트
		$.ajax({ 
			type:"POST",
			url:"/api/admin",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",	
			dataType:"json" 
		}).done(function(resp){
			if(resp.status==500){
				alert("관리자 계정 생성에 실패하였습니다.");
			}else{
				alert("관리자 계정 생성이 완료되었습니다.");
				location.href="/";
			}
			
		}).fail(function(error){
			// alert(JSON.stringify(error));
		});
	},
	
	update: function() {
			let data={
			id: $("#id").val(),
			userid: $("#userid").val(),
			username: $("#username").val(),
			password: $("#password").val(),
			phone: $("#phone").val(),
			email: $("#email").val(),
			zipcode: $("#zipcode").val(),
			address1: $("#address1").val(),
			address2: $("#address2").val(),
			oauth: $("#oauth").val()
			};
			
			$.ajax({ 
				type:"PUT",
				url:"/user",
				data:JSON.stringify(data),
				contentType:"application/json; charset=utf-8",
				dataType:"json" 
			
			}).done(function(resp){
				alert("회원수정이 완료되었습니다.");
				location.href="/";
	
			}).fail(function(error){
				// alert(JSON.stringify(error));
	
			});
	},
	
	userDelete: function(){
		var id=$("#id").val();
		$.ajax({ 
			type:"DELETE",
			url:"/api/user/"+id,
			dataType:"json" 

		}).done(function(resp){
			alert("회원 탈퇴 완료되었습니다.");
			location.href="/";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
}
index.init();