package com.cos.mobile.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name="telecom")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@SequenceGenerator(
		name ="TEL_SEQ_GENERATOR"
		, sequenceName="TEL_SEQ"
		,initialValue=1
		, allocationSize=1
		)
public class Telecom {
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="TEL_SEQ_GENERATOR")
	private int id;
	
	@Column(nullable=false, length=50)
	private String name;
}
