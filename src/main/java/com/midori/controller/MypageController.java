package com.midori.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		System.out.println("뇬냐");
		service.orderConfirm(oseq);
		System.out.println("뇬뉴");
		return "redirect:/mypage/orderdetail.do?oseq="+oseq;
	}
	
}
