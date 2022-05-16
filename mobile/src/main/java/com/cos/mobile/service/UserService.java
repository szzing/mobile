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
		user.setEmail("admin");
		user.setPhone("admin");
		user.setRoles(RoleType.ADMIN);
		userRepository.save(user);
	}
	
	@Transactional(readOnly=true)
	public Users login(Users user) {
		return userRepository.findByUseridAndPassword(user.getUserid(), user.getPassword());
	}
	
	@Transactional
	public void update(Users user) {
		Users persistence = userRepository.findById(user.getId()).orElseThrow(()->{
			return new IllegalArgumentException("회원 찾기 실패" + user.getId());
		});
		persistence.setPassword(user.getPassword());
		persistence.setEmail(user.getEmail());
		persistence.setUsername(user.getUsername());
		persistence.setPhone(user.getPhone());
		persistence.setZipcode(user.getZipcode());
		persistence.setAddress1(user.getAddress1());
		persistence.setAddress2(user.getAddress2());
	}
	
	@Transactional(readOnly=true)
	public Users findUserid(String userid) {
		Users user = userRepository.findByUserid(userid).orElseGet(()->{
			return new Users();
		});
		return user;
	}
	
}
