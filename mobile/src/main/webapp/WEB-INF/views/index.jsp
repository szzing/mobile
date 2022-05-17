<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp"%>
<link rel="stylesheet" href="./css/main.css">

<a id="topbtn" class="off">▲<br>TOP</a>
	
	<div class="intro_background">
        <!-- 
        <img class="intro_background_img" src="../css/images/main/background-g8d3776f9d_1920.jpg">
         -->
    <div class="main_intro">
	    <!-- <input type="button" value="◀" id="imgBackBtn"> -->
                <h1 class="main_intro_h1">Welcome to MO:BILE World</h1>
                <p class="main_intro_p">모빌에서만 누릴 수 있는 구매 혜택을 절대 놓치지 마세요!</p>
        <input type="button" value="▶" id="imgNextBtn">
    </div>
    </div>
        <!-- 배너 -->
        <div class="banners">
            <div class="ban_item ban1" onclick="location.href='/event'">다양한 이벤트</div>
            <div class="ban_item ban2" onclick="location.href='/test/review'">고객 리뷰</div>
        </div>

        <div class="main_goods">
            <!-- 베스트 상품 -->
            <div class="main_best">
                <hr>

                <div class="best_goods">
                <h2>베스트 상품</h2>
                
                    <div class="best_goods_wrap">
                        
                        <div class="best_item">
                                <img src="../css/images/product/phone/iphone13.jpg">
                                <div class="best_info">
                                    <h3>APPLE IPHONE13</h3>
                                    <p>출고가 <span class="line-through">1,078,000원</span><br>
                                        구매가 <span class="emphasis">780,000원</span></p>
                                </div>
                        </div>
                        
                        <div class="best_item">
                                <img src="../css/images/product/phone/galaxyzflip3.jpg">
                                <div class="best_info">
                                    <h3>SAMSUNG GALAXY Z-FLIP3</h3>
                                    <p>출고가 <span class="line-through">1,254,000원</span><br>
                                        구매가 <span class="emphasis">854,000원</span></p>
                                </div>
                        </div>
                        
                        <div class="best_item">
                                <img src="../css/images/product/phone/iphone13pro.jpg">
                                <div class="best_info">
                                    <h3>APPLE IPHONE13 PRO</h3>
                                    <p>출고가 <span class="line-through">1,342,000원</span><br>
                                        구매가 <span class="emphasis">934,200원</span></p>
                                </div>
                        </div>
                        
                    </div>
                    
                    <input type="button" value="인기상품 더 알아보기  &nbsp; &nbsp; ▶">
                </div>

                <hr>
            </div>

            <!-- 판매상품 -->
            <div class="main_products">
                <h2>전체 상품</h2>

                <div class="products_wrap">
                    <div class="products_left_item">
                        <h3>모빌에서 다양한 제품을 만나보세요</h3>
                    </div>
                    <div class="products_right_item">
                            <div class="smartphone">
                                <img src="../css/images/product/phone/phone.jpg">
                                <h3>스마트폰</h3>
                            </div>
                            <div class="tablet">
                                <img src="../css/images/product/tablet/ipad-air.jpg">
                                <h3>태블릿PC</h3>
                            </div>
                            <div class="etc">
                                <img src="../css/images/product/etc/cable.jpg">
                                <h3>주변 기기</h3>
                            </div>
                            <div class="more">
                                <h3>제품 더 알아보기 ▶</h3>
                            </div>
                    </div>
                </div>
            </div>
        </div>

<script type="text/javascript" src="./script/main.js"></script>
<%@ include file="./layout/footer.jsp"%>