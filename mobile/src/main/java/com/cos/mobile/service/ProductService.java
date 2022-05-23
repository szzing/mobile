package com.cos.mobile.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.mobile.dto.TelecomFeeDto;
import com.cos.mobile.model.Product;
import com.cos.mobile.model.Telecom;
import com.cos.mobile.model.TelecomFee;
import com.cos.mobile.repository.ProductRepository;
import com.cos.mobile.repository.TelecomFeeRepository;
import com.cos.mobile.repository.TelecomRepository;

@Service
public class ProductService {
	@Autowired
	TelecomRepository telRepository;
	
	@Autowired
	TelecomFeeRepository telfeeRepository;
	
	@Autowired
	ProductRepository proRepository;
	
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
	
	@Transactional(readOnly=true)
	public List<Product> selectProAll(){
		return proRepository.findAll();
	}
	
	@Transactional(readOnly=true)
	public List<TelecomFee> feeTelidAndProId(int telid, int productid){
		return telfeeRepository.findByTelidAndProductid(telid, productid);
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
	public void proDelete(int id) {
		proRepository.deleteById(id);
	}

	
	@Transactional
	public void feesave(TelecomFeeDto telfeeDto) {
		Product product = proRepository.findById(telfeeDto.getProductid());
		Telecom tel = telRepository.findById(telfeeDto.getTelid());
		TelecomFee telfee = TelecomFee.builder()
				.product(product)
				.telecom(tel)
				.feeName(telfeeDto.getFeename())
				.fee(telfeeDto.getFee())
				.contractDc(telfeeDto.getContractDc())
				.officialDc(telfeeDto.getOfficialDc())
				.build();
		telfeeRepository.save(telfee);
	}
	
	@Transactional(readOnly=true)
	public Product proDetail(int id) {
		return proRepository.findById(id);
	}
}
