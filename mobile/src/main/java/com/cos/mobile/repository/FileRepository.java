package com.cos.mobile.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.mobile.model.Files;

public interface FileRepository extends JpaRepository<Files, Integer>{
	Files findById(int id);
}
