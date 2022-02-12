package com.midori.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;

import com.midori.domain.QnaVO;
import com.midori.domain.ReviewVO;
import com.midori.mapper.AdminMapper;

import lombok.Setter;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Setter(onMethod_ = @Autowired)
	private AdminMapper mapper;

	@Override
	public ReviewVO reviewSelectOne(int rbno) {
		
		return mapper.reviewSelectOne(rbno);
	}

	@Override
	public void reviewModify(ReviewVO rvo) {
		mapper.reviewModify(rvo);

	}

	@Override
	public void reviewDelete(int rbno) {
		mapper.reviewDelete(rbno);

	}

	@Override
	public List<ReviewVO> reviewList() {
		return mapper.reviewList();
	}
	
	@Override
	public List<QnaVO> qnaList() {
		return mapper.qnaList();
	}
	
	@Override
	public QnaVO getQnaOne(int qbno) {
		return mapper.getQnaOne(qbno);
	}
	
	@Override
	public void QuestionModify(QnaVO qvo) {
		mapper.QuestionModify(qvo);
		
	}
	
	@Override
	public void QuestionDelete(int qbno) {
		mapper.QuestionDelete(qbno);
		
	}
	
	@Override
	public void AnswerInsert(QnaVO avo) {
		mapper.AnswerInsert(avo);
		
	}
	
	@Override
	public void updateStatus(int qbno) {
		mapper.updateStatus(qbno);
		
	}
	
	@Override
	public QnaVO getAnswer(int abno) {
		return mapper.getAnswer(abno);
	}
	
	@Override
	public void AnswerModify(QnaVO avo) {
		mapper.AnswerModify(avo);
		
	}
	
	@Override
	public void AnswerDelete(int abno) {
		mapper.AnswerDelete(abno);
		
	}
	
	@Override
	public void updateStatusDelete(int qbno) {
		mapper.updateStatusDelete(qbno);
	}
	
}
