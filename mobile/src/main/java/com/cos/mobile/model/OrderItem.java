package com.cos.mobile.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OrderItem {
	// 상품ID
	private int productid;
	
	// 상품색상
	private String color;
	
	// 상품용량
	private int storage;
	
	// 기존 통신사
	private String beforetel;
	
	// 변경할 통신사
	private String aftertel;
	
	// 요금제 id
	private int telfeeid;
	
	// 선택약정, 공시지원
	private String dcchoice;
	
	// 할인금액
	private int dc_option;
	
	// 할부 기간
	private int period;

}
