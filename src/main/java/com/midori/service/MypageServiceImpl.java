package com.midori.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.midori.domain.OrderVO;
import com.midori.mapper.MypageMapper;

import lombok.Setter;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Setter(onMethod_ = @Autowired)
	private MypageMapper mapper;

	@Override
	public List<OrderVO> orderDetailList(int oseq) {
		return mapper.orderDetailList(oseq);
	}

	@Override
	public void orderConfirm(int oseq) {
		mapper.orderConfirm(oseq);
	}
}
