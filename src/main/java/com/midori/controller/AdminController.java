package com.midori.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.midori.domain.Criteria;
import com.midori.domain.OrderVO;
import com.midori.domain.PageVO;
import com.midori.domain.QnaVO;
import com.midori.domain.ReviewVO;
import com.midori.service.AdminService;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Controller
@RequestMapping("/adm/*")//폴더 이름 review
@AllArgsConstructor
public class AdminController {
	
	@Setter(onMethod_ = @Autowired)
	private AdminService service;
	
	@GetMapping("/cunstomlogin")
	public void customLogin(String error,String logout, Model model) {
		
	}
	
	@GetMapping("/admin")
	public void adminLoginForm() {
		
	}
	
	//어드민 홈이 될 아이입니다
	@GetMapping("/admindex")
	public void adminIndex(Model model) {
		//주문단계별 건수
		for(int i = 1; i<5; i++) {
			model.addAttribute("count"+i, service.OrderCount(i));
		}
		//상품문의 최근 6건
		List<QnaVO> qnaList = service.qnaListNew();
		//리뷰 최근 6건
		List<ReviewVO> reviewList = service.reviewListNew();
		
		//월간 판매순위 탑텐 파이그래프
		List<OrderVO> monthly10 = service.monthlyTop10();
		
		//이번주 매출액, 수익, 원가 비교 가로  막대그래프
		List<OrderVO> weekly = service.WeeklySales();
		
		int totalPrice1 = 0;
		int totalPrice2 = 0;
		int totalPrice3 = 0;
		
		for(OrderVO ovo : weekly) {
			totalPrice1 += ovo.getPrice1();
			totalPrice2 += ovo.getPrice2();
			totalPrice3 += ovo.getPrice3();
		}
		
		model.addAttribute("monthly10", monthly10);
		model.addAttribute("totalPrice1", totalPrice1);
		model.addAttribute("totalPrice2", totalPrice2);
		model.addAttribute("totalPrice3", totalPrice3);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("reviewList", reviewList);
	}
    
	@GetMapping("/adminmanager")
	public void adminManager() {
		
	}
	
	@GetMapping("/customlogin")
	public void customlogin(String error,String logout, Model model) {
		
	}
	
	@GetMapping("/adminLogout") 
	public String adminLogout() {
		 return "redirect:/";
	}
	
	//리뷰
	//리뷰 리스트
	//jsp: review.jsp
	@GetMapping("/review.do")
	public void reviewList(Model model, Criteria cri) {		
		model.addAttribute("rlist", service.GetReviewListPaging(cri));
		int total = service.getTotalReview(cri);
		model.addAttribute("pageMaker", new PageVO(cri, total));
		
	}
	//리뷰 상세페이지
	//jsp:reviewView.jsp
	@GetMapping("/reviewView.do")
	public void reviewView(@RequestParam("rbno") int rbno, Model model) {
		System.out.println("rbno: "+rbno);
		ReviewVO rvo = service.reviewSelectOne(rbno);
		model.addAttribute("rvo", rvo);
	}
	//리뷰 수정 셀렉트
	//jsp:reviewmodify.jsp
	@GetMapping("/reviewmodify.do")
	public void reviewModify(@RequestParam("rbno") int rbno, Model model) {
		System.out.println("rbno: "+rbno);
		ReviewVO rvo = service.reviewSelectOne(rbno);
		model.addAttribute("rvo", rvo);
		
	}
	//리뷰 수정
	@PostMapping("/reviewmodifypro.do")
	public String reviewModify(ReviewVO rvo) {
		System.out.println("rvo: "+rvo);
		service.reviewModify(rvo);
		return "redirect:/adm/review.do";
	}
	//리뷰 삭제
	@GetMapping("/reviewdelete.do")
	public String reviewDelete(@RequestParam("rbno") int rbno) {
		System.out.println("rbno: "+rbno);
		service.reviewDelete(rbno);
		return "redirect:/adm/review.do";
		
	}
		
		
	//상품문의
	//전체  qna 출력 -게시판 형식
	@GetMapping("/qna.do")
	public void qnaList(Model model, Criteria cri) {
		List<QnaVO> qnaList = service.GetQnaListPaging(cri);
		
		int total = service.GetTotalQuestion(cri);
		
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("pageMaker", new PageVO(cri, total));
		
	}
	//상세 qna뷰
	@GetMapping("/qnaview.do")
	public void QnaView(@RequestParam("qbno") int qbno, Model model) {
		QnaVO qvo = service.getQnaOne(qbno);
		
		String kind = qvo.getKind();
		
		if(kind.equals("1")) {
			qvo.setKind("샐러드");
		}else if(kind.equals("2")) {
			qvo.setKind("닭가슴살");
		}else if(kind.equals("3")) {
			qvo.setKind("다이어트도시락");
		}else if(kind.equals("4")) {
			qvo.setKind("샌드위치");
		}else if(kind.equals("5")) {
			qvo.setKind("프로틴");
		}else if(kind.equals("6")) {
			qvo.setKind("저칼로리간식");
		}else {
			qvo.setKind("무설탕음료");
		}
		//System.out.println("qvo: "+qvo);
		model.addAttribute("qvo", qvo);
	}
	//question 수정 폼
	@GetMapping("/questionmodify.do")
	public void questionMdofiyForm(@RequestParam("qbno") int qbno, Model model) {
		QnaVO qvo = service.getQnaOne(qbno);
		model.addAttribute("qvo", qvo);
	}
	//question 수정
	@PostMapping("/questionmodifypro.do")
	public String questionModify(QnaVO qvo) {
		service.QuestionModify(qvo);
		return "redirect:/adm/qna.do";
	}
	//question 삭제
	@GetMapping("/questiondelete.do")
	public String qeustionDelete(@RequestParam("qbno") int qbno) {
		service.QuestionDelete(qbno);
		return "redirect:/adm/qna.do";
	}
	//answer 등록 폼(상세 qna 뷰에서 답글등록 버튼 눌렀을 때 컨트롤러)
	@GetMapping("/answerwrite.do")
	public void answerWriteForm(@RequestParam("qbno") int qbno, @RequestParam("ref") int ref, Model model) {
		model.addAttribute("qbno", qbno);
		model.addAttribute("ref", ref);
		
	}
	//answer 등록(awriter form에 있어야댐)
	@PostMapping("/answerwritepro.do")
	public String answerWrite(QnaVO avo) {
		service.AnswerInsert(avo);
		service.updateStatus(avo.getQbno());//답변 등록시 스테이터스 2로 변경
		return "redirect:/adm/qna.do";
	}
	//answer 수정 폼
	@GetMapping("/answermodify.do")
	public void answerModifyForm(@RequestParam("abno") int abno, Model model) {
		QnaVO avo = service.getAnswer(abno);
		model.addAttribute("avo", avo);
		
	}
	//answer 수정(awriter form에 있어야댐)
	@PostMapping("/answermodifypro.do")
	public String answerModify(QnaVO avo) {
		service.AnswerModify(avo);
		return "redirect:/adm/qna.do";
	}
	//answer 삭제
	@GetMapping("/answerdelete")
	public String answerDelete(@RequestParam("abno") int abno, @RequestParam("qbno") int qbno) {
		service.AnswerDelete(abno);
		service.updateStatusDelete(qbno);//삭제하면 status 다시 1로
		return "redirect:/adm/qna.do";
	}
	
	
	//주문관리 전체 페이지
	@GetMapping("/orderlist.do")
	public void orderList(@RequestParam("status") int status, Model model) {
		List<OrderVO> olist = service.orderList(status);
		int count = service.OrderCount(status);
		//int Sstatus = olist.get(0).getStatus();
		
		if(status == 1) {
			model.addAttribute("title", "주문관리(입금 확인 목록)");
		}else if(status == 2) {
			model.addAttribute("title", "주문관리(배송 대기 목록)");
		}else if(status == 3) {
			model.addAttribute("title", "주문관리(배송중)");
		}else if(status == 4) {
			model.addAttribute("title", "주문관리(배송 완료)");
		}
		
		model.addAttribute("count", count);
		model.addAttribute("olist", olist);
	}
	//주문관리 상세 페이지
	@GetMapping("/orderview.do")
	public void orderView(@RequestParam("oseq") int oseq, Model model) {
		List<OrderVO> odlist = service.orderDetailList(oseq);
		
		int status = odlist.get(0).getStatus();
	
		model.addAttribute("status", status);//jsp로 보내서 choose when으로 버튼에 쓸 내용 나누기
		model.addAttribute("odlist", odlist);
		
	}
	//주문 단계별 스테이터스 처리(2의 경우 운송장까지 처리), form으로 받을 것이야
	@PostMapping("/orderstatuspro.do")
	public String orserStatus(OrderVO ovo) {//status, oseq, track
		ovo.setStatus(ovo.getStatus()+1);
		System.out.println("ovo: "+ovo);
		
		if(ovo.getTrack() != 0) {
			//System.out.println("if문 실행");
			service.orderStatusUpdate(ovo);
			service.TrackInsert(ovo);
			
		}else {
			//System.out.println("else문 실행");
			service.orderStatusUpdate(ovo);
		}
		return "redirect:/adm/orderlist.do?status="+ovo.getStatus();
	}
	
	
	
	//통계 페이지
	@GetMapping("/statistics.do")
	public void StatisticsPage(Model model) {
		//전체기간 판매량 도넛 그래프(상위 10위)
		List<OrderVO> AllSales = service.allSales();
		
		
		model.addAttribute("AllSales", AllSales);
		//오늘 판매량 TOP5 (번호, 카테고리, 상품명, 판매량)
		List<OrderVO> todayBest = service.todayBest();
		model.addAttribute("todayBest", todayBest);
		//3일간 수익 비교 막대그래프
		List<OrderVO> today = service.TodaySales();
		
		
		int totalToday1 = 0;
		int totalToday2 = 0;
		int totalToday3 = 0;
		for(OrderVO ovo : today) {
			totalToday1 += ovo.getPrice1();
			totalToday2 += ovo.getPrice2();
			totalToday3 += ovo.getPrice3();
		}
//		String toDay = today.get(0).getIndate().substring(0, 10);
//		model.addAttribute("toDay", toDay);
		model.addAttribute("totalToday1", totalToday1);
		model.addAttribute("totalToday2", totalToday2);
		model.addAttribute("totalToday3", totalToday3);
		//
		List<OrderVO> aDayAgo = service.ADayAgoSales();
		int totalAdayAgo1 = 0;
		int totalAdayAgo2 = 0;
		int totalAdayAgo3 = 0;
		for(OrderVO ovo : aDayAgo) {
			totalAdayAgo1 += ovo.getPrice1();
			totalAdayAgo2 += ovo.getPrice2();
			totalAdayAgo3 += ovo.getPrice3();
		}
		
//		String yesterday = aDayAgo.get(0).getIndate().substring(0, 10);
//		model.addAttribute("yesterday", yesterday);
		model.addAttribute("totalAdayAgo1", totalAdayAgo1);
		model.addAttribute("totalAdayAgo2", totalAdayAgo2);
		model.addAttribute("totalAdayAgo3", totalAdayAgo3);
		//
		List<OrderVO> twoDaysAgo = service.TwoDaysAgoSales();
		
		int totalTwoDaysAgo1 = 0;
		int totalTwoDaysAgo2 = 0;
		int totalTwoDaysAgo3 = 0;
		for(OrderVO ovo : twoDaysAgo) {
			totalTwoDaysAgo1 += ovo.getPrice1();
			totalTwoDaysAgo2 += ovo.getPrice2();
			totalTwoDaysAgo3 += ovo.getPrice3();
		}
//		String towDaysago = twoDaysAgo.get(0).getIndate().substring(5, 10);
//		model.addAttribute("towDaysago", towDaysago);
		model.addAttribute("totalTwoDaysAgo1", totalTwoDaysAgo1);
		model.addAttribute("totalTwoDaysAgo2", totalTwoDaysAgo2);
		model.addAttribute("totalTwoDaysAgo3", totalTwoDaysAgo3);
		//3개월간 수익 비교 막대그래프
		List<OrderVO> thisMonth = service.ThisMonthSales();
		int totalThisMonth1 = 0;
		int totalThisMonth2 = 0;
		int totalThisMonth3 = 0;
		for(OrderVO ovo : thisMonth) {
			totalThisMonth1 += ovo.getPrice1();
			totalThisMonth2 += ovo.getPrice2();
			totalThisMonth3 += ovo.getPrice3();
		}
		String month = thisMonth.get(0).getIndate().substring(5, 7)+"월";
		model.addAttribute("month", month);
		model.addAttribute("totalThisMonth1", totalThisMonth1);
		model.addAttribute("totalThisMonth2", totalThisMonth2);
		model.addAttribute("totalThisMonth3", totalThisMonth3);
		
		List<OrderVO> aMonthAgo = service.AMonthAgoSales();
		int totalAMonthAgo1 = 0;
		int totalAMonthAgo2 = 0;
		int totalAMonthAgo3 = 0;
		for(OrderVO ovo : aMonthAgo) {
			totalAMonthAgo1 += ovo.getPrice1();
			totalAMonthAgo2 += ovo.getPrice2();
			totalAMonthAgo3 += ovo.getPrice3();
		}
//		String month1 = aMonthAgo.get(0).getIndate().substring(5, 7)+"월";
//		model.addAttribute("month1", month1);
		model.addAttribute("totalAMonthAgo1", totalAMonthAgo1);
		model.addAttribute("totalAMonthAgo2", totalAMonthAgo2);
		model.addAttribute("totalAMonthAgo3", totalAMonthAgo3);
		
		List<OrderVO> twoMonthsAgo = service.TwoMonthsAgoSales();
		int totalTwoMonthsAgo1 = 0;
		int totalTwoMonthsAgo2 = 0;
		int totalTwoMonthsAgo3 = 0;
		for(OrderVO ovo : twoMonthsAgo) {
			totalTwoMonthsAgo1 += ovo.getPrice1();
			totalTwoMonthsAgo2 += ovo.getPrice2();
			totalTwoMonthsAgo3 += ovo.getPrice3();
		}
//		String month2 = twoMonthsAgo.get(0).getIndate().substring(5, 7)+"월";
//		model.addAttribute("month2", month2);
		model.addAttribute("totalTwoMonthsAgo1", totalTwoMonthsAgo1);
		model.addAttribute("totalTwoMonthsAgo2", totalTwoMonthsAgo2);
		model.addAttribute("totalTwoMonthsAgo3", totalTwoMonthsAgo3);
		//3년 단위 매출액 수익 막대그래프
		List<OrderVO> thisYear = service.ThisYearSales();
		int totalThisYear1 = 0;
		int totalThisYear2 = 0;
		int totalThisYear3 = 0;
		for(OrderVO ovo : thisYear) {
			totalThisYear1 += ovo.getPrice1();
			totalThisYear2 += ovo.getPrice2();
			totalThisYear3 += ovo.getPrice3();
		}
		String year = thisYear.get(0).getIndate().substring(0, 4);
		model.addAttribute("year", year);
		model.addAttribute("totalThisYear1", totalThisYear1);
		model.addAttribute("totalThisYear2", totalThisYear2);
		model.addAttribute("totalThisYear3", totalThisYear3);
		
		List<OrderVO> aYearAgo = service.AYearAgoSales();
		int totalAYearAgo1 = 0;
		int totalAYearAgo2 = 0;
		int totalAYearAgo3 = 0;
		for(OrderVO ovo : aYearAgo) {
			totalAYearAgo1 += ovo.getPrice1();
			totalAYearAgo2 += ovo.getPrice2();
			totalAYearAgo3 += ovo.getPrice3();
		}
//		String year1 = aYearAgo.get(0).getIndate().substring(0, 4);
//		model.addAttribute("year1", year1);
		model.addAttribute("totalAYearAgo1", totalAYearAgo1);
		model.addAttribute("totalAYearAgo2", totalAYearAgo2);
		model.addAttribute("totalAYearAgo3", totalAYearAgo3);
		
		List<OrderVO> twoYearsAgo = service.TwoYearsAgoSales();
		int totalTwoYearsAgo1 = 0;
		int totalTwoYearsAgo2 = 0;
		int totalTwoYearsAgo3 = 0;
		for(OrderVO ovo : twoYearsAgo) {
			totalTwoYearsAgo1 += ovo.getPrice1();
			totalTwoYearsAgo2 += ovo.getPrice2();
			totalTwoYearsAgo3 += ovo.getPrice3();
		}
//		String year2 = twoYearsAgo.get(0).getIndate().substring(0, 4);
//		model.addAttribute("year2", year2);
		model.addAttribute("totalTwoYearsAgo1", totalTwoYearsAgo1);
		model.addAttribute("totalTwoYearsAgo2", totalTwoYearsAgo2);
		model.addAttribute("totalTwoYearsAgo3", totalTwoYearsAgo3);
	}
}
