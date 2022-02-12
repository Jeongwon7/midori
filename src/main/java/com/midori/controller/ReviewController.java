package com.midori.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.security.Principal;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.midori.domain.ReviewVO;
import com.midori.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/review/*")//폴더 이름 review
@AllArgsConstructor
@Log4j
public class ReviewController {//컨트롤러 테스트 다 하고 테이블 제약조건(writer 외래키) 원래대로 하기
	
	@Setter(onMethod_ = @Autowired)
	private ReviewService service;
	
	//주문상세 페이지에서 리뷰작성 클릭시 호출되는 컨트롤러
	//리뷰작성 페이지로 간다
	@GetMapping("/reviewwrite")//<a href="/review/reviewwrite.do?pseq=${orderVO.pseq}">리뷰 작성</a>
	public void reviewInsertForm(@RequestParam("pseq") int pseq, Model model) {
		model.addAttribute("pseq", pseq);//pseq 리뷰작성 페이지에 hidden으로 주기
	}
	
	//리뷰 insert 컨트롤러
	@PostMapping("/reviewwritepro.do")
	public String reviewInsert(ReviewVO rvo, Principal principal) {
		rvo.setWriter(principal.getName());
		System.out.println("rvo: "+rvo);
		System.out.println("id: "+rvo.getWriter());
		service.reviewInsert(rvo);
		return "redirect:/product/productview.do?pseq="+rvo.getPseq();
	}
	
	//유저: 리뷰 수정 셀렉트
	//수정하기 버튼 눌렀을 때, rbno를 받아온다
	//jsp: reviewmodify.jsp
	@GetMapping("/reviewmodify.do")
	public void reviewModifyForm(@RequestParam("rbno") int rbno, Model model) {
		System.out.println("rbno: "+rbno);
		ReviewVO rvo = service.reviewSelectOne(rbno);
		model.addAttribute("rvo", rvo);
	}
	//유저: 리뷰 수정
	//수정 후 상품뷰페이지로
	@PostMapping("/reviewmodifypro.do")
	public String reviewModify(ReviewVO rvo) {
		System.out.println("rvo: "+rvo);
		service.reviewModify(rvo);
		return "redirect:/product/productview.do?pseq="+rvo.getPseq();
	}
	//유저: 리뷰 삭제
	@ResponseBody
	@GetMapping("/reviewdelete.do")
	public String reviewDelete(@RequestParam("rbno") int rbno) {
		System.out.println("rbno: "+rbno);
		service.reviewDelete(rbno);
		return "삭제되었습니다";
	}
	

}
