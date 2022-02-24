package com.midori.mapper;

import java.util.List;

import com.midori.domain.ProductVO;

public interface MainMapper {
	public List<ProductVO> getNewPro();
	public List<ProductVO> getBestPro();

}
