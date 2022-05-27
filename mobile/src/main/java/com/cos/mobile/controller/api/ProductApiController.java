package com.cos.mobile.controller.api;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.cos.mobile.dto.ResponseDto;
import com.cos.mobile.dto.TelecomFeeDto;

import com.cos.mobile.model.Telecom;
import com.cos.mobile.service.ProductService;

@RestController
public class ProductApiController {
	@Autowired
	ProductService productService;
	
	@PostMapping("/api/admintel")
	public ResponseDto<Integer> telsave(@RequestBody Telecom tel) throws IllegalStateException, IOException{
		productService.telsave(tel);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@DeleteMapping("/api/telecom/{telId}")
	public ResponseDto<Integer> telDelete(@PathVariable int telId){
		productService.telDelete(telId);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@DeleteMapping("/api/telecomfee/{feeId}")
	public ResponseDto<Integer> feeDelete(@PathVariable int feeId){
		productService.feeDelete(feeId);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@DeleteMapping("/api/prodelete/{productId}")
	public ResponseDto<Integer> proDelete(@PathVariable int productId){
		productService.proDelete(productId);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@PostMapping("/api/fee")
	public ResponseDto<Integer> feesave(@RequestBody TelecomFeeDto telfeeDto) throws IllegalStateException, IOException{
		productService.feesave(telfeeDto);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}

}
