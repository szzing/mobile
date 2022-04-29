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
		return "product/product";
	}
	
	@GetMapping("/test/mypage")
	public String mypage() {
		return "user/myPage";
	}
	
	@GetMapping("/test/userupdate")
	public String userupdate() {
		return "user/updateForm";
	}
	
	@GetMapping("/test/delivery")
	public String delivery() {
		return "user/delivery";
	}
	
	@GetMapping("/test/qna")
	public String qna() {
		return "board/qnaBoard";
	}
	
	@GetMapping("/test/review")
	public String review() {
		return "board/reviewBoard";
	}
	
	@GetMapping("/test/event")
	public String event() {
		return "board/event";
	}
}
