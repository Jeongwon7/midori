package com.midori.domain;

import lombok.Data;

@Data
public class CartVO {
	
	private int cseq;
	private String id;
	private int pseq;
	private String mname;
	private String pname;
	private int quantity;
	private int price2;
	private String indate;
	private String image;
	
	private int oseq;
}
