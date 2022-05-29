package com.cos.mobile.service;

import java.io.IOException;
import java.sql.Date;
import java.text.DecimalFormat;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.mobile.dto.CartItemDto;
import com.cos.mobile.dto.OrderDto;
import com.cos.mobile.model.CartItem;
import com.cos.mobile.model.Order;
import com.cos.mobile.model.Product;
import com.cos.mobile.model.TelecomFee;
import com.cos.mobile.model.Users;
import com.cos.mobile.repository.CartRepository;
import com.cos.mobile.repository.OrderRepository;
import com.cos.mobile.repository.ProductRepository;
import com.cos.mobile.repository.TelecomFeeRepository;
import com.cos.mobile.repository.UserRepository;
import com.fasterxml.jackson.annotation.JsonFormat;


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
	
	@Autowired
	OrderRepository orderRepository;
	
	@Transactional
	public void save(CartItemDto cartitemdto, Users user) throws IllegalStateException, IOException{
		Users finduser = userRepository.findById(user.getId()).orElseThrow(()->{
			return new IllegalArgumentException("장바구니 저장 실패 : 사용자 정보를 찾을 수 없습니다.");
			});
		
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
	
	@Transactional
	public void orderSave(OrderDto orderDto, Users user) throws IllegalStateException, IOException{
		Users finduser = userRepository.findById(user.getId()).orElseThrow(()->{
			return new IllegalArgumentException("주문 실패 : 사용자 정보를 찾을 수 없습니다.");
			});
		Product product = proRepository.findById(orderDto.getProductid());
		
		TelecomFee telfee = telfeeRepository.findByid(orderDto.getTelfeeid());
		
		Calendar cal = Calendar.getInstance();
		 int year = cal.get(Calendar.YEAR);
		 String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		 String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
		 String subNum = "";
		 
		 for(int i = 1; i <= 6; i ++) {
		  subNum += (int)(Math.random() * 10);
		 }
		 
		 String orderId = ymd + "_" + subNum;
		
		Order order = Order.builder().user(finduser).product(product).id(orderId)
				.telfee(telfee).color(orderDto.getColor()).storage(orderDto.getStorage())
				.beforetel(orderDto.getBeforetel()).aftertel(orderDto.getAftertel())
				.newphone(orderDto.getNewphone())
				.postname(orderDto.getNewphone()).email(orderDto.getEmail())
				.dcchoice(orderDto.getDcchoice()).dc_option(orderDto.getDc_option())
				.status("신청완료").requestmsg(orderDto.getRequestmsg())
				.address(orderDto.getAddress()).addrdetail(orderDto.getAddrdetail())
				.zipcode(orderDto.getZipcode())
				.build();
		orderRepository.save(order);
	}
	
	@Transactional(readOnly=true)
	public Page<CartItem> toCart(Pageable pageable, Users user){
		Page<CartItem> items = cartRepository.findByUser_Id(user.getId(), pageable);
		return items;
	}
	
	@Transactional(readOnly=true)
	public CartItem cartOrder(int cartitemId){
		return cartRepository.findById(cartitemId).orElseThrow(()->{
			return new IllegalArgumentException("장바구니 아이디를 찾을 수 없습니다.");
		});
	}
	
	@Transactional
	public void cartDelete(int cartitemId) {
		cartRepository.deleteById(cartitemId);
	}

}
