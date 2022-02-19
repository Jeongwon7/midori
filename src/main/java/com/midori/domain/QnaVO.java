package com.midori.domain;

import lombok.Data;

@Data
public class QnaVO {
	private int ref;
	private int qbno;
	private int pseq;
	private String qtitle;
	private String qcontent;
	private String qwriter;
	private String qregdate;
	private int category;//1:상품문의 2:배송문의 3:기타문의
	private int status;//기본값 1:답변대기 2: 답변 완료
	private boolean secret;// 0:false 공개글 1:true 비밀글
	
	private int abno;
	private String atitle;
	private String acontent;
	private String awriter;
	private String aregdate;
	
	//추가(0219)
	private String kind;
	private String pname;
	
}
