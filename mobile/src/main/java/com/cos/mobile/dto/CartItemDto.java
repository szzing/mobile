package com.cos.mobile.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartItemDto {
	private int id;
	
	private int productid;
	
	private String color;
	
	private int storage;
	
	private String beforetel;
	
	private String aftertel;
	
	private int telfeeid;
	
	private String dcchoice;
	
	private int dc_option;
	
	private int period;
	
	private int userid;
}
