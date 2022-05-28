package com.cos.mobile.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.cos.mobile.model.QnaBoard;


public interface QnaRepository extends JpaRepository<QnaBoard, Integer> {
	@Modifying
    @Query(value="update Qnaboard p set p.count = p.count + 1 where p.id = :id", nativeQuery=true)
    int updateCount(int id);
	
	QnaBoard findByIdAndPass(int id, String pass);
	
	Page<QnaBoard> findByUser_Id(@Param(value = "userid")int userid, Pageable pageable);
}
