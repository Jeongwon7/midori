package com.midori.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.midori.domain.ProductVO;
import com.midori.mapper.MainMapper;

import lombok.Setter;

@Service
public class MainServiceImpl implements MainService {
	
	@Setter(onMethod_ = @Autowired)
	private MainMapper mapper;

	@Override
	public List<ProductVO> GetNewPro() {
		return mapper.getNewPro();
	}

	@Override
	public List<ProductVO> GetBestPro() {
		return mapper.getBestPro();
	}

}
