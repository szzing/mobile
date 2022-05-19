<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="../css/product.css">
<link rel="stylesheet" href="../css/productDetail.css">

<div class="page_title">
	<h1 class="title">제품 페이지</h1>
</div>

<section>
	<div class="product_container">

		<div class="product_image">
			<img id="phoneimage" src="../css/images/product/detail/iphone13_midnight.jpg">
		</div>

		<div class="product_options">
			<div class="option_div">
				<h2 class="device_name">{상품명}</h2>
			</div>

			<div class="option_div">
				<span class="option_name">용량</span>
				<input type="radio" id="storage1" name="storage">
				<label for="storage1">128G</label>
				<input type="radio" id="storage2" name="storage">
				<label for="storage2">256G</label>
				<input type="radio" id="storage3" name="storage">
				<label for="storage3">512G</label>
			</div>

			<div class="option_div">
				<span class="option_name">색상</span>
				<ul class="device_colors">
					<!--미드나잇/핑크/블루/스타라이트/레드-->
					<li class="color_chip" onclick="colorchoice(this); imgchange1()" id="device_color1"></li>
					<li class="color_chip" onclick="colorchoice(this); imgchange2()" id="device_color2"></li>
					<li class="color_chip" onclick="colorchoice(this); imgchange3()" id="device_color3"></li>
					<li class="color_chip" onclick="colorchoice(this); imgchange4()" id="device_color4"></li>
					<li class="color_chip" onclick="colorchoice(this); imgchange5()" id="device_color5"></li>
				</ul>
			</div>

			<div class="option_div">
				<div class="option_name">기존통신사</div>
				<input type="radio" id="from_telecom1" name="from_telecom" value="SKT">
				<label for="from_telecom1">SKT</label>
				<input type="radio" id="from_telecom2" name="from_telecom" value="KT">
				<label for="from_telecom2">KT</label>
				<input type="radio" id="from_telecom3" name="from_telecom" value="LGU+">
				<label for="from_telecom3">LGU+</label>
				<input type="radio" id="from_telecom4" name="from_telecom" value="ETC">
				<label for="from_telecom4">알뜰폰</label>
			</div>

			<div class="option_div">
				<div class="option_name">변경통신사</div>
				<input type="radio" id="to_telecom1" name="to_telecom" value="SKT">
				<label for="to_telecom1">SKT</label>
				<input type="radio" id="to_telecom2" name="to_telecom" value="KT">
				<label for="to_telecom2">KT</label>
				<input type="radio" id="to_telecom3" name="to_telecom" value="LGU+">
				<label for="to_telecom3">LGU+</label>
				<input type="radio" id="to_telecom4" name="to_telecom" value="ETC">
				<label for="to_telecom4">알뜰폰</label>
			</div>

			<div class="option_div">
				<div class="option_name">할인방법</div>
				<input type="radio" id="discount1" name="discount" value="0">
				<label for="discount1">공시지원할인 0원</label>
				<input type="radio" id="discount2" name="discount" value="570000">
				<label for="discount2">선택약정할인 570,000원</label>
			</div>

			<div class="option_div">
				<div class="option_name">구매방법</div>
				<input type="radio" id="buyingway1" name="buyingway" value="1">
				<label for="buyingway1">일시불</label>
				<input type="radio" id="buyingway2" name="buyingway" value="24">
				<label for="buyingway2">24개월</label>
				<input type="radio" id="buyingway3" name="buyingway" value="30">
				<label for="buyingway3">30개월</label>
				<input type="radio" id="buyingway4" name="buyingway" value="36">
				<label for="buyingway4">36개월</label>
			</div>

			<div class="option_div">
				<div class="option_name">유심</div>
				<input type="radio" id="usim1" name="usim" value="new_usim">
				<label for="usim1">새 유심</label>
				<input type="radio" id="usim2" name="usim" value="exist_usim">
				<label for="usim2">기존 유심</label>
			</div>
			
			<div class="calc_price">
				<label for="basic_price">출고가</label>
				<input id="basic_price" type="number" value="1078000" disabled>
				<label for="discount_price">할인가</label>
				<input id="discount_price" type="number" value="0" disabled>
				<label for="total_price">합계</label>
				<input id="total_price" type="number" value="780000" disabled>
			</div>

			<div class="buttons_div">
				<button type="button" id="btn-buy" type="submit">바로구매</button>
				<button type="button" id="btn-cart" type="submit">장바구니</button>
			</div>

		</div>
	</div>

	<!--상세페이지 본문 시작-->
	<div class="device_content">
		<ul class="detail_page_menu">
			<li class="menu"><a href="#">제품정보</a></li>
			<li class="menu"><a href="#">구매후기</a></li>
			<li class="menu"><a href="#">1:1문의</a></li>
			<li class="menu"><a href="#">FAQ</a></li>
			<li class="menu"><a href="#">공지사항</a></li>
		</ul>

		<div class="product_detail_image">
			<img src="./imgfolder/iphone13content01.jpeg" width="100%">
		</div>

	</div>

</section>

<script type="text/javascript" src="../script/productDetail.js"></script>
<%@ include file="../layout/footer.jsp"%>