package com.cos.mobile.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name="boards")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@SequenceGenerator(
		name ="BOARD_SEQ_GENERATOR1"
		, sequenceName="BOARD_SEQ1"
		,initialValue=1
		, allocationSize=1
		)
public class Boards {
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="BOARD_SEQ_GENERATOR1")
	private int id;
	
	@Column(nullable=false, length=50)
	private String category;
	
	@Column(nullable=false, length=100)
	private String title;
	
	private int count;
	
	@Lob
	private String content;
	
//	@ManyToOne(fetch = FetchType.EAGER, optional = true)
//	@JoinColumn(name="userid", foreignKey = @ForeignKey(foreignKeyDefinition = "FOREIGN KEY (userid) references users (id) ON DELETE SET NULL"))
//	private Users users;
	
	@CreationTimestamp
	private Timestamp createDate;
}
