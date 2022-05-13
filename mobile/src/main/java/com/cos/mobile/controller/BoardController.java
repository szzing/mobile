package com.cos.mobile.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.cos.mobile.config.auth.PrincipalDetail;
import com.cos.mobile.service.BoardService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class BoardController {
	@Autowired
	private final BoardService boardService;
	
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
		return "board/faqForm";
	}
	
//	@GetMapping({"/qna"})
//	public String qnaBoard(Model model, @PageableDefault(size=5, sort="id", direction= Sort.Direction.DESC) Pageable pageable) {
//		// QnA 게시판 목록 출력(미구현)
//		model.addAttribute("boards", boardService.toQna(pageable));
//		return "board/qnaBoard";
//	}
	
	
	
	@GetMapping("/notice/{id}")
	public String noticefindbyId(@PathVariable int id, Model model) {
		model.addAttribute("board", boardService.noticeDetail(id));
		return "board/noticeDetail";
	}
	
	@GetMapping("/event/{id}")
	public String eventfindbyId(@PathVariable int id, Model model) {
		model.addAttribute("board", boardService.eventDetail(id));
		return "board/eventDetail";
	}
	
	@GetMapping("/faq/{id}")
	public String faqfindbyId(@PathVariable int id, Model model) {
		model.addAttribute("board", boardService.faqDetail(id));
		return "board/faqDetail";
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
	
	
}
