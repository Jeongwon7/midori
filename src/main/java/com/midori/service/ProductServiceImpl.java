package com.midori.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.midori.domain.Criteria;
import com.midori.domain.ProductVO;
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
	
	@Override
	public void register(ProductVO product) {
		mapper.insertProduct(product);
	}
	
	@Override
	public List<ProductVO> getProductAll(Criteria cri) {
		return mapper.selectProduct(cri);
	}

	@Override
	public int getTotalProduct(Criteria cri) {
		return mapper.getTotalProduct(cri);
	}
	
	@Override
	public boolean productUpdate(ProductVO product) {
		return mapper.productUpdate(product) == 1; 
	}
	
	@Override
	public boolean productDelete(int pseq) {
		return mapper.productDelete(pseq) == 1;
	}
	
	@Override
	public ProductVO selectOneProduct(int pseq) {
		return mapper.selectOneProduct(pseq);
	}
	
	@Override
	   public ProductVO getProductOne(int pseq) {
	      return mapper.selectProductOne(pseq);
	}
}
