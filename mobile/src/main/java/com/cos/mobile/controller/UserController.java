package com.cos.mobile.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.mobile.model.Users;
import com.cos.mobile.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
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
	
	@PostMapping("/auth/idcheck")
	@ResponseBody
	public int idCheck(@RequestParam("userid") String userid) {
		int cnt = 0;
		System.out.println("전달받은 id:"+userid);
		Users originUser = userService.findUserid(userid);
		if(originUser.getUserid()==null) {
			System.out.println("cnt : "+ cnt);
			// 기존 가입자 0명으로 없으면 중복아이디가 아니라 사용가능함
			return cnt;
		}else {
			cnt = 1;
			System.out.println("cnt : "+cnt);
			return cnt;
		}
	}
}
