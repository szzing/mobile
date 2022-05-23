package com.cos.mobile.controller.api;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.cos.mobile.config.auth.PrincipalDetail;
import com.cos.mobile.dto.ReplySaveRequestDto;
import com.cos.mobile.dto.ResponseDto;
import com.cos.mobile.model.Boards;
import com.cos.mobile.model.QnaBoard;
// import com.cos.mobile.model.Users;
import com.cos.mobile.service.BoardService;

@RestController
public class BoardApiController {
	@Autowired
	private BoardService boardService;
	
	@PostMapping("/api/adminboard")
	public ResponseDto<Integer> save(@RequestBody Boards board, @AuthenticationPrincipal PrincipalDetail principal) throws IllegalStateException, IOException{
		boardService.adminwrite(board, principal.getUser());
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@PostMapping("/api/qnaboard")
	public ResponseDto<Integer> qnaSave(@RequestBody QnaBoard qnaboard, @AuthenticationPrincipal PrincipalDetail principal)
			throws IllegalStateException, IOException{
		// 문의 게시판 회원 글쓰기
		boardService.qnawrite(qnaboard, principal.getUser());
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@PostMapping("/api/qna")
	public ResponseDto<Integer> qnaSave2(@RequestBody QnaBoard qnaboard)
			throws IllegalStateException, IOException{
		// 문의 게시판 비회원 글쓰기
		boardService.qnawrite2(qnaboard);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@DeleteMapping("/api/board/{id}")
	public ResponseDto<Integer> delete(@PathVariable int id){
		boardService.deleteBoard(id);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@DeleteMapping("/api/qnaboard/{id}")
	public ResponseDto<Integer> qnaDelete(@PathVariable int id){
		boardService.deleteQna(id);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@PutMapping("/api/board/{id}")
	public ResponseDto<Integer> update(@PathVariable int id, @RequestBody Boards board) throws IllegalStateException, IOException{
		boardService.update(id, board);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@PutMapping("/api/qna/{id}")
	public ResponseDto<Integer> qnaUpdate(@PathVariable int id, @RequestBody QnaBoard qna)
			throws IllegalStateException, IOException{
		boardService.qnaUpdate(id, qna);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@PostMapping("/api/qna/{qnaboardId}/reply")
	public ResponseDto<Integer> replySave(@RequestBody ReplySaveRequestDto replySaveRequestDto){
		boardService.replySave(replySaveRequestDto);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@DeleteMapping("/api/qna/{qnaboardId}/reply/{replyId}")
	public ResponseDto<Integer> replyDelete(@PathVariable int replyId){
		boardService.deleteReply(replyId);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}

	
	@PostMapping("/api/qnapass")
	public Map<String, Integer> qnaCheck(@RequestBody QnaBoard qnaboard){
		Map<String, Integer> map = new HashMap<String, Integer>();
		QnaBoard qna = boardService.qnaPassCheck(qnaboard);
		if(qna == null) {
			map.put("check", 0);
		}else {
			map.put("check", 1);
		}
		return map;
	}
}
