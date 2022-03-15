package com.midori.service;

import java.util.List;

import com.midori.domain.Criteria;
import com.midori.domain.Criteria9;
import com.midori.domain.ProductVO;
import com.midori.domain.QnaVO;
import com.midori.domain.ReviewVO;

public interface ProductService {
	//상품별 리뷰 리스트
	public List<ReviewVO> reviewRead(int pseq);
	//상품별 qna 리스트
	public List<QnaVO> QnaListByProduct(int pseq);
	//프로덕트 뷰
	public ProductVO getProductOne(int pseq);
	
	//admin
	//상품 등록
	public void register(ProductVO product);
	//상품 리스트
	public List<ProductVO> getProductAll(Criteria cri);
	//상품 건수
	public int getTotalProduct(Criteria cri);
	//상품 수정
	public boolean productUpdate(ProductVO product);
	//상품 수정 폼에 데이터
	public ProductVO selectOneProduct(int pseq);
	//상품 삭제
	public boolean productDelete(int pseq);
	
	//상품 리스트 페이지
	public List<ProductVO> getProductListWithPaging(Criteria9 cri);
	public int getTotalCount(Criteria9 cri);
	
	public int getNewProductCount(Criteria9 cri);
	public int getBestProductCount(Criteria9 cri);
	
}
