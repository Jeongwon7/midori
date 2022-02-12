package com.midori.domain;

import lombok.Data;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageVO {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int total;//전체 레코드 개수
	private Criteria cri;
	
	 public PageVO(Criteria cri, int total) {
	      this.cri = cri;
	      this.total=total;
	      this.endPage = (int)(Math.ceil(cri.getPageNum() /10.0)*10);//Math.ceil 올림
	      this.startPage = this.endPage - 9;
	      int realEnd = (int)(Math.ceil((total * 1.0)/cri.getAmount()));
	      if(realEnd < this.endPage) {
	    	  this.endPage = realEnd;
	      }
	      this.prev = this.startPage >1;
	      this.next = this.endPage < realEnd;
	      
	 }
}
