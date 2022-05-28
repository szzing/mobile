package com.cos.mobile.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.mobile.dto.ReplySaveRequestDto;
import com.cos.mobile.model.Boards;
import com.cos.mobile.model.QnaBoard;
import com.cos.mobile.model.Reply;
import com.cos.mobile.model.Users;
import com.cos.mobile.repository.BoardRepository;
import com.cos.mobile.repository.QnaRepository;
import com.cos.mobile.repository.ReplyRepository;
import com.cos.mobile.repository.UserRepository;

@Service
public class BoardService {
	@Autowired
	private BoardRepository boardRepository;
	
	@Autowired
	private QnaRepository qnaRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private ReplyRepository replyRepository;

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
		if(qna.getWriter()==null) {
			qna.setUser(user);
		}
		qna.setPass(qna.getPass());
		qnaRepository.save(qna);
	}
	
	@Transactional
	public void qnawrite2(QnaBoard qna)throws IllegalStateException, IOException{
		qna.setCount(0);
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
	public Page<QnaBoard> toMyQna(Pageable pageable, Users user){
		// 나의 문의 게시판에 게시물 리턴
		Page<QnaBoard> myqna = qnaRepository.findByUser_Id(user.getId(), pageable);
		return myqna;
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
	public void qnaUpdate(int id, QnaBoard requestQna) {
		QnaBoard qnaboard = qnaRepository.findById(id).orElseThrow(()->{
			return new IllegalArgumentException("글 불러오기 실패 : 아이디를 찾을 수 없습니다.");
		});
		qnaboard.setTitle(requestQna.getTitle());
		qnaboard.setPass(requestQna.getPass());
		qnaboard.setSecret(requestQna.isSecret());
		qnaboard.setContent(requestQna.getContent());
	}
	
	@Transactional
	public void replySave(ReplySaveRequestDto replySaveRequestDto) {
		if(replySaveRequestDto.getUserId()==100) {
			// 로그인 안한 유저 댓글쓰기
			QnaBoard qnaboard = qnaRepository.findById(replySaveRequestDto.getQnaboardId()).orElseThrow(()->{
				return new IllegalArgumentException("댓글 작성 실패 : 게시글을 찾을 수 없습니다.");
				});
			Reply reply = Reply.builder().qnaboard(qnaboard).writer(replySaveRequestDto.getWriter())
					.content(replySaveRequestDto.getContent()).build();
			replyRepository.save(reply);
		}else {
			// 로그인 유저 댓글쓰기
			Users user = userRepository.findById(replySaveRequestDto.getUserId()).orElseThrow(()->{
				return new IllegalArgumentException("댓글 작성 실패 : 사용자 정보를 찾을 수 없습니다.");
				});
			
			QnaBoard qnaboard = qnaRepository.findById(replySaveRequestDto.getQnaboardId()).orElseThrow(()->{
				return new IllegalArgumentException("댓글 작성 실패 : 게시글을 찾을 수 없습니다.");
				});
			Reply reply = Reply.builder().users(user).qnaboard(qnaboard).writer(replySaveRequestDto.getWriter())
					.content(replySaveRequestDto.getContent()).build();
			replyRepository.save(reply);
		}
		
			
	}
	
	@Transactional
	public void deleteReply(int replyId) {
		// 문의게시판 댓글 삭제
		replyRepository.deleteById(replyId);
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
	
	@Transactional(readOnly=true)
	public QnaBoard qnaPassCheck(QnaBoard qnaboard) {
		System.out.println(qnaboard.getId());
		System.out.println(qnaboard.getPass());
		return qnaRepository.findByIdAndPass(qnaboard.getId(), qnaboard.getPass());
	}
}
