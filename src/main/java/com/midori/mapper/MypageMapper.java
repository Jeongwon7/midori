package com.midori.mapper;

import java.util.List;

import com.midori.domain.CartVO;
import com.midori.domain.OrderVO;

public interface MypageMapper {
	//주문상세페이지
	public List<OrderVO> orderDetailList(int oseq);
	//구매확정 메서드
	public void orderConfirm(int oseq);
	
	//cart insert
    public void goCart(CartVO cvo);
    //cart list
    public List<CartVO> listCart(String id);
    //cart delete
    public void deleteCart(String cseq);
}
