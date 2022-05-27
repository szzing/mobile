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

@Table(name="files")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@SequenceGenerator(
		name ="FILE_SEQ_GENERATOR"
		, sequenceName="FILE_SEQ"
		,initialValue=100
		, allocationSize=1
		)
public class Files {
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="FILE_SEQ_GENERATOR")
	private int id;
	
	@Column(nullable=false, length=200)
	private String filename;
	
	@Column(nullable=false, length=100)
	private String fileOriName;
	
	@Column(nullable=false, length=200)
	private String fileurl;
	
	@ManyToOne(optional = true)
	@JoinColumn(name="boardId")
	private Boards board;
}
