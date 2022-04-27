package com.cos.mobile.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MobileControllerTest {
	
	@GetMapping("/testpage")
	public String test() {
		return "test";
	}
	
	@GetMapping("/test/join")
	public String joinform() {
		return "user/joinForm";
	}
	
	@GetMapping("/test/login")
	public String loginform() {
		return "user/loginForm";
	}
	
	@GetMapping("/test/product")
	public String product() {
		return "user/product";
	}
}
