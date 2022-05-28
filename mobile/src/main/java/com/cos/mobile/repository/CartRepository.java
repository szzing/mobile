package com.cos.mobile.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

import com.cos.mobile.model.CartItem;

public interface CartRepository extends JpaRepository<CartItem, Integer>{

	Page<CartItem> findByUser_Id(@Param(value = "userid")int userid, Pageable pageable);
}
