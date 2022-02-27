package com.midori.controller;

import java.security.Principal;
import java.util.ArrayList;
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
	
	//주문정보 페이지
	@PostMapping("/orderinfo.do")
	public void orderInfoOne(CartVO cvo, Model model, Principal principal) {
		//System.out.println("컨트롤러 시작");
		//System.out.println("cvo: "+cvo);
		String id = principal.getName();
		List<CartVO> cartlist = null;
		MemberVO mvo = null;
		int totalPrice = 0;
		
		if(cvo.getQuantity() == 0) {//장바구니에서 결제하는 경우, cartlist 에서 바로 컨트롤러로 보내기
			cartlist = service.getCartList(id);
			
			for(CartVO cvo1 : cartlist) {
				totalPrice += cvo1.getPrice2()*cvo1.getQuantity();
			}
			
		}else {//상품뷰페이지에서 결제하는 경우(얘는 form을 날려서 와야 함 pseq, quantity
			ProductVO pvo = service.productSelect(cvo.getPseq());
			totalPrice = cvo.getQuantity()* pvo.getPrice2();
			
			cartlist = new ArrayList<CartVO>();
			
			cvo.setImage(pvo.getImage());
			cvo.setPname(pvo.getName());
			cvo.setPrice2(pvo.getPrice2());
			cartlist.add(cvo);
		}
		
		mvo = service.memberSelect(id);
		
		model.addAttribute("cartlist", cartlist);
		model.addAttribute("mvo", mvo);
		model.addAttribute("totalPrice", totalPrice);
		
	}
	
	//결제처리
	//orders_insert(oname, phone, zip_num, address1, address2)
	//주문번호 최대값 구하기
	//order_detail_insert(oseqMax, pseq, quantity)
	//cart result update
	@PostMapping("/orderInsert.do")
	public String orderInserCart(Principal principal, OrderVO ovo, CartVO cvo) {
		
		String id = principal.getName();
		ovo.setId(id);	
	
		System.out.println("ovo: "+ovo);
		//orders 테이블 insert
		service.orderInsert(ovo);
		
		int oseqMax = service.getMaxOseq();
		
		
//		cvo.setPseq(ovo.getPseq());
//		cvo.setQuantity(ovo.getQuantity());
		cvo.setOseq(oseqMax);
//		cvo.setCseq(ovo.getCseq());
		
		if(cvo.getCseq() == 0) {
			System.out.println("cartvo: "+cvo);
			service.orderDInsert(cvo);
			System.out.println("뇬냐");
		}else {
			System.out.println("옹냥냥뇽");
			List<CartVO> cartList = service.getCartList(id);
			System.out.println(cartList);
			System.out.println("뇨뇨?");
			for(CartVO cartVO : cartList) {
				System.out.println("뇨뇨??");
				cartVO.setOseq(oseqMax);
				service.orderDInsert(cartVO);
				System.out.println("뇨뇨???");
				service.cartResultUpdate(cartVO.getCseq());
				System.out.println("뇨뇨????");
			}//for
		}
		System.out.println("end"+cvo);
		return "redirect:/";
	}

	
}
