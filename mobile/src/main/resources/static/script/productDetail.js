let productPrice = document.getElementById('product_price').value;
let dcPrice = document.getElementById('product_dcprice').value;

// 요금제 선택
$(document).ready(function(){
	let infoPrice = document.getElementById('product_infoprice');
	infoPrice.value = Number(productPrice - dcPrice).toLocaleString()+"원";
	
	$('.fee_select').hide();
	$('.skt').hide();
	$('.kt').hide();
	$('.lguplus').hide();
		$("input[name='aftertel']").change(function(){
			$('.fee_select').show();
			$('.fee_select').val("0").prop("selected", true);
			saveFee();
			
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

$('.fee_select').change(function(){
	saveFee();
});

let selectedFee = 0;
let selectedOfficialDc = 0;
let telfeeid = 0;

// 선택 요금제 금액 저장
function saveFee(){
	let feeSelectBox = document.getElementById('telecom_fee_option');
	let selectedFeeArr = feeSelectBox.options[feeSelectBox.selectedIndex].value.split('+');
	
	selectedFee = Number(selectedFeeArr[0]);
	selectedOfficialDc = Number(selectedFeeArr[1]);
	telfeeid = Number(selectedFeeArr[2]);
};

// 옵션이 변경될 때마다 요금 계산
$('.options_box').change(function() {
	saveFee();
	calcFee();
});

let productPrincipal = 0;
let dc_value = 0;
let mon_value = 0;
let fee_value = 0;
let total_value = 0;
	
// 요금 계산
function calcFee(){
	let period = $("input[name='period']:checked").val();
	let dc = $("input[name='dcoption']:checked").val();
	
	if(dc == "선택약정" && !isNaN(period)) {
		//할부원금
		productPrincipal = productPrice - dcPrice;
		document.getElementById('product_principal').value = Number(productPrincipal).toLocaleString()+"원";
		
		//옵션할인
		if(period==1) {
			dc_value = Math.floor(selectedFee * 0.25 * 12);
		} else {
			dc_value = Math.floor(selectedFee * 0.25 * period);
		}
		document.getElementById('dc_option').value = Number(dc_value).toLocaleString()+'원';
		
		mon_value = Math.floor(Number(productPrincipal / period));
		document.getElementById('month_price').value = mon_value.toLocaleString()+'원';
		
		fee_value = Math.floor(Number(selectedFee * 0.75));
		document.getElementById('month_fee').value = fee_value.toLocaleString()+'원';
		
		if(period==1) {
			total_value = Number(fee_value);
		} else {
			total_value = Number(mon_value + fee_value);
		}
		
		document.getElementById('month_total').value = total_value.toLocaleString()+'원';
		
	} else if(dc == "공시지원" && !isNaN(period)) {
		productPrincipal = productPrice - dcPrice - selectedOfficialDc;
		document.getElementById('product_principal').value = Number(productPrincipal).toLocaleString()+"원";

		dc_value = selectedOfficialDc;
		document.getElementById('dc_option').value = dc_value.toLocaleString()+'원';
		
		mon_value = Math.floor(Number(productPrincipal / period));
		document.getElementById('month_price').value = mon_value.toLocaleString()+'원';
		fee_value = Number(selectedFee);
		document.getElementById('month_fee').value = fee_value.toLocaleString()+'원';
		
		if(period==1) {
			total_value = Number(fee_value);
		} else {
			total_value = Number(mon_value + fee_value);
		}
		
		document.getElementById('month_total').value = total_value.toLocaleString()+'원';
		
	} else {
		document.getElementById('dc_option').value = '원';
		document.getElementById('month_price').value = '원';
		document.getElementById('month_fee').value = '원';
		document.getElementById('month_total').value = '원';
	}

}