package com.cos.mobile.dto;

import java.sql.Date;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDto {
	private int id;
	
	private String color;
	
	private String storage;
	
	private String beforetel;
	
	private String aftertel;
	
	private int telfeeid;
	
	private int productid;
	
	private int userid;
	
	private Date birth;
	
	private String newphone;
	
	private String posttel;
	
	private String postname;
	
	private String email;
	
	private String dcchoice;
	
	private int dc_option;
	
	private String status;
	
	private String zipcode;
	
	private String address;
	
	private String addrdetail;
	
	private String requestmsg;
}
