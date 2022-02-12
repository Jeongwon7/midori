package com.midori.domain;

import lombok.Data;

@Data
public class ProductVO {
	
	private int pseq;//상품번호
	private String name;//상품명
	private String kind;//상품종류
	private int price1;//원가
	private int price2;//판매가
	private int price3;//매출액
	private String content;//상세설명
	private String image;//상품 이미지
	private String bestyn;//베스트여부
	private String indate;//입고일
	
}
