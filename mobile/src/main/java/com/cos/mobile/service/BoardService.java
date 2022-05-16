package com.cos.mobile.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.mobile.model.Boards;
import com.cos.mobile.model.QnaBoard;
import com.cos.mobile.model.Users;
import com.cos.mobile.repository.BoardRepository;
import com.cos.mobile.repository.QnaRepository;

@Service
public class BoardService {
	@Autowired
	private BoardRepository boardRepository;
	
	@Autowired
	private QnaRepository qnaRepository;
	
	@Autowired
	private BCryptPasswordEncoder encodeer;
	
	@Transactional
	public void adminwrite(Boards board, Users user) throws IllegalStateException, IOException {
		// 관리자 글 작성	
		board.setCount(0);
		board.setUsers(user);
		boardRepository.save(board);
	}
	
	@Transactional
	public void qnawrite(QnaBoard qna, Users user) throws IllegalStateException, IOException{
		qna.setCount(0);
		String rawPassword = qna.getPassword();
		String encPassword = encodeer.encode(rawPassword);
		qna.setPassword(encPassword);
		qnaRepository.save(qna);
	}
	
	@Transactional(readOnly=true)
	public Page<Boards> toEvent(Pageable pageable){
		// 이벤트 게시판에 이벤트 카테고리 게시물 리턴
		Page<Boards> board = boardRepository.findByCategory("event", pageable);
		return board;
	}
	
	@Transactional(readOnly=true)
	public Page<Boards> toNotice(Pageable pageable){
		// 공지사항 게시판에 공지사항 카테고리 게시물 리턴
		Page<Boards> board = boardRepository.findByCategory("notice", pageable);
		return board;
	}
	
	@Transactional(readOnly=true)
	public Page<Boards> toFaq(Pageable pageable){
		// 공지사항 게시판에 공지사항 카테고리 게시물 리턴
		Page<Boards> board = boardRepository.findByCategory("faq", pageable);
		return board;
	}
	
	@Transactional(readOnly=true)
	public Page<QnaBoard> toQna(Pageable pageable){
		// 문의 게시판에 게시물 리턴
		Page<QnaBoard> qna = qnaRepository.findAll(pageable);
		return qna;
	}
	
	@Transactional(readOnly=true)
	public Boards noticeDetail(int id) {
		boardRepository.updateCount(id);
		return boardRepository.findById(id).orElseThrow(()->{
			return new IllegalArgumentException("글 상세보기 실패 : 아이디를 찾을 수 없습니다.");
		});
	}
	
	@Transactional(readOnly=true)
	public Boards eventDetail(int id) {
		boardRepository.updateCount(id);
		return boardRepository.findById(id).orElseThrow(()->{
			return new IllegalArgumentException("글 상세보기 실패 : 아이디를 찾을 수 없습니다.");
		});
	}
	
	@Transactional(readOnly=true)
	public Boards faqDetail(int id) {
		boardRepository.updateCount(id);
		return boardRepository.findById(id).orElseThrow(()->{
			return new IllegalArgumentException("글 상세보기 실패 : 아이디를 찾을 수 없습니다.");
		});
	}
	
	@Transactional(readOnly=true)
	public QnaBoard qnaDetail(int id) {
		qnaRepository.updateCount(id);
		return qnaRepository.findById(id).orElseThrow(()->{
			return new IllegalArgumentException("글 상세보기 실패 : 아이디를 찾을 수 없습니다.");
		});
	}
	
	@Transactional
	public void update(int id, Boards requestBoard) {
		Boards board = boardRepository.findById(id).orElseThrow(()->{
			return new IllegalArgumentException("글 불러오기 실패 : 아이디를 찾을 수 없습니다.");
			});
		board.setTitle(requestBoard.getTitle());
		board.setContent(requestBoard.getContent());
	}
	
	
	
	@Transactional
	public void deleteBoard(int id) {
		// 공지, 이벤트, faq 게시글 삭제
		boardRepository.deleteById(id);
	}
	
	@Transactional
	public void deleteQna(int id) {
		// 문의 (QnA) 글 삭제
		qnaRepository.deleteById(id);
	}
	
}
