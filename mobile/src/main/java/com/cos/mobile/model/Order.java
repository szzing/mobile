package com.cos.mobile.model;

import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Table(name="Orders")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class Order {
	@Id // 기본키
	private String id;
	
	private String color;
	
	private String storage;
	
	private String beforetel;
	
	private String aftertel;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="telfeeid")
	private TelecomFee telfee;
	
	@ManyToOne
	@JoinColumn(name="productid")
	private Product product;	// 상품id로 join
	
	@ManyToOne(fetch = FetchType.EAGER, optional = true)
	@JoinColumn(name="userid")
	private Users user;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss.S")
	private Date birth;
	
	private String newphone;
	
	private String posttel;
	
	private String postname;
	
	private String email;
	
	private String dcchoice;
	
	private int dc_option;
	
	@CreationTimestamp
	private Timestamp createDate;
	
	private String status;
	
	private String zipcode;
	
	private String address;
	
	private String addrdetail;
	
	private String requestmsg;	// 요청사항
}
