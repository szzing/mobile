package com.cos.mobile.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.cos.mobile.model.QnaBoard;


public interface QnaRepository extends JpaRepository<QnaBoard, Integer> {
	@Modifying
    @Query(value="update Qnaboard p set p.count = p.count + 1 where p.id = :id", nativeQuery=true)
    int updateCount(int id);
	
	QnaBoard findByIdAndPass(int id, String pass);
}
