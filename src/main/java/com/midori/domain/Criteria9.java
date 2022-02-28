package com.midori.domain;

import lombok.Data;

@Data
public class Criteria9 {
	//페이징 필요한 변수 1)페이지 번호 2)한 페이지 레코드 개수
	private int pageNum;
	private int amount;
	
	private String type;// 제목, 내용
	private String keyword;// 검색 내용
	
	//추가 0219
	private String kind;//상품종류 검색(관리자 리뷰, 관리자 상품문의)
	//추가 0220
	private int status;
	
	public Criteria9() {
		this(1, 9);
	}
	
	
	public Criteria9(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}
}
