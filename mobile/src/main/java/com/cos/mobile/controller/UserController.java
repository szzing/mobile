package com.cos.mobile.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	@GetMapping("/user/loginForm")
	public String loginForm() {
		return "user/loginForm";
	}
	
	@GetMapping("/user/joinForm")
	public String joinForm() {
		return "user/joinForm";
	}
	
	@GetMapping("/admin/joinForm")
	public String adminjoinForm() {
		return "admin/joinForm";
	}
	
	@GetMapping("/admin/adminPage")
	public String adminPage() {
		return "admin/adminPage";
	}
	
	@GetMapping("/user/myPage")
	public String myPage() {
		return "user/myPage";
	}
	
	@GetMapping("/user/updateForm")
	public String userUpdate() {
		return "user/updateForm";
	}
}
