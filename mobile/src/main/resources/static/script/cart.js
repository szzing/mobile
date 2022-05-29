
let index = {
	cartDelete : function(cartitemId){
		var con = confirm("정말로 삭제하시겠습니까?");
		if(con){
				$.ajax({ 
					type: "DELETE",
					url: `/api/cart/${cartitemId}`,
					dataType: "json"
				}).done(function(resp){
					alert("상품 삭제 성공!");
					location.href = `/cart`;
				}).fail(function(error){
					alert(JSON.stringify(error));
				}); 
			}
			
		},
};
index.init();