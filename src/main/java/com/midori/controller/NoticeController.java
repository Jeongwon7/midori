package com.midori.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.midori.domain.Criteria;
import com.midori.domain.NoticeVO;
import com.midori.domain.PageVO;
import com.midori.service.NoticeService;

import lombok.Setter;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	@Setter(onMethod_ = @Autowired)
	private NoticeService service;
	
	
	@GetMapping("/notice")
	public void list(Criteria cri,Model model) { 
		model.addAttribute("list",service.getListWithPaging(cri));
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker", new PageVO(cri, total));
	}
	
	@GetMapping("/noticewrite")
	//@PreAuthorize("isAuthenticated()") //로그인이 성공한 사용자만이 글쓰기 할 수 있다
	public void noticeWrite() {
		
	}
	
	@PostMapping("/noticewritepro.do")
	public String noticeList(NoticeVO notice, RedirectAttributes rttr) {
		service.register(notice);
		rttr.addFlashAttribute("result",notice.getBno());
		return "redirect:/notice/notice.do";
	}
	
	@GetMapping({"/noticeview.do", "/noticemodify"})
	public void read(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri,  Model model) {

		model.addAttribute("nvo",service.read(bno));
		model.addAttribute("nextVO", service.nextPage(bno));
		model.addAttribute("prevVO", service.prevPage(bno));
    }
	@PostMapping("/noticemodifypro")
	public String modify(NoticeVO notice, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		if(service.update(notice)) {
			rttr.addFlashAttribute("result","success");
		}
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		return "redirect:/notice/notice.do";
	}
	
	@GetMapping("/noticedelete")
	public String delete(@RequestParam("bno") int bno, RedirectAttributes rttr) {
		if(service.delete(bno)) {
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/notice/notice.do";
	}
}