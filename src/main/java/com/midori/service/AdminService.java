package com.midori.service;

import java.util.List;

import com.midori.domain.QnaVO;
import com.midori.domain.ReviewVO;

public interface AdminService {
		//리뷰 수정시 출력, 리뷰 상세 출력
		public ReviewVO reviewSelectOne(int rbno);
		//리뷰 수정
		public void reviewModify(ReviewVO rvo);
		//리뷰 삭제
		public void reviewDelete(int rbno);
		
		//관리자
		//리뷰 리스트 출력
		public List<ReviewVO> reviewList();
		
		//상품문의
		//전체  qna 출력 -게시판 형식
		public List<QnaVO> qnaList();
		//상세 qna뷰, question 수정 페이지
		public QnaVO getQnaOne(int qbno);
		//question 수정
		public void QuestionModify(QnaVO qvo);
		//question 삭제
		public void QuestionDelete(int qbno);
		//answer 등록
		public void AnswerInsert(QnaVO avo);
		//answer 등록시 status 변경
		public void updateStatus(int qbno);
		//answer 수정 페이지
		public QnaVO getAnswer(int abno);
		//answer 수정
		public void AnswerModify(QnaVO avo);
		//answer 삭제
		public void AnswerDelete(int abno);
		//answer 삭제시 status 변경
		public void updateStatusDelete(int qbno);
}
