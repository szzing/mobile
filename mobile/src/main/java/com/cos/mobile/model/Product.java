package com.cos.mobile.model;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name="Products")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@SequenceGenerator(
		name ="PRO_SEQ_GENERATOR"
		, sequenceName="PRO_SEQ"
		,initialValue=1
		, allocationSize=1
		)
public class Product {
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="PRO_SEQ_GENERATOR")
	private int id;
	
	@Column(nullable=false, length=50)
	private String name;
	
	@Column(nullable=false, length=50)
	private String maker;
	
	@Column(nullable=false, length=20)
	private String category;
	
	@Column(nullable=true, length=10)
	private int price;
	
	@Column(nullable=true, length=10)
	private int dcprice;
	
	@Column(nullable=true, length=20)
	private String storage;
	
	@Column(nullable=true, length=50)
	private String color;
	
	@Lob
	private String content;
	
	private String imgName;
	
	private String imgOriName;
	
	private String imgUrl;
	
}
