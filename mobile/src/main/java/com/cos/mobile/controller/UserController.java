package com.cos.mobile.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.mobile.config.auth.PrincipalDetail;
import com.cos.mobile.model.Users;
import com.cos.mobile.service.BoardService;
import com.cos.mobile.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/auth/loginForm")
	public String loginForm(@RequestParam(value = "error", required = false)String error, 
			@RequestParam(value = "exception", required = false)String exception, Model model) {
		model.addAttribute("error", error);
		model.addAttribute("exception", exception); 
		return "user/loginForm";
	}
	
	@GetMapping("/auth/joinForm")
	public String joinForm() {
		return "user/joinForm";
	}
	
	@GetMapping("/auth/admin/joinForm")
	public String adminjoinForm() {
		// 관리자 계정생성 페이지 임시 접근가능
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
	
	@GetMapping({"/user/myqna"})
	public String faqBoard(Model model, 
			@PageableDefault(size=5, sort="id", direction= Sort.Direction.DESC) Pageable pageable,
			@AuthenticationPrincipal PrincipalDetail principal) {
		// FAQ 게시판 목록 출력
		model.addAttribute("boards", boardService.toMyQna(pageable, principal.getUser()));
		return "user/myQna";
	}
	
	@RequestMapping(value = "/auth/findmissingid" , method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> findUseridMissing(@ModelAttribute Users user) {
		Map<String, String> map = new HashMap<String, String>();
		String userid="";
		String username = user.getUsername();
		String phone = user.getPhone();
		
		if(userService.findUseridByNameAndPhone(username, phone)==null) {
			map.put("userid", "noid");
		}else {
			Users finduser = userService.findUseridByNameAndPhone(username, phone);
			userid = finduser.getUserid();
			map.put("userid", userid);
		}
		return map;
	}
	
	@GetMapping("/auth/finduserid")
	public String findUserid() {
		return "user/findUserid";
	}
}
