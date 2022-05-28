package com.cos.mobile.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Table(name="CartItem")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@SequenceGenerator(
		name ="CART_SEQ_GENERATOR"
		, sequenceName="CART_SEQ"
		,initialValue=1
		, allocationSize=1
		)
public class CartItem {
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="CART_SEQ_GENERATOR")
	private int id;
	
	// 상품
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="productid")
	private Product product;
	
	// 상품색상
	private String color;
	
	// 상품용량
	private int storage;
	
	// 기존 통신사
	private String beforetel;
	
	// 변경할 통신사
	private String aftertel;
	
	// 요금제 id
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="telfeeid")
	private TelecomFee telfee;
	
	// 선택약정, 공시지원
	private String dcchoice;
	
	// 할인금액
	private int dc_option;
	
	// 할부 기간
	private int period;
	
	@ManyToOne(fetch = FetchType.EAGER, optional = true)
	@JoinColumn(name="userid", foreignKey = @ForeignKey(foreignKeyDefinition = "FOREIGN KEY (userid) references users (id) ON DELETE SET NULL"))
	private Users user;

}
