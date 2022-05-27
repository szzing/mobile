package com.cos.mobile.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.mobile.dto.CartItemDto;
import com.cos.mobile.model.CartItem;
import com.cos.mobile.model.Product;
import com.cos.mobile.model.TelecomFee;
import com.cos.mobile.model.Users;
import com.cos.mobile.repository.CartRepository;
import com.cos.mobile.repository.ProductRepository;
import com.cos.mobile.repository.TelecomFeeRepository;
import com.cos.mobile.repository.UserRepository;


@Service
public class CartService {
	@Autowired
	CartRepository cartRepository;
	
	@Autowired
	ProductRepository proRepository;
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	TelecomFeeRepository telfeeRepository;
	
	@Transactional
	public void save(CartItemDto cartitemdto, Users user) throws IllegalStateException, IOException{
		
		System.out.println("Service Save getUserid : " + cartitemdto.getUserid());
		System.out.println("Service Save getproductid : " + cartitemdto.getProductid());
		Users finduser = userRepository.findById(user.getId()).orElseThrow(()->{
			return new IllegalArgumentException("장바구니 저장 실패 : 사용자 정보를 찾을 수 없습니다.");
			});
		
		System.out.println("전달된 상품id : " + cartitemdto.getProductid());
		Product product = proRepository.findById(cartitemdto.getProductid());
		
		TelecomFee telfee = telfeeRepository.findByid(cartitemdto.getTelfeeid());
		
		CartItem cartitem = CartItem.builder().user(finduser).product(product)
				.aftertel(cartitemdto.getAftertel()).beforetel(cartitemdto.getBeforetel())
				.color(cartitemdto.getColor()).storage(cartitemdto.getStorage())
				.telfee(telfee)
				.dc_option(cartitemdto.getDc_option())
				.dcchoice(cartitemdto.getDcchoice())
				.period(cartitemdto.getPeriod())
				.build();
		cartRepository.save(cartitem);
		}
	
	@Transactional(readOnly=true)
	public Page<CartItem> toCart(Pageable pageable, Users user){
		System.out.println("CartService.toCart.user.getId() : " + user.getId());
		Page<CartItem> items = cartRepository.findByUser_Id(user.getId(), pageable);
		System.out.println("Page<CartItem> items(findById) :" + items);
		return items;
	}

}
