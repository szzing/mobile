package com.cos.mobile.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.cos.mobile.model.TelecomFee;

public interface TelecomFeeRepository extends JpaRepository<TelecomFee, Integer>{
	TelecomFee findByid(int id);
	
	@Query(value="select*from Telecomfee p where p.telid :telid and p.productid :productid", nativeQuery=true)
	List<TelecomFee> findByTelidAndProductid(int telid, int productid);
}
