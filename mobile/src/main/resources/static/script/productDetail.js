/*$("input:radio[name=dc]").click(function(){			
		if($("input[name='dc']:checked").val()=='선택약정'){
				$('.officialDc').hide();
				$('.contractDc').show();
			}else if($("input[name='dc']:checked").val()=='공시지원'){
				$('.contractDc').hide();
				$('.officialDc').show();
			}
	});*/

$(document).ready(function(){
	$('.skt').hide();
	$('.kt').hide();
	$('.lguplus').hide();
			
		$("input[name='aftertel']").change(function(){
			$('.telecom_msg').hide();
			if ($("input[name='aftertel']:checked").val()=='SKT'){
				$('.kt').hide();
				$('.lguplus').hide();
				$('.skt').show();
				
			} else if($("input[name='aftertel']:checked").val()=='KT'){
				$('.skt').hide();
				$('.lguplus').hide();
				$('.kt').show();
				
			} else if($("input[name='aftertel']:checked").val()=='LGUplus'){
				$('.skt').hide();
				$('.kt').hide();
				$('.lguplus').show();

			}
		});
});

let getObj = "";

function saveObj(obj) {
	getObj = obj;
	calcPrice(getObj);
}

$("input[name='period']").click(function() {
	calcPrice(getObj);
});


function calcPrice(getObj) {	
	// 약정기간
	let per_value = $("input[name='period']:checked").val();
	let period = Number(per_value);
	
	document.getElementById('getperiod').value = period;
	
	// 할인옵션
	const sel_dc = getObj;
	let dc_idx = Number(sel_dc.selectedIndex);
	let dc_value = 0;
	
	// 월납입액
	const pro_price = Number(document.getElementById('product_price').value);//제품가
	const pro_dcprice = Number(document.getElementById('product_dcprice').value);//할인가
	let principal = pro_price-pro_dcprice;//할부원금
		
	if(dc_idx==1 && !isNaN(period)) { //선택약정
		principal = pro_price-pro_dcprice;
		document.getElementById('product_principal').value = principal.toLocaleString()+'원';
		
		if(period==1) {
			dc_value = Math.floor(Number(sel_dc.options[1].value * 0.25 * 12));
		} else {
			dc_value = Math.floor(Number(sel_dc.options[1].value * 0.25 * period));
		}
		document.getElementById('dc_option_print').value = dc_value.toLocaleString()+'원';
		
		mon_price = Math.floor(Number(principal / period));
		document.getElementById('month_price').value = mon_price.toLocaleString()+'원';
		
		fee_value = Math.floor(Number(sel_dc.options[1].value * 0.75));
		document.getElementById('month_fee').value = fee_value.toLocaleString()+'원';
		
		if(period==1) {
			total_value = Number(fee_value);
		} else {
			total_value = Number(mon_price + fee_value);
		}
		
		document.getElementById('month_total').value = total_value.toLocaleString()+'원';
		
	} else if(dc_idx==2 && !isNaN(period)){ //공시지원
		dc_value = Number(sel_dc.options[2].value);
		principal = pro_price-pro_dcprice-dc_value;
		document.getElementById('product_principal').value = principal.toLocaleString()+'원';
		document.getElementById('dc_option_print').value = dc_value.toLocaleString()+'원';
		
		mon_price = Math.floor(Number(principal / period));
		document.getElementById('month_price').value = mon_price.toLocaleString()+'원';
		
		fee_value = Number(sel_dc.options[1].value);
		document.getElementById('month_fee').value = fee_value.toLocaleString()+'원';
		
		if(period==1) {
			total_value = Number(fee_value);
		} else {
			total_value = Number(mon_price + fee_value);
		}
		
		document.getElementById('month_total').value = total_value.toLocaleString()+'원';
		
	} else { //기타
		document.getElementById('dc_option_print').value = '';
		document.getElementById('month_price').value = '';
		document.getElementById('month_fee').value = '';
		document.getElementById('month_total').value = '';
	}
}