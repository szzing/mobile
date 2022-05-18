package com.cos.mobile.model;

import java.sql.Timestamp;
import org.hibernate.annotations.CreationTimestamp;

import lombok.*;
import javax.persistence.*;

@Data	// getter, setter
@NoArgsConstructor // 빈 생성자
@AllArgsConstructor	// 전체 생성자
@Builder	// 빌더 패턴
@Entity
@SequenceGenerator(
		name = "REPLY_SEQ_GENERATOR"
		, sequenceName="REPLY_SEQ"
		, initialValue=1
		, allocationSize=1)
public class Reply {
	@Id // 기본키
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="REPLY_SEQ_GENERATOR")
	private int id;
	
	@Column(nullable=false, length=200)
	private String content;
	
	@ManyToOne	// 여러개 답변은 하나의 게시글에 존재
	@JoinColumn(name="qnaboardId")
	private QnaBoard qnaboard;
	
	@ManyToOne
	@JoinColumn(name="userid")
	private Users users;
	
	private String writer;
	
	@CreationTimestamp
	private Timestamp createDate;
}
