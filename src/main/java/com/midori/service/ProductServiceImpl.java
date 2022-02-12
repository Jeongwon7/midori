package com.midori.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.midori.domain.QnaVO;
import com.midori.domain.ReviewVO;
import com.midori.mapper.ProductMapper;

import lombok.Setter;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Setter(onMethod_ = @Autowired)
	private ProductMapper mapper;
	
	@Override
	public List<ReviewVO> reviewRead(int pseq) {
		
		return mapper.reviewList(pseq);
	}
	
	@Override
	public List<QnaVO> QnaListByProduct(int pseq) {
		return mapper.QnaListByProduct(pseq);
	}
	
}
