package com.midori.mapper;

import java.util.List;

import com.midori.domain.Criteria;
import com.midori.domain.NoticeVO;

public interface NoticeMapper {
	
	//노티스 등록
	public void insertSelectKey(NoticeVO notice);
	//노티스 리스트
	public List<NoticeVO> getList();
	//총 게시글수
	public int getTotalCount(Criteria cri);
	//노티스 리스트 페이징
	public List<NoticeVO> getListWithPaging(Criteria cri);
	//노티스뷰, 수정폼
	public NoticeVO read(int bno);
	//노티스 수정
	public int update(NoticeVO notice);
	//노티스 딜리트
	public int delete(int bno);
	//조회수
	public void readCount(int bno);
	//다음글
	public NoticeVO nextPage(int bno);
	//이전글
	public NoticeVO prevPage(int bno);

}
