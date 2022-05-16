package com.cos.mobile.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.cos.mobile.model.Boards;

public interface BoardRepository extends JpaRepository<Boards, Integer>{
	Page<Boards> findByCategory(String category, Pageable pageable);
	
	@Modifying
    @Query("update Boards p set p.count = p.count + 1 where p.id = :id")
    int updateCount(int id);
}
