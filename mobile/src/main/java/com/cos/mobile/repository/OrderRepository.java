package com.cos.mobile.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.mobile.model.Order;

public interface OrderRepository extends JpaRepository<Order, Integer>{

}
