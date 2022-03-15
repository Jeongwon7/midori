package com.midori.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.midori.domain.CartVO;
import com.midori.domain.OrderVO;
import com.midori.service.MypageService;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Controller
@RequestMapping("/mypage/*")//폴더 이름
@AllArgsConstructor
public class MypageController {
	
	@Setter(onMethod_ = @Autowired)
	private MypageService service;
	
	//장바구니 삭제
	@RequestMapping(value = "/cartDelete.do", method = RequestMethod.POST)
    public String cartdelete(HttpServletRequest request, Model model) {

       String[] CseqArr = request.getParameterValues("cseq");

       for (String cseq : CseqArr) {
          System.out.println(cseq);
          service.deleteCart(cseq);
       
       }
       return "redirect:/mypage/cart_list";
    }
	
	//장바구니 등록
	 @PostMapping("/cartInsert.do")
	 @PreAuthorize("isAuthenticated()")
	 public String cartInsert(CartVO cvo, Principal principal) {
		cvo.setId(principal.getName());
		System.out.println("cvo: "+cvo);
	    service.goCart(cvo);
	    return "redirect:/mypage/cart_list";
	 }
	 
	//장바구니 등록
	 @GetMapping("/cartinsert.do")
		 @PreAuthorize("isAuthenticated()")
		 public String cartinsert(CartVO cvo, Principal principal) {
			cvo.setId(principal.getName());
			System.out.println("cvo: "+cvo);
		    service.goCart(cvo);
		    return "redirect:/mypage/cart_list";
		 }
	
	 //장바구니 페이지
	 @GetMapping("/cart_list")
	   public String cartlist(Principal principal,Model model) {
	      String id = principal.getName(); //로그인한 id
	      List<CartVO> cartList = service.listCart(id);
	      int totalPrice = 0;
	      for(CartVO cvo : cartList) {
	         totalPrice += cvo.getPrice2() * cvo.getQuantity(); //총액
	      }
	      model.addAttribute("cartList",cartList);
	      model.addAttribute("totalPrice",totalPrice);
	      
	      return "/mypage/cart_list";
	   }

	 
	 
	
	//주문상세페이지
	@GetMapping("/orderdetail.do")//jsp 오더리스트 에서 상세보기에 ?oseq=${리스트.oseq} 이런 식으로 줘서 받기 
	public void orderdetailList(@RequestParam("oseq") int oseq, Principal principal, Model model) {
		//System.out.println(oseq);
		//System.out.println(principal.getName());
		//id, oseq로 odlist 뽑기
		List<OrderVO> odlist = service.orderDetailList(oseq);
		//od
		OrderVO od = odlist.get(0);
		//status
		int status = od.getStatus();
		//totalPrice
		int totalPrice= 0;

		for(OrderVO ovo : odlist) {
			totalPrice += ovo.getPrice2()*ovo.getQuantity();
		}
		
		model.addAttribute("od", od);
		model.addAttribute("odlist", odlist);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("status", status);
	}

	@GetMapping("/orderconfirm.do")
	public String orderConfirm(@RequestParam("oseq") int oseq) {
		service.orderConfirm(oseq);
		return "redirect:/mypage/orderdetail.do?oseq="+oseq;
	}
	
}
