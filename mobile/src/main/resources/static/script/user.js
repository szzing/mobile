function checkId(){
        var userid = $('#userid').val();
        $.ajax({
            url:'/auth/idcheck', //Controller에서 인식할 주소
            type:'post', //POST 방식으로 전달
            data:{userid: userid},
            success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
                if(cnt != 1){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                   	alert('사용가능한 아이디입니다');
                   	return false;
                } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                    alert('이미 사용중인 아이디입니다');
                    return false;
                }
            },
            error:function(){
                alert("에러입니다");
            }
        });
    };

let index = {
	init: function() {
		$("#btn-save").on("click", () => {
			if(document.querySelector("#userid").value == "" || document.querySelector("#username").value == "" || document.querySelector("#password").value == "" || document.querySelector("#phone").value == "" || document.querySelector("#email").value == "") {
				alert("필수 입력란을 모두 채워주세요.");
				return false;
			}
			if(document.querySelector("#password").value != document.querySelector("#pwcheck").value) {
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
			this.save();
		});
		
		$("#btn-adminsave").on("click", () => {
			this.adminsave();
		});
		
		$("#btn-login").on("click", () => {
			this.login();
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
	
	login: function() {
		
		let data={
			userid: $("#userid").val(),
			password: $("#password").val(),
		};
		if (userid === '') {
			alert('아이디를 입력해주세요.');
			return;
		}

		if (password === '') {
			alert('비밀번호를 입력해주세요.');
			return;
		}
		
		
		console.log(data); //자바스크립트 오브젝트
		$.ajax({ 
			type:"POST",
			url:"/api/user/login",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",	
			dataType:"json" 
		}).done(function(resp){
			if(resp.status==500){
				alert("로그인 실패! 다시 확인해주세요.");
			}else{
				alert("로그인 성공");
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
			address1: $("#address").val(),
			address2: $("#addrdetail").val(),
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
				location.href="/user/myPage";
	
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