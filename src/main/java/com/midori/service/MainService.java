package com.midori.service;

import java.util.List;

import com.midori.domain.ProductVO;

public interface MainService {
	public List<ProductVO> GetNewPro();
	public List<ProductVO> GetBestPro();
}
