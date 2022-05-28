package com.cos.mobile.controller.api;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.cos.mobile.config.auth.PrincipalDetail;
import com.cos.mobile.dto.CartItemDto;
import com.cos.mobile.dto.ResponseDto;
import com.cos.mobile.service.CartService;

@RestController
public class CartApiContoller {
	@Autowired
	private CartService cartService;
	
	@PostMapping("/api/cart")
	public ResponseDto<Integer> saveCart(@RequestBody CartItemDto cartitemDto, 
			@AuthenticationPrincipal PrincipalDetail principal) throws IllegalStateException, IOException{
		System.out.println("API productid:" + cartitemDto.getProductid());
		cartService.save(cartitemDto, principal.getUser());
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@DeleteMapping("/api/cart/{cartitemId}")
	public ResponseDto<Integer> cartDelete(@PathVariable int cartitemId){
		cartService.cartDelete(cartitemId);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
}
