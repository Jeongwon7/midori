package com.midori.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageVO9 {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int total;//전체 레코드 개수
	private Criteria9 cri9;
	
	 public PageVO9(Criteria9 cri9, int total) {
	      this.cri9 = cri9;
	      this.total=total;
	      this.endPage = (int)(Math.ceil(cri9.getPageNum() /10.0)*10);//Math.ceil 올림
	      this.startPage = this.endPage - 9;
	      int realEnd = (int)(Math.ceil((total * 1.0)/cri9.getAmount()));
	      if(realEnd < this.endPage) {
	    	  this.endPage = realEnd;
	      }
	      this.prev = this.startPage >1;
	      this.next = this.endPage < realEnd;
	      
	 }
}
