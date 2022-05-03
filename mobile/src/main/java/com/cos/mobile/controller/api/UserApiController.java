package com.cos.mobile.controller.api;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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
	private UserService userService;
	
	@PostMapping("/api/user")
	public ResponseDto<Integer> save(@RequestBody Users user){
		userService.join(user);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@PostMapping("/api/admin")
	public ResponseDto<Integer> adminSave(@RequestBody Users user){
		userService.adminJoin(user);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@PostMapping("/api/user/login")
	public ResponseDto<Integer> login(@RequestBody Users user, HttpSession session){
		Users principal = userService.login(user);
		if(principal != null) {
			session.setAttribute("principal", principal);
		}
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@PutMapping("/user")
	public ResponseDto<Integer> update(@RequestBody Users user){
		userService.update(user);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
}
