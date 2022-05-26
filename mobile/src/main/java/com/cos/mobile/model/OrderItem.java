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
	private int productid;
	
	private String color;
	
	private int storage;
	
	private int amount;
	
	private String beforetel;
	
	private String tel;
	
	private int telecomfeeid;
	
	private int period;

}
