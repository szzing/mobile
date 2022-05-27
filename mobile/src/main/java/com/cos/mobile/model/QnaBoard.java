package com.cos.mobile.model;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
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
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.Formula;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name="Qnaboard")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@SequenceGenerator(
		name ="QNA_SEQ_GENERATOR"
		, sequenceName="QNA_SEQ"
		,initialValue=1
		, allocationSize=1
		)
public class QnaBoard {
	
	@Id // 기본키
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="QNA_SEQ_GENERATOR")
	private int id;
	
	@Column(nullable=false, length=100)
	private String title;
	
	private int count; // 조회수
	
	@Column(nullable=true, length=100)
	private String pass;
	
	@Lob
	private String content;
	
	private String writer;
	
	@ManyToOne(fetch = FetchType.EAGER, optional = true)
	@JoinColumn(name="userid", foreignKey = @ForeignKey(foreignKeyDefinition = "FOREIGN KEY (userid) references users (id) ON DELETE SET NULL"))
	private Users users;

	@OneToMany (mappedBy="qnaboard", fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)	// qnaboard 삭제 시 댓글도 삭제함
	@JsonIgnoreProperties({"qnaboard"})
	@OrderBy("id desc")
	private List<Reply> reply;
	
	@Formula("(SELECT count(1) FROM reply r WHERE r.qnaboardid = id)")
	private int replyCnt;
	
	@CreationTimestamp
	private Timestamp createDate;
	
	@Column(nullable=false, length=1)
	private boolean secret;

}
