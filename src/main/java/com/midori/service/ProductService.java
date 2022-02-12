package com.midori.service;

import java.util.List;

import com.midori.domain.QnaVO;
import com.midori.domain.ReviewVO;

public interface ProductService {
	//상품별 리뷰 리스트
	public List<ReviewVO> reviewRead(int pseq);
	//상품별 qna 리스트
	public List<QnaVO> QnaListByProduct(int pseq);
		
}
