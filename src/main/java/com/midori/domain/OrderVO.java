package com.midori.domain;


import lombok.Data;

@Data
public class OrderVO {
	private int odseq;
	private int oseq;
	private String id;
	private String indate;
	private String mname;
	private String address1;
	private String address2;
	private String phone;
	private int pseq;
	private String pname;
	private String image;
	private int quantity;
	private int price1;
	private int price2;
	private int price3;
	private int status;
	private int track;//운송장번호
	private String oname;//받는 사람 이름
	private String zip_num;
	
	//통계 때문에 추가된 멤버변수
	private int sales_count; //판매량
	private String kind;
	
	//관리자
	//1: 입금 확인 대기 2: 배송대기
	//3: 배송중 4: 배송완료
	
	//유저
	//1: 입금확인 2: 배송준비 
	//3: 베송중/구매확정 4: 배송완료/리뷰작성
	
	private int cseq;
	
}
