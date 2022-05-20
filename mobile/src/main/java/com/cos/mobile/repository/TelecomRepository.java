package com.cos.mobile.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.mobile.model.Telecom;

public interface TelecomRepository extends JpaRepository<Telecom, Integer>{
	Telecom findById(int id);
}
