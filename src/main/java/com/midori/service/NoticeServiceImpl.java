package com.midori.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.midori.domain.Criteria;
import com.midori.domain.NoticeVO;
import com.midori.mapper.NoticeMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService {

	
	@Setter(onMethod_ = @Autowired)
	private NoticeMapper mapper;
	
	@Override
	public void register(NoticeVO notice) {
		mapper.insertSelectKey(notice);
	}
	
	@Override
	public List<NoticeVO> getList() {	
		return mapper.getList();
	}
	
	@Override
	public NoticeVO read(int bno) {
		mapper.readCount(bno);
		return mapper.read(bno);
	}

	@Override
	public boolean update(NoticeVO notice) {
		return mapper.update(notice) == 1;
	}
	
	@Override
	public boolean delete(int bno) {
		return mapper.delete(bno) == 1;
	}
	
	@Override
	public List<NoticeVO> getListWithPaging(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}
	
	@Override
	public NoticeVO nextPage(int bno) {
		return mapper.nextPage(bno);
	}
	
	@Override
	public NoticeVO prevPage(int bno) {
		return mapper.prevPage(bno);
	}
}
