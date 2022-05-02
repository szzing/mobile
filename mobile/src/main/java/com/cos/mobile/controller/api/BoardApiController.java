package com.cos.mobile.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.cos.mobile.dto.ResponseDto;
import com.cos.mobile.model.Boards;
// import com.cos.mobile.model.Users;
import com.cos.mobile.service.BoardService;

@RestController
public class BoardApiController {
	@Autowired
	private BoardService boardService;
	
	// 관리자 구분 위해 시큐리티 로그인 이후 인증 유저 추가예정
	@PostMapping("/api/adminboard")
	public ResponseDto<Integer> save(@RequestBody Boards board/*, @AuthenticationPrincipal PrincipalDetail principal*/){
		boardService.adminwrite(board);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
}
