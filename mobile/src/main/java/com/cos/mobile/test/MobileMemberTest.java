package com.cos.mobile.test;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name="test")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class MobileMemberTest {

	@Id
	private int id;
	
	@Column
	private String username;
	
	@Column
	private String password;
	
}
