package com.midori.service;

import java.util.List;

import com.midori.domain.Criteria;
import com.midori.domain.NoticeVO;

public interface NoticeService {

	
	public void register(NoticeVO notice);
	public List<NoticeVO> getList();
	public int getTotal(Criteria cri);
	public List<NoticeVO> getListWithPaging(Criteria cri);
	public NoticeVO read(int bno);
	public boolean update(NoticeVO notice);
	public boolean delete(int bno);
	public NoticeVO nextPage(int bno);
	public NoticeVO prevPage(int bno);
}
