package com.midori.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
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
import com.midori.domain.QnaVO;
import com.midori.domain.ReviewVO;
import com.midori.mapper.ProductMapper;
import com.midori.service.ProductService;
import com.midori.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/product/*")//폴더 이름 review
@AllArgsConstructor
public class ProductController {
	
	@Setter(onMethod_ = @Autowired)
	private ProductService service ;
	
	//상품뷰페이지 리뷰 ,qna 출력
	@GetMapping("/productview")
	public void productView(@RequestParam("pseq") int pseq, Model model) {
		//System.out.println("pseq: "+pseq);
		List<ReviewVO> reviewList = service.reviewRead(pseq);
		List<QnaVO> qnaList = service.QnaListByProduct(pseq);
		
		//System.out.println("reviewList: "+reviewList);
		//System.out.println("qnaList: "+qnaList);
		
		model.addAttribute("rlist", reviewList);
		model.addAttribute("qnalist",qnaList);
		model.addAttribute("pseq", pseq);
	}
	
	
	@ResponseBody
	@GetMapping("/getReviewAjax.do")
	public List<ReviewVO> AjaxreviewList(@RequestParam("pseq") int pseq){
		List<ReviewVO> rlist = service.reviewRead(pseq);
		return rlist;
	}
	
	@ResponseBody
	@GetMapping("/getQnaAjax.do")
	public List<QnaVO> AjaxQnaList(@RequestParam("pseq") int pseq){
		List<QnaVO> qnalist = service.QnaListByProduct(pseq);
		return qnalist;
	}

	
}
