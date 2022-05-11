package com.cos.mobile.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.mobile.model.Product;

public interface ProductRepository extends JpaRepository<Product, Integer>{

}
