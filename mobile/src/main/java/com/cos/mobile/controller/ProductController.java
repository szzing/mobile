package com.cos.mobile.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.cos.mobile.model.Product;
import com.cos.mobile.repository.ProductRepository;
import com.cos.mobile.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	ProductService productService;
	
	@Autowired
	ProductRepository proRepository;
	
	@GetMapping("/admin/telecom")
	public String telecom(Model model) {
		model.addAttribute("product",productService.selectProAll());
		model.addAttribute("telecom",productService.selectTelAll());
		model.addAttribute("telecomfee",productService.selectFeeAll());
		return "product/telecomFee";
	}
	
	@GetMapping("/product")
	public String productList(Model model) {
		model.addAttribute("product",productService.selectProAll());
		return "product/product";
	}
	
	@GetMapping("/admin/product")
	public String adminProduct(Model model) {
		model.addAttribute("product",productService.selectProAll());
		return "product/adminProduct";
	}
	
	@GetMapping("/admin/regiProduct")
	public String registProduct() {
		return "product/regiProduct";
	}
	
	@RequestMapping("/admin/saveproduct")
	public String saveProduct(Product product, MultipartFile imgproduct) throws Exception{
		String sourceFileName = imgproduct.getOriginalFilename(); 
		String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase(); 
		File destinationFile; 
		String destinationFileName;
		String fileUrl = "C:\\workspace\\images\\";	//외부경로

		do { 
			destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + sourceFileNameExtension; 
			destinationFile = new File(fileUrl + destinationFileName); 
		} while (destinationFile.exists()); 
		
		destinationFile.getParentFile().mkdirs();
		
		imgproduct.transferTo(destinationFile);
		
		product.setImgName(destinationFileName);
		product.setImgOriName(sourceFileName);
		product.setImgUrl(fileUrl);
		proRepository.save(product);
		
		return "redirect:/admin/product";
	}
	
	@GetMapping("/product/{id}")
	public String productfindbyId(@PathVariable int id, Model model) {
		// 상품상세보기
		model.addAttribute("product", productService.proDetail(id));
		model.addAttribute("telecomfee",productService.selectFeeAll());
		return "product/proDetail";
	}
	
	@GetMapping("/product/{id}/proUpdate")
	public String proUpdate(@PathVariable int id, Model model) {
		model.addAttribute("product", productService.proDetail(id));
		return "product/proUpdate";
	}
	
	
	@RequestMapping("/admin/proUpdate")
	public String updateProduct(Product product, MultipartFile imgproduct, HttpServletRequest req) throws Exception{
		String fileUrl = "C:\\workspace\\images\\";	//외부경로

		// 새로운 파일이 등록되었는지 확인
		 if(imgproduct.getOriginalFilename() != null && imgproduct.getOriginalFilename() != "") {
		  // 기존 파일을 삭제
			 new File(fileUrl + req.getParameter("imgName")).delete();
		  
		  
		  // 새로 첨부한 파일을 등록
		  String sourceFileName = imgproduct.getOriginalFilename(); 
			String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase(); 
			File destinationFile; 
			String destinationFileName;

			do { 
				destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + sourceFileNameExtension; 
				destinationFile = new File(fileUrl + destinationFileName); 
			} while (destinationFile.exists()); 
			
			destinationFile.getParentFile().mkdirs();
			
			imgproduct.transferTo(destinationFile);
			
			product.setImgName(destinationFileName);
			product.setImgOriName(sourceFileName);
			product.setImgUrl(fileUrl);
		  
		 } else {  // 새로운 파일이 등록되지 않았다면
		  // 기존 이미지를 그대로 사용
			 product.setImgName(req.getParameter("imgName"));
			 product.setImgOriName(req.getParameter("imgOriName"));
			 product.setImgUrl(req.getParameter("imgUrl"));
		 }
		 proRepository.save(product);
		return "redirect:/admin/product";
	}
	
}
