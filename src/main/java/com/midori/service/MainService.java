package com.midori.service;

import java.util.List;

import com.midori.domain.ProductVO;

public interface MainService {
	public List<ProductVO> GetNewPro();
	public List<ProductVO> GetBestPro();
	public List<ProductVO> GetSalad();
	public List<ProductVO> getDessert();
	public List<ProductVO> GetFriedrice();
	public List<ProductVO> GetChicken();
}
