package com.midori.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.midori.domain.QnaVO;
import com.midori.service.QnaService;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Controller
@RequestMapping("/qna/*")//폴더 이름 review
@AllArgsConstructor
public class QnaController {
	
	@Setter(onMethod_ = @Autowired)
	private QnaService service;
	
	@GetMapping("/questionwrite.do")
	public void questionWrite(@RequestParam("pseq") int pseq, Model model) {
		model.addAttribute("pseq", pseq);
	}
	
	@PostMapping("/questionwritepro.do")
	public String questionWritePro(QnaVO qvo, Principal principal) {
		System.out.println("principal: "+principal.getName());
		int ref = service.getRef()+1;
		qvo.setRef(ref);
		qvo.setQwriter(principal.getName());
		System.out.println("id: "+principal.getName());
		service.questionInsert(qvo);
		return "redirect:/product/product_view.do?pseq="+qvo.getPseq();
		
	}
	
	@GetMapping("/questionmodify.do")
	public void modify(@RequestParam("qbno") int qbno, Model model) {
		QnaVO qvo = service.getQuestion(qbno);
		model.addAttribute("qvo", qvo);
	}
	
	
	@PostMapping("/questionmodifypro.do")
	public String questionModify(QnaVO qvo) {
		System.out.println("질문 수정 컨트롤러");
		service.questionModify(qvo);
		return "redirect:/product/product_view.do?pseq="+qvo.getPseq();
	}
	
	//비동기식 삭제
	@ResponseBody
	@GetMapping("/questiondelete.do")
	public void questionDelete(@RequestParam("qbno") int qbno) {
		service.questionDelete(qbno);
	}
	
	 
	
	
}
