package com.midori.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.midori.domain.CartVO;
import com.midori.domain.MemberVO;
import com.midori.domain.OrderVO;
import com.midori.domain.ProductVO;
import com.midori.mapper.OrderMapper;

import lombok.Setter;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Setter(onMethod_ = @Autowired)
	private OrderMapper mapper;

	@Override
	public ProductVO productSelect(int pseq) {
		return mapper.productSelect(pseq);
	}

	@Override
	public void orderInsert(OrderVO ovo) {
		mapper.orderInsert(ovo);

	}

	@Override
	public int getMaxOseq() {
		return mapper.getMaxOseq();
	}

	@Override
	public void orderDetailInsert(CartVO cvo, int oseq) {
		mapper.orderDetailInsert(cvo, oseq);

	}

	@Override
	public MemberVO memberSelect(String id) {
		return mapper.memberSelect(id);
	}

	@Override
	public List<CartVO> getCartList(String id) {
		return mapper.getCartList(id);
	}
	
	@Override
	public void cartResultUpdate(int cseq) {
		mapper.cartResultUpdate(cseq);
		
	}

}
