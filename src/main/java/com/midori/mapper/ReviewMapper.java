package com.midori.mapper;

import com.midori.domain.ReviewVO;

public interface ReviewMapper {
	//리뷰 등록
	public void reviewInsert(ReviewVO rvo);
	//리뷰 수정 - 출력
	public ReviewVO reviewSelectOne(int rbno);
	//리뷰 수정
	public void reviewModify(ReviewVO rvo);
	//리뷰 삭제
	public void reviewDelete(int rbno);
}
