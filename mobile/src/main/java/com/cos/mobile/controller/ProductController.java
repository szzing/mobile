package com.cos.mobile.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductController {
	@GetMapping("/admin/product")
	public String productList() {
		return "product/product";
	}
	@GetMapping("/admin/regiProduct")
	public String registProduct() {
		return "product/regiProduct";
	}
	
}
