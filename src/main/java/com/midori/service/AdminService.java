package com.midori.service;

import java.util.List;

import com.midori.domain.Criteria;
import com.midori.domain.MemberVO;
import com.midori.domain.OrderVO;
import com.midori.domain.QnaVO;
import com.midori.domain.ReviewVO;

public interface AdminService {
		//관리자 홈
		//count 메서드는 주문관리 쪽꺼를 공유
		//월간 판매순위 탑텐 파이그래프
		public List<OrderVO> monthlyTop10();
		//이번주 매출액, 수익, 원가 비교 가로  막대그래프
		public List<OrderVO> WeeklySales();
		//상품문의 최근 6건
		public List<QnaVO> qnaListNew();
		//리뷰 최근 6건
		public List<ReviewVO> reviewListNew();
	
	
	
		//리뷰 수정시 출력, 리뷰 상세 출력
		public ReviewVO reviewSelectOne(int rbno);
		//리뷰 수정
		public void reviewModify(ReviewVO rvo);
		//리뷰 삭제
		public void reviewDelete(int rbno);
		
		//관리자
		//리뷰 리스트 출력
		public List<ReviewVO> GetReviewListPaging(Criteria cri);
		//리뷰 총 건수
		public int getTotalReview(Criteria cri);
		
		
		
		//상품문의
		//전체  qna 출력 -게시판 형식
		public List<QnaVO> GetQnaListPaging(Criteria cri);
		//qna 총 건수
		public int GetTotalQuestion(Criteria cri);
		//상세 qna뷰, question 수정 페이지
		public QnaVO getQnaOne(int qbno);
		//question 수정
		public void QuestionModify(QnaVO qvo);
		//question 삭제
		public void QuestionDelete(int qbno);
		//answer 등록
		public void AnswerInsert(QnaVO avo);
		//answer 등록시 status 변경
		public void updateStatus(int qbno);
		//answer 수정 페이지
		public QnaVO getAnswer(int abno);
		//answer 수정
		public void AnswerModify(QnaVO avo);
		//answer 삭제
		public void AnswerDelete(int abno);
		//answer 삭제시 status 변경
		public void updateStatusDelete(int qbno);
		
		//주문관리 전체 조회, 헤더 주소에 status 값을 각각 줘,그걸 컨트롤러 값으로 받아서 메서드 매개변수로 넣기
		public List<OrderVO> orderList(int status);
		public List<OrderVO> OrderListWithPaging(Criteria cri, int status);
		//주문번호 리스트(상품명 ~외 ~건 처리)
		public List<Integer> OseqListPaging(Criteria cri);
		//주문관리 상세 조회
		public List<OrderVO> orderDetailList(int oseq);
		//주문관리 단계 status 값 변경, jsp에서 각 단계별 버튼에 form으로 status값과 oseq 값을 보내고 status+1한 값을 메서드 매개변수로 넣기
		public void orderStatusUpdate(OrderVO ovo);
		//운송장 번호 입력
		public void TrackInsert(OrderVO ovo);
		//주문관리 건수
		public int OrderCount(int status);
		
		//회원관리
        public List<MemberVO> GetMemberWithPaging(Criteria cri);
        public int GetTotalMember(Criteria cri);
        public boolean AdmMemberDelete(String id);
		
		//통계페이지
		//전체상품 판매량 통계 도넛 그래프
		public List<OrderVO> allSales();
		//오늘 판매량 TOP5 (번호, 카테고리, 상품명, 판매량)
		public List<OrderVO> todayBest();
		//3일간 수익 비교 막대그래프
		public List<OrderVO> TodaySales();
		public List<OrderVO> ADayAgoSales();
		public List<OrderVO> TwoDaysAgoSales();
		//3개월간 수익 비교 막대그래프
		public List<OrderVO> ThisMonthSales();
		public List<OrderVO> AMonthAgoSales();
		public List<OrderVO> TwoMonthsAgoSales();
		//3년 단위 매출액 수익 막대그래프
		public List<OrderVO> ThisYearSales();
		public List<OrderVO> AYearAgoSales();
		public List<OrderVO> TwoYearsAgoSales();
}
