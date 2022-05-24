package com.cos.mobile.controller.api;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.cos.mobile.dto.ResponseDto;
import com.cos.mobile.model.Users;
import com.cos.mobile.service.UserService;

@RestController
public class UserApiController {
	
	@Autowired
	private AuthenticationManager authenticationManager;
	
	@Autowired
	private UserService userService;
	
	@PostMapping("/auth/joinProc")
	public ResponseDto<Integer> save(@RequestBody Users user){
		userService.join(user);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@PostMapping("/auth/adminjoin")
	public ResponseDto<Integer> adminSave(@RequestBody Users user){
		userService.adminJoin(user);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
//	@PostMapping("/api/user/login")
//	public ResponseDto<Integer> login(@RequestBody Users user, HttpSession session){
//		Users principal = userService.login(user);
//		if(principal != null) {
//			session.setAttribute("principal", principal);
//		}
//		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
//	}
	
	@PutMapping("/user")
	public ResponseDto<Integer> update(@RequestBody Users user){
		userService.update(user);
		Authentication autentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(user.getUserid(), user.getPassword()));
		SecurityContextHolder.getContext().setAuthentication(autentication);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@GetMapping("/api/idcheck/{userid}")
	public Map<String, Integer> idcheck(@PathVariable String userid) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		boolean existId = userService.idcheck(userid);
		if(existId) {
			map.put("existId", 1);
		} else {
			map.put("existId", 0);
		}
		return map;
	}
	
	@DeleteMapping("/api/user/{id}")
	public ResponseDto<Integer> delete(@PathVariable int id, HttpSession session){
		userService.deleteUser(id);
		session.invalidate(); // 회원데이터 삭제 후 로그아웃
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
}