function execPostCode() {
         new daum.Postcode({
             oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
  
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                console.log(data.zonecode);
                console.log(fullRoadAddr);
                
                
                $("[name=zipcode]").val(data.zonecode);
                $("[name=address]").val(fullRoadAddr);
                
                /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
                document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
            }
         }).open();
     }
     
let index = {
	init: function() {
		$('#btn-idchk').on("click", () => {
			if(document.querySelector("#userid").value == "") {
				alert("아이디를 입력하세요.");
			}
			this.idcheck();
		});
		
		$("#btn-save").on("click", () => {
			if(document.querySelector("#userid").value == "" || document.querySelector("#username").value == "" || document.querySelector("#password").value == "" || document.querySelector("#phone").value == "" || document.querySelector("#email").value == "") {
				alert("필수 입력란을 모두 채워주세요.");
				return false;
			}
			if(document.querySelector("#idchk").value == 0) {
				alert("아이디 중복 확인을 해주세요.");
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
			let delConfirm = confirm("정말 탈퇴하시겠습니까?\n확인 시 되돌릴 수 없습니다.");
			if(!delConfirm) {
				return false;
			} else {
				this.userDelete();
			}
		});
	},
	
	idcheck: function() {
		const idchk = document.querySelector("#idchk");
		idchk.value = 0;
		let userid = $("#userid").val();
		
		$.ajax({
			async:true,
			type:"GET",
			url:"/api/idcheck/"+userid,
		}).done(function(resp){
			if(resp.existId == 0) {
				alert("사용 가능한 아이디입니다.");
				idchk.value = 1;
			} else {
				alert("이미 존재하는 아이디 입니다.");
				idchk.value = 0;
			}
		}).fail(function(error){
			// alert(JSON.stringify(error));
		});
	},

	save: function() {
		let data={
			userid: $("#userid").val(),
			username: $("#username").val(),
			password: $("#password").val(),
			phone: $("#phone").val(),
			email: $("#email").val(),
			zipcode : $("#zipcode").val(),
			address : $("#address").val(),
			addrdetail: $("#addrdetail").val()
		};
		
		$.ajax({ 
			type:"POST",
			url:"/auth/joinProc",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",	
			dataType:"json"
			
		}).done(function(resp){
			if(resp.status==500){
				alert("회원가입에 실패하였습니다.");
			}else{
				alert("회원가입이 완료되었습니다.");
				location.href="/auth/loginForm";
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

		$.ajax({ 
			type:"POST",
			url:"/auth/adminjoin",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",	
			dataType:"json" 
		}).done(function(resp){
			if(resp.status==500){
				alert("관리자 계정 생성에 실패하였습니다.");
			}else{
				alert("관리자 계정 생성이 완료되었습니다.");
				location.href="/auth/loginForm";
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
			zipcode : $("#zipcode").val(),
			address : $("#address").val(),
			addrdetail: $("#addrdetail").val(),
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