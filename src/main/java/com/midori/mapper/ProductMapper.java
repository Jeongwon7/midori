package com.midori.mapper;


import java.util.List;

import com.midori.domain.QnaVO;
import com.midori.domain.ReviewVO;

public interface ProductMapper {
	//상품뷰페이지별 리뷰리스트 출력
	public List<ReviewVO> reviewList(int pseq);
	//상품별 qna 출력
	public List<QnaVO> QnaListByProduct(int pseq);
}
