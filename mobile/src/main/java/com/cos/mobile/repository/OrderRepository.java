package com.cos.mobile.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;


import com.cos.mobile.model.Order;

public interface OrderRepository extends JpaRepository<Order, Integer>{
	Page<Order> findByUser_Id(@Param(value = "userid")int userid, Pageable pageable);
	
	Order findById(String id);
}
