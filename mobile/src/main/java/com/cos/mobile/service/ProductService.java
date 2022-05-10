package com.cos.mobile.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.mobile.dto.TelecomFeeDto;
import com.cos.mobile.model.Telecom;
import com.cos.mobile.model.TelecomFee;
import com.cos.mobile.repository.TelecomFeeRepository;
import com.cos.mobile.repository.TelecomRepository;

@Service
public class ProductService {
	@Autowired
	TelecomRepository telRepository;
	
	@Autowired
	TelecomFeeRepository telfeeRepository;
	
	@Transactional
	public void telsave(Telecom tel) {
		tel.setName(tel.getName());
		telRepository.save(tel);
	}
	
	@Transactional(readOnly=true)
	public List<Telecom> selectTelAll(){
		return telRepository.findAll();
	}
	
	@Transactional(readOnly=true)
	public List<TelecomFee> selectFeeAll(){
		return telfeeRepository.findAll();
	}
	
	@Transactional
	public void telDelete(int id) {
		telRepository.deleteById(id);
	}
	
	@Transactional
	public void feeDelete(int id) {
		telfeeRepository.deleteById(id);
	}
	
	@Transactional
	public void feesave(TelecomFeeDto telfeeDto) {
		Telecom tel = telRepository.findById(telfeeDto.getTelid());
		TelecomFee telfee = TelecomFee.builder().telecom(tel)
				.feeName(telfeeDto.getFeename())
				.fee(telfeeDto.getFee()).build();
		telfeeRepository.save(telfee);
	}
}
