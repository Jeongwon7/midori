package com.midori.mapper;

import java.util.List;

import com.midori.domain.OrderVO;

public interface MypageMapper {
	//주문상세페이지
	public List<OrderVO> orderDetailList(int oseq);
	//구매확정 메서드
	public void orderConfirm(int oseq);
}
