package com.midori.service;

import java.util.List;

import com.midori.domain.OrderVO;

public interface MypageService {
	//주문상세페이지
	public List<OrderVO> orderDetailList(int oseq);
	//구매확정 메서드
	public void orderConfirm(int oseq);
}
