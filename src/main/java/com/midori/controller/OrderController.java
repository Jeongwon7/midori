package com.midori.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		}else {
			List<CartVO> cartList = service.getCartList(id);
			System.out.println(cartList);
			for(CartVO cartVO : cartList) {
				cartVO.setOseq(oseqMax);
				service.orderDInsert(cartVO);
				service.cartResultUpdate(cartVO.getCseq());
			}//for
		}
		System.out.println("end"+cvo);
		return "redirect:/";
	}

	
	 @GetMapping("/ordering")
	   public String orderIng(Principal principal,Model model) {
	      
	      String id=principal.getName();
	        List<Integer> oseqList=service.OrderListing(id);
	        //현재 진행 중인 주문 목록 대표 상품 외 2건식으로 출력하기기
	        ArrayList<OrderVO> orderList=new ArrayList<>();
	         
	        //주문중인 번호 상품 oseq 를 반복문을 돌린다.
	        for(int oseq :oseqList){
	            //미처리 항목 1
	            List<OrderVO> orderListing=service.ListOrderByID(id, "%", oseq);
	             
	            //목록중 첫번째 값만 orderVO 객체에 담는다.
	            OrderVO orderVO=orderListing.get(0);
	            orderVO.setPname(orderVO.getPname() + " 포함　"+ orderListing.size() + "  건");
	             
	            //주문 된 상품 목록의 전체 가격을 price2 에  담는다.
	            int totalPrice=0;
	            for(OrderVO  ovo : orderListing){
	                totalPrice +=ovo.getPrice2()*ovo.getQuantity();
	            }
	            orderVO.setPrice2(totalPrice);
	             
	             
	            orderList.add(orderVO);
	        }
	         
	        model.addAttribute("title", "진행중인 주문 목록");
	        model.addAttribute("orderList", orderList);
	      
	      
	      return "/mypage/ordering";
	   }
	 
	 
		@GetMapping("/orderall")
		public String orderAll(Principal principal,Model model) {
			
			String id = principal.getName();
			
			 List<Integer> oseqList=service.SelectSeqOrdering(id);
	         //주문 목록 담기 객체 만들기
	         List<OrderVO> orderList=new ArrayList<>();
	                      
	         for(int oseq: oseqList){
	             List<OrderVO> orderListing=service.ListOrderByID(id,"%", oseq);
	               
	             OrderVO orderVO=orderListing.get(0);
	             orderVO.setPname(orderVO.getPname() + " 포함　" + orderListing.size() + " 건");
	              
	             int totalPrice=0;
	             for(OrderVO ovo : orderListing){
	                 totalPrice += ovo.getPrice2()* ovo.getQuantity();
	             }
	             orderVO.setPrice2(totalPrice);
	             orderList.add(orderVO);
	         }
	         model.addAttribute("title", "총 주문 목록");
	         model.addAttribute("orderList", orderList);
	         
			 return "/mypage/orderall";
		}
	
}
