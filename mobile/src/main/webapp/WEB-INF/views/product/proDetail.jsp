<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="../css/product.css">

<section>
<div>
	<!-- 상품이미지 출력 (외부경로에 맞는 파일이 있어야 출력됨) -->
	<img src="/images/${product.imgName}" width="300px">
</div>

상품명 : ${product.name} <br/>
제조사 : ${product.maker} <br/>
상품분류 : ${product.category} <br/>
출고가 : ${product.price} <br/>
할인 : ${product.dcprice} <br/>
할부원금은 출고가-할인액-추가할인액-선택요금제에 따라서 결정<br/>
용량 : ${product.storage}G <br/>
--고객이 선택하는 옵션 영역이 별도로 필요--
<form>
	<div>
		사용중인 통신사 : 
		<input name="beforetel" id="beforetel1" value="SKT" type="radio">
		<label for="tel1">SKT</label>
		<input name="beforetel" id="beforetel2" value="KT" type="radio">
		<label for="tel2">KT</label>
		<input name="beforetel" id="beforetel3" value="LGUplus" type="radio">
		<label for="tel3">LGU+</label>
		<input name="beforetel" id="beforetel4" value="altteul" type="radio">
		<label for="tel4">알뜰폰</label>
	</div>

	<div>
		사용하실 통신사 : 
		<input name="tel" id="tel1" value="SKT" type="radio">
		<label for="tel1">SKT</label>
		<input name="tel" id="tel2" value="KT" type="radio">
		<label for="tel2">KT</label>
		<input name="tel" id="tel3" value="LGUplus" type="radio">
		<label for="tel3">LGU+</label>
	</div>
	<div id="colors" class="colors">
		색상: 색상옵션 자바스크립트 반복문으로 출력하려했으나 document.body.append 태그를 바꾸면 화면에 출력이 안됨<br>
		다른 위치에서 출력 필요, 화면 맨 아래에 나오고있어요<br>
	</div>
	<hr>
	<div>
		- 옵션으로 선택가능할 요금제 영역 -
		(통신사별 분류예정)
		<!-- 반복문으로 요금제 목록 출력 -->
		<c:forEach var="telecomfee" items="${telecomfee}">
			<div>
				통신사명 ${telecomfee.telecom.name}/
				요금제명 ${telecomfee.feeName}/
				요금(원) ${telecomfee.fee}
			</div>
		</c:forEach>

	</div>

	
</form>
<button>신청하기</button>
<hr>
//상품상세내용// <br>
${product.content}
</section>
		<script>
			//DB 상품 색상 옵션을 가져옴
			var beforeStr = "${product.color}";
			//여러 색상이 저장되어있어 , 로 나누어 배열로 저장함
			var afterStr = beforeStr.split(',');
			for(var i=0; i< afterStr.length; i++){
				// 콘솔에서 배열로 저장된 색상옵션 확인 가능함
				console.log(afterStr[i]);
			}
	
			// 요소 생성 함수
			function createInput(color) {
				for(var i=0; i< afterStr.length; i++){
					
					// input 태그를 만든다.
					var $input = document.createElement('input');
					// 태그의 name을 설정한다.
					$input.name = color;
					// 태그의 type을 설정한다.
					$input.type = "radio";
					// 생성된 태그를 리턴한다.
					return $input;
				}
				
			}
			
			for(var i=0; i< afterStr.length; i++){
				// id가 color+i+1이고 value가 컬러 옵션명
				$input = createInput("color");
				$input.id = "color"+(i+1);
				// 태그의 value를 설정한다.
				$input.value = afterStr[i];
				// body에 가장 아래</body>태그의 바로 위에 input 태그를 추가
				document.body.append($input);
				// input(radio) 앞에 컬러옵션명 출력
				$input.before('/ '+afterStr[i]+'');
			}
</script>

<%@ include file="../layout/footer.jsp"%>