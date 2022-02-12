package com.midori.service;

import java.util.List;

import com.midori.domain.QnaVO;

public interface QnaService {
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
