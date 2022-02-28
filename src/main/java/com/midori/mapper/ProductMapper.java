package com.midori.mapper;


import java.util.List;

import com.midori.domain.Criteria;
import com.midori.domain.Criteria9;
import com.midori.domain.ProductVO;
import com.midori.domain.QnaVO;
import com.midori.domain.ReviewVO;

public interface ProductMapper {
	//상품뷰페이지별 리뷰리스트 출력
	public List<ReviewVO> reviewList(int pseq);
	//상품별 qna 출력
	public List<QnaVO> QnaListByProduct(int pseq);

	//product view
    public ProductVO selectProductOne(int pseq);
	
	//admin
	//상품 등록
	public void insertProduct(ProductVO product);
	//상품리스트
	public List<ProductVO> selectProduct(Criteria cri);
	//상품 건수
	public int getTotalProduct(Criteria cri);
	//상품 수정
	public int productUpdate(ProductVO product);
	//상품 수정 폼에 보여줄 데이터
	public ProductVO selectOneProduct(int pseq);
	//상품 삭제
	public int productDelete(int pseq);
	
	//상품리스트 페이지
	public List<ProductVO> getProductListWithPaging(Criteria9 cri);
    public int getTotalCount(Criteria9 cri);
}
