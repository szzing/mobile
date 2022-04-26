package com.cos.mobile.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MobileControllerTest {
	
	@GetMapping("/testpage")
	public String test() {
		return "test";
	}
	
	@GetMapping("/joinform")
	public String joinform() {
		return "user/joinForm";
	}
}
