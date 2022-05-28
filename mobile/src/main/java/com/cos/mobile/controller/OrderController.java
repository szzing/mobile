package com.cos.mobile.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.cos.mobile.config.auth.PrincipalDetail;
import com.cos.mobile.service.CartService;

@Controller
public class OrderController {
	@Autowired
	private CartService cartService;
	
	@GetMapping("/cart")
	public String toCart(Model model, 
			@PageableDefault(size=5, sort="id", direction= Sort.Direction.DESC) Pageable pageable, 
			@AuthenticationPrincipal PrincipalDetail principal) {
		model.addAttribute("principal", principal);
		model.addAttribute("cartitems", cartService.toCart(pageable, principal.getUser()));
		return "order/Cart";
	}
	
	@GetMapping("/cart/order/{cartitemId}")
	public String cartItemOrder(@PathVariable int cartitemId, Model model, @AuthenticationPrincipal PrincipalDetail principal) {
		model.addAttribute("principal", principal);
		model.addAttribute("cart", cartService.cartOrder(cartitemId));
		return "order/orderForm";
	}
}
