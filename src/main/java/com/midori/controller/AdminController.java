package com.midori.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.midori.domain.QnaVO;
import com.midori.domain.ReviewVO;
import com.midori.service.AdminService;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Controller
@RequestMapping("/adm/*")//폴더 이름 review
@AllArgsConstructor
public class AdminController {
	
	@Setter(onMethod_ = @Autowired)
	private AdminService service;
	
	@GetMapping("/cunstomlogin")
	public void customLogin(String error,String logout, Model model) {
		
	}
	
	@GetMapping("/admin")
	public void adminLoginForm() {
		
	}
    
	@GetMapping("/adminmanager")
	public void adminManager() {
		
	}
	
	@GetMapping("/customlogin")
	public void customlogin(String error,String logout, Model model) {
		
	}
	
	@GetMapping("/adminLogout") 
	public String adminLogout() {
		 return "redirect:/";
	}
	
	//리뷰
	//리뷰 리스트
	//jsp: review.jsp
	@GetMapping("/review.do")
	public void reviewList(Model model) {
		List<ReviewVO> reviewList = service.reviewList();
		model.addAttribute("reviewList", reviewList);
	}
	//리뷰 상세페이지
	//jsp:reviewView.jsp
	@GetMapping("/reviewView.do")
	public void reviewView(@RequestParam("rbno") int rbno, Model model) {
		System.out.println("rbno: "+rbno);
		ReviewVO rvo = service.reviewSelectOne(rbno);
		model.addAttribute("rvo", rvo);
	}
	//리뷰 수정 셀렉트
	//jsp:reviewmodify.jsp
	@GetMapping("/reviewmodify.do")
	public void reviewModify(@RequestParam("rbno") int rbno, Model model) {
		System.out.println("rbno: "+rbno);
		ReviewVO rvo = service.reviewSelectOne(rbno);
		model.addAttribute("rvo", rvo);
		
	}
	//리뷰 수정
	@PostMapping("/reviewmodifypro.do")
	public String reviewModify(ReviewVO rvo) {
		System.out.println("rvo: "+rvo);
		service.reviewModify(rvo);
		return "redirect:/adm/review.do";
	}
	//리뷰 삭제
	@GetMapping("/reviewdelete.do")
	public String reviewDelete(@RequestParam("rbno") int rbno) {
		System.out.println("rbno: "+rbno);
		service.reviewDelete(rbno);
		return "redirect:/adm/review.do";
		
	}
		
		
	//상품문의
	//전체  qna 출력 -게시판 형식
	@GetMapping("/qna.do")
	public void qnaList(Model model) {
		List<QnaVO> qnaList = service.qnaList();
		model.addAttribute("qnaList", qnaList);
	}
	//상세 qna뷰
	@GetMapping("/qnaview.do")
	public void QnaView(@RequestParam("qbno") int qbno, Model model) {
		QnaVO qvo = service.getQnaOne(qbno);
		model.addAttribute("qvo", qvo);
	}
	//question 수정 폼
	@GetMapping("/questionmodify.do")
	public void questionMdofiyForm(@RequestParam("qbno") int qbno, Model model) {
		QnaVO qvo = service.getQnaOne(qbno);
		model.addAttribute("qvo", qvo);
	}
	//question 수정
	@PostMapping("/questionmodifypro.do")
	public String questionModify(QnaVO qvo) {
		service.QuestionModify(qvo);
		return "redirect:/adm/qna.do";
	}
	//question 삭제
	@GetMapping("/questiondelete.do")
	public String qeustionDelete(@RequestParam("qbno") int qbno) {
		service.QuestionDelete(qbno);
		return "redirect:/adm/qna.do";
	}
	//answer 등록 폼(상세 qna 뷰에서 답글등록 버튼 눌렀을 때 컨트롤러)
	@GetMapping("/answerwrite.do")
	public void answerWriteForm(@RequestParam("qbno") int qbno, @RequestParam("pseq") int pseq, @RequestParam("ref") int ref, Model model) {
		model.addAttribute("qbno", qbno);
		model.addAttribute("pseq", pseq);
		model.addAttribute("ref", ref);
		
	}
	//answer 등록(awriter form에 있어야댐)
	@PostMapping("/answerwritepro.do")
	public String answerWrite(QnaVO avo) {
		service.AnswerInsert(avo);
		service.updateStatus(avo.getQbno());//답변 등록시 스테이터스 2로 변경
		return "redirect:/adm/qna.do";
	}
	//answer 수정 폼
	@GetMapping("/answermodify.do")
	public void answerModifyForm(@RequestParam("abno") int abno, Model model) {
		QnaVO avo = service.getAnswer(abno);
		model.addAttribute("avo", avo);
		
	}
	//answer 수정(awriter form에 있어야댐)
	@PostMapping("/answermodifypro.do")
	public String answerModify(QnaVO avo) {
		service.AnswerModify(avo);
		return "redirect:/adm/qna.do";
	}
	//answer 삭제
	@GetMapping("/answerdelete")
	public String answerDelete(@RequestParam("abno") int abno, @RequestParam("qbno") int qbno) {
		service.AnswerDelete(abno);
		service.updateStatusDelete(qbno);//삭제하면 status 다시 1로
		return "redirect:/adm/qna.do";
	}
	
}
