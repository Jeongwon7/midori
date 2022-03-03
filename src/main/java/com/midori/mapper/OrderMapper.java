package com.midori.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.midori.domain.CartVO;
import com.midori.domain.MemberVO;
import com.midori.domain.OrderVO;
import com.midori.domain.ProductVO;

public interface OrderMapper {
	//pseq로 product 테이블 select
	public ProductVO productSelect(int pseq);
	//orders 테이블  insert(oseq, id, oname, phone, zip_num, address1, address2) 
	public void orderInsert(OrderVO ovo);
	//oseq 최대값 
	public int getMaxOseq();
	//order_detail 테이블 insert(odseq, oseq, pseq, quantity)
	public void orderDetailInsert(CartVO cvo);
	//id로 member 테이블 select
	public MemberVO memberSelect(String id);
	//카트리스트
	public List<CartVO> getCartList(String id);
	//카트 result 업데이트
	public void cartResultUpdate(int cseq);
	//주문 목록
	public List<Integer> orderListing(@Param("id") String id);
	public List<Integer> selectSeqOrdering(@Param("id") String id); 
	public List<OrderVO> listOrderByID(@Param("id") String id, @Param("status") String status, @Param("oseq") int oseq);
}
