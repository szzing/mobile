package com.cos.mobile.model;

import javax.persistence.Column;
import javax.persistence.Entity;
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

@Table(name="telecomFee")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@SequenceGenerator(
		name ="FEE_SEQ_GENERATOR"
		, sequenceName="FEE_SEQ"
		,initialValue=100
		, allocationSize=1
		)
public class TelecomFee {
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="FEE_SEQ_GENERATOR")
	private int id;
	
	@ManyToOne
	@JoinColumn(name="telid")
	private Telecom telecom;	// 통신사id로 join
	
	@ManyToOne
	@JoinColumn(name="productid")
	private Product product;	// 상품id로 join
	
	@Column(nullable=true, length=10)
	private Integer contractDc;	// 선택약정할인(원)
	
	@Column(nullable=true, length=10)
	private Integer officialDc;	// 공시지원할인(원)
	
	@Column(nullable=false, length=50)
	private String feeName;		// 요금제명
	
	@Column(nullable=false, length=10)
	private int fee;	// 요금제(원)
}
