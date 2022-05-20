package com.cos.mobile.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.cos.mobile.config.auth.PrincipalDetail;
import com.cos.mobile.model.QnaBoard;
import com.cos.mobile.repository.QnaRepository;
import com.cos.mobile.service.BoardService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private QnaRepository qnaRepository;

	@GetMapping({"","/"})
	public String index(@AuthenticationPrincipal PrincipalDetail principal) {
		return "index";
	}
	
	
	@GetMapping({"/auth/event"})
	public String eventBoard(Model model, @PageableDefault(size=5, sort="id", direction= Sort.Direction.DESC) Pageable pageable) {
		// 이벤트 게시판 목록 출력
		model.addAttribute("boards", boardService.toEvent(pageable));
		return "board/eventBoard";
	}
	
	@GetMapping({"/board/eventForm"})
	public String saveeventForm() {
		// 이벤트 게시판 작성페이지 이동
		return "board/eventForm";
	}
	
	@GetMapping({"/auth/notice"})
	public String noticeBoard(Model model, @PageableDefault(size=5, sort="id", direction= Sort.Direction.DESC) Pageable pageable) {
		// 공지사항 게시판 목록 출력
		model.addAttribute("boards", boardService.toNotice(pageable));
		return "board/noticeBoard";
	}
	
	@GetMapping({"/board/noticeForm"})
	public String savenoticeForm() {
		// 공지사항 작성페이지 이동
		return "board/noticeForm";
	}
	
	@GetMapping({"/auth/faq"})
	public String faqBoard(Model model, @PageableDefault(size=5, sort="id", direction= Sort.Direction.DESC) Pageable pageable) {
		// FAQ 게시판 목록 출력
		model.addAttribute("boards", boardService.toFaq(pageable));
		return "board/faqBoard";
	}
	
	@GetMapping({"/board/faqForm"})
	public String savefaqForm() {
		// FAQ 작성페이지 이동
		return "board/faqForm";
	}
	
	@GetMapping({"/auth/qnaForm"})
	public String qnaForm() {
		// 1:1문의 (QnA) 작성페이지 이동
		return "board/qnaForm";
	}
	
	@GetMapping({"/auth/qna"})
	public String qnaBoard(Model model, @PageableDefault(size=5, sort="id", direction= Sort.Direction.DESC) Pageable pageable) {
		// 1:1문의 (QnA) 게시판 목록 출력
		Page<QnaBoard> qna = boardService.toQna(pageable);
		int pageNumber = qna.getPageable().getPageNumber();	// 현재페이지
		int totalPages = qna.getTotalPages();	// 총 페이지수
		int pageBlock = 4;	// 페이지 블럭 수 1, 2, 3, 4
		int startBlockPage = ((pageNumber)/pageBlock)*pageBlock+1; //현재 페이지가 7이라면 1*5+1=6
		int endBlockPage = startBlockPage+pageBlock-1; //6+5-1=10. 6,7,8,9,10해서 10.
		endBlockPage= totalPages<endBlockPage? totalPages:endBlockPage;
		
		model.addAttribute("startBlockPage", startBlockPage);
		model.addAttribute("endBlockPage", endBlockPage);
		model.addAttribute("boards", boardService.toQna(pageable));
		return "board/qnaBoard";
	}
	
	
	
	@GetMapping("/notice/{id}")
	public String noticefindbyId(@PathVariable int id, Model model) {
		// 공지사항 상세보기
		model.addAttribute("board", boardService.noticeDetail(id));
		return "board/noticeDetail";
	}
	
	@GetMapping("/event/{id}")
	public String eventfindbyId(@PathVariable int id, Model model) {
		// 이벤트 상세보기
		model.addAttribute("board", boardService.eventDetail(id));
		return "board/eventDetail";
	}
	
	@GetMapping("/faq/{id}")
	public String faqfindbyId(@PathVariable int id, Model model) {
		// FAQ 상세보기
		model.addAttribute("board", boardService.faqDetail(id));
		return "board/faqDetail";
	}
	
	@GetMapping("/qna/{id}")
	public String qnafindbyId(@PathVariable int id, Model model) {
		// 1:1문의 (QnA) 상세보기
		model.addAttribute("board", boardService.qnaDetail(id));
		return "board/qnaDetail";
	}
	
	@GetMapping("/qnachk/{id}")
	public String qnaCheck(@PathVariable int id, Model model) {
		model.addAttribute("board", boardService.qnaDetail(id));
		return "board/qnaPassword";
	}
	
	// 글 수정하기(update)
	@GetMapping("/board/{id}/eventUpdate")
	public String eventUpdate(@PathVariable int id, Model model) {
		model.addAttribute("board", boardService.eventDetail(id));
		return "board/eventUpdate";
	}
	
	@GetMapping("/board/{id}/faqUpdate")
	public String faqUpdate(@PathVariable int id, Model model) {
		model.addAttribute("board", boardService.eventDetail(id));
		return "board/faqUpdate";
	}
	
	@GetMapping("/board/{id}/noticeUpdate")
	public String noticeUpdate(@PathVariable int id, Model model) {
		model.addAttribute("board", boardService.eventDetail(id));
		return "board/noticeUpdate";
	}
	
	@GetMapping("/board/{id}/qnaUpdate")
	public String qnaUpdate(@PathVariable int id, Model model) {
		model.addAttribute("board", boardService.qnaDetail(id));
		return "board/qnaUpdate";
	}
}
