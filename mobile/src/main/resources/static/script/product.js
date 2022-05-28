let index = {
	init: function() {
		$("#btn-telsave").on("click", () => {
			this.telsave();
		});
		
		$("#btn-feesave").on("click", () => {
			this.feesave();
		});
		
		$("#btn-buy").on("click", () => {
			var dc = '';
			var option = '';
			if ($('input[name="aftertel"]:checked').val() == 'KT') {
				dc = document.getElementById("kt_option");
				option = $('#kt_option option:selected').val();
			} else if ($('input[name="aftertel"]:checked').val() == 'SKT') {
				dc = document.getElementById("skt_option");
				option = $('#skt_option option:selected').val();
			} else if ($('input[name="aftertel"]:checked').val() == 'LGUplus') {
				dc = document.getElementById("lg_option");
				option = $('#lg_option option:selected').val();
			}
			
			if(($('input[name="storage"]:checked').length < 1)) {
				alert("용량을 선택하세요.");
				return false;
			} else if(($('input[name="color"]:checked').length < 1)) {
				alert("색상을 선택하세요.");
				return false;
			} else if(($('input[name="beforetel"]:checked').length < 1)) {
				alert("기존 통신사를 선택하세요.");
				return false;
			} else if(($('input[name="aftertel"]:checked').length < 1)) {
				alert("변경할 통신사를 선택하세요.");
				return false;
			} else if(($('input[name="period"]:checked').length < 1)) {
				alert("할부기간을 선택하세요.");
				return false;
			} else if(dc.options[dc.selectedIndex].value==0) {
				alert("할인 옵션을 선택하세요.");
				return false;
			}
			this.ordercheck(dc, option);
		});
		
		$("#btn-check").on("click", () => {
			if($('#order-check').is(":checked") == false) {
				alert("선택한 옵션을 확인 후 동의해주세요.");
				return false;
			}
			
		});
	},
	
	ordercheck: function(dc, option) {
		let data = {
			productid: $("#productid").val(),
			storage: $('input[name="storage"]:checked').val(),
			color: $('input[name="color"]:checked').val(),
			beforetel: $('input[name="beforetel"]:checked').val(),
			aftertel: $('input[name="aftertel"]:checked').val(),
			telfeeid: $("#telfeeid").val(),
			dc_option: option,
			dcchoice: dc.options[dc.selectedIndex].text,
			period: $('input[name="period"]:checked').val()
		};
		console.log(data)

		$.ajax({
			type: "POST",
			url: "api/cart",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "text",
			traditional: true
		}).done(function(resp) {
			alert("장바구니 전송!");
			location.href = "/cart";
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	
	},
	
	
	telsave:function(){
		let data={
			name: $("#telname").val(),
		};
		$.ajax({ 
			type:"POST",
			url:"/api/admintel",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json" 
		}).done(function(resp){
			alert("통신사 추가 완료되었습니다.");
			location.href="/admin/telecom";

		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
	feesave:function(){
		let data={
			productid: $("#productid").val(),
			telid: $("#telid").val(),
			feename: $("#feename").val(),
			fee: $("#fee").val(),
			officialDc: $("#officialDc").val(),
			contractDc: $("#contractDc").val()
		};
		$.ajax({ 
			type:"POST",
			url:"/api/fee",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json" 
		}).done(function(resp){
			alert("요금제 추가 완료되었습니다.");
			location.href="/admin/telecom";

		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
	telDelete : function(telId){
		var con = confirm("정말로 삭제하시겠습니까?");
		if(con){
				$.ajax({ 
					type: "DELETE",
					url: `/api/telecom/${telId}`,
					dataType: "json"
				}).done(function(resp){
					alert("통신사 삭제 성공!");
					location.href = `/admin/telecom`;
				}).fail(function(error){
					alert(JSON.stringify(error));
				}); 
			}
			
		},
	
	feeDelete : function(feeId){
		var con = confirm("정말로 삭제하시겠습니까?");
		if(con){
				$.ajax({ 
					type: "DELETE",
					url: `/api/telecomfee/${feeId}`,
					dataType: "json"
				}).done(function(resp){
					alert("요금제 삭제 성공!");
					location.href = `/admin/telecom`;
				}).fail(function(error){
					alert(JSON.stringify(error));
				}); 
			}
			
		},
	proDelete : function(productId){
		var con = confirm("정말로 삭제하시겠습니까?");
		if(con){
				$.ajax({ 
					type: "DELETE",
					url: `/api/prodelete/${productId}`,
					dataType: "json"
				}).done(function(resp){
					alert("상품 삭제 성공!");
					location.href = `/admin/product`;
				}).fail(function(error){
					alert(JSON.stringify(error));
				}); 
			}
			
		},
};
index.init();

