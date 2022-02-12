package com.midori.domain;

import lombok.Data;

@Data
public class ReviewVO {
	private int rbno;
	private int pseq;
	private String writer;
	private String title;
	private String content;
	private int star;
	private String regdate;
}
