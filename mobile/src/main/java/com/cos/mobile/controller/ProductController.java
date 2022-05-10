package com.cos.mobile.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.cos.mobile.model.Telecom;
import com.cos.mobile.model.TelecomFee;
import com.cos.mobile.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	ProductService productService;
	
	@GetMapping("/admin/telecom")
	public String telecom(Model model) {
		List<Telecom> telecom = productService.selectTelAll();
		List<TelecomFee> telecomfee = productService.selectFeeAll();
		model.addAttribute("telecom",telecom);
		model.addAttribute("telecomfee",telecomfee);
		return "product/telecomFee";
	}
	
	@GetMapping("/admin/product")
	public String productList() {
		return "product/product";
	}
	
	@GetMapping("/admin/regiProduct")
	public String registProduct() {
		return "product/regiProduct";
	}
	
}
