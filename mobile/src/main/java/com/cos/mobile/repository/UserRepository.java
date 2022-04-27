package com.cos.mobile.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.mobile.model.Users;

public interface UserRepository extends JpaRepository<Users, Integer>{
	// SELECT*FROM USERS WHERE USERID=?;
		Optional<Users> findByUserid(String userid);
}
