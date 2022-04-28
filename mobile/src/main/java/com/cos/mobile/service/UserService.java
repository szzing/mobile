package com.cos.mobile.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.mobile.model.RoleType;
import com.cos.mobile.model.Users;
import com.cos.mobile.repository.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;
	
	@Transactional
	public void join(Users user) {
		String encPassword = user.getPassword();
		user.setPassword(encPassword);
		user.setRoles(RoleType.USER);
		userRepository.save(user);
	}
	
// 시큐리티 사용시
//	@Transactional
//	public void join(Users user) {
//		String rawPassword = user.getPassword();
//		String encPassword = encodeer.encode(rawPassword);
//		user.setPassword(encPassword);
//		user.setRoles(RoleType.USER);
//		userRepository.save(user);
//	}
	
	@Transactional
	public void adminJoin(Users user) {
		String encPassword = user.getPassword();
		user.setPassword(encPassword);
		user.setRoles(RoleType.ADMIN);
		userRepository.save(user);
	}
}
