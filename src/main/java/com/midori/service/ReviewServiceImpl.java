package com.midori.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.midori.domain.ReviewVO;
import com.midori.mapper.ReviewMapper;

import lombok.Setter;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Setter(onMethod_ = @Autowired)
	private ReviewMapper mapper;

	@Override
	public void reviewDelete(int rbno) {
		mapper.reviewDelete(rbno);
		
	}
	
	@Override
	public void reviewInsert(ReviewVO rvo) {
		mapper.reviewInsert(rvo);
		
	}
	@Override
	public void reviewModify(ReviewVO rvo) {
		mapper.reviewModify(rvo);
		
	}
	@Override
	public ReviewVO reviewSelectOne(int rbno) {
		// TODO Auto-generated method stub
		return mapper.reviewSelectOne(rbno);
	}
}
