package com.cos.mobile.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.mobile.model.TelecomFee;

public interface TelecomFeeRepository extends JpaRepository<TelecomFee, Integer>{
	TelecomFee findByid(int id);
}
