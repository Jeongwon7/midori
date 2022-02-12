package com.midori.mapper;


import com.midori.domain.QnaVO;

public interface QnaMapper {
	
	//유저-상품뷰페이지
	//ref 만드는 함수 -컨트롤러에서 +1해서 vo에 set하기
	public int getRef();
	//questiion 등록
	public void questionInsert(QnaVO qvo);
	
	//question 수정시 셀렉트
	public QnaVO getQuestion(int qbno);
	//question 수정
	public void questionModify(QnaVO qvo);
	//question 삭제 - 비동기식
	public void questionDelete(int qbno);

	
}
