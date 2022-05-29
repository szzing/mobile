$(document).on("click", "#btn_order", function(){
	let data={
			color: $("#color").val(),
			storage: $("#storage").val(),
			beforetel: $("#beforetel").val(),
			aftertel: $("#aftertel").val(),
			telfeeid: $("#telfeeid").val(),
			productid: $("#productid").val(),
			userid: $("#userid").val(),
			dcchoice: $("#dcchoice").val(),
			dc_option: $("#dc_option").val(),
			period: $("#period").val(),
			/*birth: $("#birth").val(),*/
			newphone: $("#newphone").val(),
			email: $("#email").val(),
			postName: $("#postName").val(),
			postTel: $("#postTel").val(),
			zipcode: $("#zipcode").val(),
			address: $("#address").val(),
			addrdetail: $("#addrdetail").val(),
			requestmsg: $("#requestmsg").val()
		};
		console.log(data);
		$.ajax({ 
			type:"POST",
			url:"/api/order",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json",
			traditional:true
		}).done(function(resp){
			alert("주문이 완료되었습니다.");
			location.href="/delivery";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
});