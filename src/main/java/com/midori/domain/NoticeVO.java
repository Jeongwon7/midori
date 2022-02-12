package com.midori.domain;

import lombok.Data;

@Data
public class NoticeVO {
	private int bno;
	private String title;
	private String content;
	private String writer;
	private String regdate;
	private int viewcount;
	
}
