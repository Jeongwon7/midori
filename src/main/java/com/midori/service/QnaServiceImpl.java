package com.midori.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.midori.domain.QnaVO;
import com.midori.mapper.QnaMapper;

import lombok.Setter;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Setter(onMethod_ = @Autowired)
	private QnaMapper mapper;

	@Override
	public int getRef() {
		
		return mapper.getRef();
	}

	@Override
	public void questionInsert(QnaVO qvo) {
		mapper.questionInsert(qvo);

	}


	@Override
	public QnaVO getQuestion(int qbno) {
		return mapper.getQuestion(qbno);
	}

	@Override
	public void questionModify(QnaVO qvo) {
		mapper.questionModify(qvo);

	}

	@Override
	public void questionDelete(int qbno) {
		mapper.questionDelete(qbno);

	}

}
