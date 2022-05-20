package com.cos.mobile.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@SequenceGenerator(
		name="USER_SEQ_GENERATOR"
		, sequenceName = "USER_SEQ"
		, initialValue = 200
		, allocationSize = 1
		)

@Table(name="users")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Users {
	@Id // PRIMARY KEY
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="USER_SEQ_GENERATOR")
	private int id;
	
	@Column(nullable=false, length=100,unique=true)
	private String userid;
	
	@Column(nullable=false, length=100)
	private String username;
	
	@Column(nullable=false, length=100)
	private String password;
	
	@Column(nullable=false, length=30)
	private String phone;
	
	@Column(nullable=false, length=50)
	private String email;
	
	@Column(nullable=true, length=20)
	private String zipcode;
	
	@Column(nullable=true, length=50)
	private String address;
	
	@Column(nullable=true, length=50)
	private String addrdetail;
	
	@Enumerated(EnumType.STRING)
	private RoleType roles;
	
	// 소셜계정 사용자 표시
	private String oauth;
	
	@CreationTimestamp
	private Timestamp createDate;
}
