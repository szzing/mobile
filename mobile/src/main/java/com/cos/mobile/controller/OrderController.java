package com.cos.mobile.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.cos.mobile.config.auth.PrincipalDetail;
import com.cos.mobile.model.OrderItemList;

@Controller
public class OrderController {
	
	@GetMapping("/order")
	public String order(Model model, OrderItemList order, @AuthenticationPrincipal PrincipalDetail principal) {
		System.out.println(order.getOrders());
		System.out.println(principal.getUsername());
		
		model.addAttribute("order", order);
		model.addAttribute("principal", principal);
		
		return "order/orderCheck";
	}
}
