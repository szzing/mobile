$(document).on("click", "#btn-buy", function(){
	var dc = '';
	var option = '';
		if($('input[name="aftertel"]:checked').val()=='KT'){
			dc = document.getElementById("kt_option");
			option = $('#kt_option option:selected').val();
		}else if($('input[name="aftertel"]:checked').val()=='SKT'){
			dc = document.getElementById("skt_option");
			option = $('#skt_option option:selected').val();
		}else if($('input[name="aftertel"]:checked').val()=='LGUplus'){
			dc = document.getElementById("lg_option");
			option = $('#lg_option option:selected').val();
		}
		let data={
			productid: $("#productid").val(),
			storage : $('input[name="storage"]:checked').val(),
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
			type:"POST",
			url:"/order",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"text" ,
			traditional:true
		}).done(function(resp){
			alert("전송!");
			location.href="/order";

		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	
});
	

let index = {
	init: function() {
		$("#btn-telsave").on("click", () => {
			this.telsave();
		});
		
		$("#btn-feesave").on("click", () => {
			this.feesave();
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

