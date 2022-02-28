package com.midori.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.midori.domain.Criteria9;
import com.midori.domain.PageVO;
import com.midori.domain.PageVO9;
import com.midori.domain.ProductVO;
import com.midori.domain.QnaVO;
import com.midori.domain.ReviewVO;
import com.midori.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Controller
@RequestMapping("/product/*")//폴더 이름 review
@AllArgsConstructor
public class ProductController {
	
	@Setter(onMethod_ = @Autowired)
	private ProductService service ;
	
	//상품뷰페이지
	@GetMapping("/product_view.do")
	public void productView(@RequestParam("pseq") int pseq, Model model) {
		System.out.println("pseq: "+pseq);
		
		ProductVO pList = service.getProductOne(pseq);
		List<ReviewVO> reviewList = service.reviewRead(pseq);
		List<QnaVO> qnaList = service.QnaListByProduct(pseq);
		
		System.out.println("reviewList: "+reviewList);
		System.out.println("qnaList: "+qnaList);
		
		model.addAttribute("plist", pList);
		model.addAttribute("rlist", reviewList);
		model.addAttribute("qnalist",qnaList);
		
	}
	
	//리뷰 비동기식 삭제 후 리스트 뽑는 컨트롤러
	@ResponseBody
	@GetMapping("/getReviewAjax.do")
	public List<ReviewVO> AjaxreviewList(@RequestParam("pseq") int pseq){
		List<ReviewVO> rlist = service.reviewRead(pseq);
		return rlist;
	}
	//상품문의, 답변 비동기식 삭제 후 리스트 뽑는 컨트롤러
	@ResponseBody
	@GetMapping("/getQnaAjax.do")
	public List<QnaVO> AjaxQnaList(@RequestParam("pseq") int pseq){
		List<QnaVO> qnalist = service.QnaListByProduct(pseq);
		return qnalist;
	}
	
	//상품 카테고리별 리스트 페이지
	@GetMapping("/product_list")
	   public void productList(Model model, Criteria9 cri9) {
		  List<ProductVO> list = service.getProductListWithPaging(cri9);
		  System.out.println("list: "+list);
	      model.addAttribute("list", list);
	      int total = service.getTotalCount(cri9);  
	      model.addAttribute("pageMaker", new PageVO9(cri9, total));
	   
	   }
	
}
