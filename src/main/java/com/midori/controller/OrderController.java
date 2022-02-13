package com.midori.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.midori.domain.CartVO;
import com.midori.domain.MemberVO;
import com.midori.domain.OrderVO;
import com.midori.domain.ProductVO;
import com.midori.service.OrderService;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Controller
@RequestMapping("/order/*")
@AllArgsConstructor
public class OrderController {
	
	@Setter(onMethod_ = @Autowired)
	private OrderService service;
	
	
	//상품뷰페이지에서 결제하는 경우
	@PostMapping("/orderinfoOne.do")
	public String orderInfoOne(CartVO cvo, Model model, Principal principal) {
		String id = principal.getName();
		
		ProductVO pvo = service.productSelect(cvo.getPseq());
		int totalPrice = cvo.getQuantity()* pvo.getPrice2();
		MemberVO mvo = service.memberSelect(id);
		
		cvo.setImage(pvo.getImage());
		cvo.setPname(pvo.getName());
		cvo.setPrice2(pvo.getPrice2());
		
		model.addAttribute("cartlist", cvo);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("mvo", mvo);
		return "redirect:/order/orderinfo.do";
	}
	
	@PostMapping("/orderInsertOne.do")//return 진행중인 주문 페이지로
	public String orderInsertOne(OrderVO ovo, Principal principal) {
		ovo.setId(principal.getName());
		
		service.orderInsert(ovo);
		int oseqMax = service.getMaxOseq();
		
		CartVO cvo = new CartVO();
		cvo.setPseq(ovo.getPseq());
		cvo.setQuantity(ovo.getQuantity());
		
		service.orderDetailInsert(cvo, oseqMax);
		return "redirect:/order/orderlisting.do";//id만 있으면 됨
	}
	
	//장바구니에서 결제하는 경우
	@PostMapping("/orderinfoCart.do")
	public String orderInfoCart(Principal principal, Model model) {
		String id = principal.getName();
		List<CartVO> cartlist = service.getCartList(id);
		
		int totalPrice = 0;
		for(CartVO cvo : cartlist) {
			totalPrice += cvo.getPrice2()*cvo.getQuantity();
		}
		
		MemberVO mvo = service.memberSelect(id);
		
		model.addAttribute("cartlist", cartlist);
		model.addAttribute("mvo", mvo);
		model.addAttribute("totalPrice", totalPrice);
		return "redirect:/order/orderinfo.do";
	}
	
	@PostMapping("/orderInsertCart.do")
	public String orderInserCart(Principal principal, OrderVO ovo) {
		String id = principal.getName();
		List<CartVO> cartlist = service.getCartList(id);
		
		ovo.setId(id);
		service.orderInsert(ovo);
		
		int oseqMax = service.getMaxOseq();
		
		for(CartVO cartVO : cartlist) {
			service.orderDetailInsert(cartVO, oseqMax);
			service.cartResultUpdate(cartVO.getCseq());
		}

		return "redirect:/order/orderlisting.do";
	}

}
