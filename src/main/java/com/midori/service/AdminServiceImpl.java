package com.midori.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.midori.domain.Criteria;
import com.midori.domain.MemberVO;
import com.midori.domain.OrderVO;
import com.midori.domain.QnaVO;
import com.midori.domain.ReviewVO;
import com.midori.mapper.AdminMapper;

import lombok.Setter;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Setter(onMethod_ = @Autowired)
	private AdminMapper mapper;
	
	@Override
	public List<OrderVO> monthlyTop10() {
		List<OrderVO> mlist = mapper.monthlyTop10Pie();
		return mlist;
	}
	
	@Override
	public List<OrderVO> WeeklySales() {
		List<OrderVO> wlist = mapper.weeklySales();
		return wlist;
	}
	
	@Override
	public List<QnaVO> qnaListNew() {
		return mapper.QnaListNew();
	}
	
	@Override
	public List<ReviewVO> reviewListNew() {
		return mapper.ReviewListNew();
	}
	
	

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
	public List<ReviewVO> GetReviewListPaging(Criteria cri) {
		return mapper.getReviewListPaging(cri);
	}
	
	@Override
	public int getTotalReview(Criteria cri) {
		return mapper.getTotalReview(cri);
	}
	
	
	@Override
	public List<QnaVO> GetQnaListPaging(Criteria cri) {
		return mapper.getQnaListPaging(cri);
	}
	
	@Override
	public int GetTotalQuestion(Criteria cri) {
		return mapper.getTotalQuestion(cri);
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
	
	@Override
	public List<OrderVO> orderDetailList(int oseq) {
		return mapper.orderDetailList(oseq);
	}
	
	@Override
	public List<OrderVO> orderList(int status) {
		return mapper.orderList(status);
	}
	
	@Override
	public List<OrderVO> OrderListWithPaging(Criteria cri, int status) {
		return mapper.orderListWithPaging(cri, status);
	}
	
	@Override
	public List<Integer> OseqListPaging(Criteria cri) {
		return mapper.oseqListPaging(cri);
	}
	
	@Override
	public void orderStatusUpdate(OrderVO ovo) {
		mapper.orderStatusUpdate(ovo);
	}
	
	@Override
	public void TrackInsert(OrderVO ovo) {
		mapper.TrackInsert(ovo);
	}
	
	@Override
	public int OrderCount(int status) {
		return mapper.OrderCount(status);
	}
	
	
	//통계
	
	@Override
	public List<OrderVO> ADayAgoSales() {
		return mapper.aDayAgoSales();
	}
	
	@Override
	public List<OrderVO> allSales() {
		return mapper.AllSales();
	}
	
	@Override
	public List<OrderVO> AMonthAgoSales() {
		return mapper.aMonthAgoSales();
	}
	
	@Override
	public List<OrderVO> AYearAgoSales() {
		return mapper.aYearAgoSales();
	}
	
	@Override
	public List<OrderVO> ThisMonthSales() {
		return mapper.thisMonthSales();
	}
	@Override
	public List<OrderVO> ThisYearSales() {
		return mapper.thisYearSales();
	}
	@Override
	public List<OrderVO> todayBest() {
		return mapper.TodayBest();
	}
	@Override
	public List<OrderVO> TodaySales() {
		return mapper.todaySales();
	}
	
	@Override
	public List<OrderVO> TwoDaysAgoSales() {
		return mapper.twoDaysAgoSales();
	}
	
	@Override
	public List<OrderVO> TwoMonthsAgoSales() {
		return mapper.twoMonthsAgoSales();
	}
	
	@Override
	public List<OrderVO> TwoYearsAgoSales() {
		return mapper.twoYearsAgoSales();
	}
	//통계 끝
	
	
	//회원관리
    public List<MemberVO> GetMemberWithPaging(Criteria cri){
       return mapper.getMemberWithPaging(cri);
    }
    public int GetTotalMember(Criteria cri) {
       return mapper.getTotalMember(cri);
    }
    public boolean AdmMemberDelete(String id) {
        return mapper.admMemberDelete(id); 
    }
	
}
