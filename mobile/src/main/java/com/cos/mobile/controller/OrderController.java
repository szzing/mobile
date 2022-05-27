package com.cos.mobile.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cos.mobile.config.auth.PrincipalDetail;
import com.cos.mobile.model.OrderItem;

@Controller
public class OrderController {
	
	@RequestMapping(value = "/order")
	public String order(Model model, @ModelAttribute OrderItem orderitem, @AuthenticationPrincipal PrincipalDetail principal) {
		System.out.println(principal.getUsername());
		System.out.println(orderitem);
		model.addAttribute("principal", principal);
		model.addAttribute("order", orderitem);
		return "order/orderCheck";
	}
}
