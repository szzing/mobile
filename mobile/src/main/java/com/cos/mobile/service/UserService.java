package com.cos.mobile.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.mobile.model.RoleType;
import com.cos.mobile.model.Users;
import com.cos.mobile.repository.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;
	

	@Autowired
	private BCryptPasswordEncoder encodeer;

	@Transactional(readOnly=true)
	public boolean idcheck(String userid) {
		Optional<Users> user = userRepository.findByUserid(userid);
		return user.isPresent();
	}
	
	@Transactional
	public void join(Users user) {
		String rawPassword = user.getPassword();
		String encPassword = encodeer.encode(rawPassword);
		user.setPassword(encPassword);
		user.setRoles(RoleType.USER);
		userRepository.save(user);
	}
	
	@Transactional
	public void adminJoin(Users user) {
		String rawPassword = user.getPassword();
		String encPassword = encodeer.encode(rawPassword);
		user.setPassword(encPassword);
		user.setEmail("admin");
		user.setPhone("admin");
		user.setRoles(RoleType.ADMIN);
		userRepository.save(user);
	}
	
//	@Transactional(readOnly=true)
//	public Users login(Users user) {
//		return userRepository.findByUseridAndPassword(user.getUserid(), user.getPassword());
//	}
	
	@Transactional
	public void update(Users user) {
		Users persistence = userRepository.findById(user.getId()).orElseThrow(()->{
			return new IllegalArgumentException("회원 찾기 실패" + user.getId());
		});
		System.out.println("메일 : " + user.getEmail());
		System.out.println("폰 : " + user.getPhone());
		System.out.println("우편번호 : " + user.getZipcode());
		System.out.println("주소 : " + user.getAddress());
		System.out.println("상세주소 : " + user.getAddrdetail());
		String rawPassword = user.getPassword();
		String encPassword = encodeer.encode(rawPassword);
		persistence.setPassword(encPassword);
		persistence.setEmail(user.getEmail());
		persistence.setUsername(user.getUsername());
		persistence.setPhone(user.getPhone());
		persistence.setZipcode(user.getZipcode());
		persistence.setAddress(user.getAddress());
		persistence.setAddrdetail(user.getAddrdetail());
	}
	
	@Transactional(readOnly=true)
	public Users findUserid(String userid) {
		Users user = userRepository.findByUserid(userid).orElseGet(()->{
			return new Users();
		});
		return user;
	}
	
	@Transactional
	public void deleteUser(int id) {
		userRepository.deleteById(id);
	}
	
}
