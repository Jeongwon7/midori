package com.midori.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.midori.domain.Criteria;
import com.midori.domain.NoticeVO;
import com.midori.domain.OrderVO;
import com.midori.domain.PageVO;
import com.midori.domain.ProductVO;
import com.midori.domain.QnaVO;
import com.midori.domain.ReviewVO;
import com.midori.service.AdminService;
import com.midori.service.MainService;
import com.midori.service.NoticeService;
import com.midori.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/adm/*")//폴더 이름 review
@AllArgsConstructor
@Log4j
public class AdminController {
	
	@Setter(onMethod_ = @Autowired)
	private AdminService service;
	
	@Setter(onMethod_ = @Autowired)
	private MainService Mservice;
	   
    @Setter(onMethod_ = @Autowired)
    private ProductService Pservice;
    
    @Setter(onMethod_ = @Autowired)
    private NoticeService Nservice;
    
    
	//어드민 홈
	@GetMapping("/admindex.do")
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
		
		//totalPrice들은 주간 매출(매출액, 원가, 수익)
		model.addAttribute("totalPrice1", totalPrice1);
		model.addAttribute("totalPrice2", totalPrice2);
		model.addAttribute("totalPrice3", totalPrice3);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("reviewList", reviewList);
	}
    
    
    
    //고객관리
    @GetMapping("/member/admmember")
    public void admMember(Model model,Criteria cri) {
    	System.out.println("cri: "+cri);
       model.addAttribute("list",service.GetMemberWithPaging(cri));
       int total = service.GetTotalMember(cri);
       model.addAttribute("pageMaker", new PageVO(cri, total));
    }
    @GetMapping("/member/admmemberdelete")
    public String admMemberDelete(String id, RedirectAttributes rttr) {
       if(service.AdmMemberDelete(id)) {
          rttr.addFlashAttribute("result","success");
       }
       return "redirect:/adm/member/admmember.do";
    }
    
    
    //공지사항
    //노티스 게시판
    @GetMapping("/notice/admnotice")
    public void adminNotice(Criteria cri,Model model) {
       model.addAttribute("list",Nservice.getListWithPaging(cri));
       int total = Nservice.getTotal(cri);
       model.addAttribute("pageMaker", new PageVO(cri, total));
    }
    
    //노티스뷰, 수정폼
    @GetMapping({"/notice/admnoticeview", "/notice/admnoticemodify"})
    public void readNotice(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri,  Model model) {

       model.addAttribute("nvo",Nservice.read(bno));
       model.addAttribute("nextVO", Nservice.nextPage(bno));
       model.addAttribute("prevVO", Nservice.prevPage(bno));
     }
    
    //노티스 수정
    @PostMapping("/notice/admnoticemodifypro.do")
    public String modify(NoticeVO notice, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
       if(Nservice.update(notice)) { 
          rttr.addFlashAttribute("result","success");
       }
       rttr.addAttribute("pageNum",cri.getPageNum());
       rttr.addAttribute("amount",cri.getAmount());
       return "redirect:/adm/notice/admnotice.do";
    }
    
    //노티스 등록 폼
    @GetMapping("/notice/admnoticewrite")
    //@PreAuthorize("isAuthenticated()") //로그인이 성공한 사용자만이 글쓰기 할 수 있다
    public void noticeWrite() {
       
    }
    
    //노티스 등록
    @PostMapping("/notice/admnoticewritepro.do")
    public String noticeList(NoticeVO notice, RedirectAttributes rttr) {
       Nservice.register(notice);
       rttr.addFlashAttribute("result",notice.getBno());
       return "redirect:/adm/notice/admnotice.do";
    }
    
    //노티스 삭제
    @GetMapping("/notice/admnoticedelete")
    public String delete(@RequestParam("bno") int bno, RedirectAttributes rttr) {
       if(Nservice.delete(bno)) {
          rttr.addFlashAttribute("result","success");
       }
       return "redirect:/adm/notice/admnotice.do";
    } 
    
  
    
	
	@GetMapping("/cunstomlogin")
	public void customLogin(String error,String logout, Model model) {
		
	}
	
	@GetMapping("/admin")
	public void adminLoginForm() {
		
	}
	
    @GetMapping("/adminLogout")
     public String adminLogout() {
        return "redirect:/";
    }
	
	
	//상품관리
	  @GetMapping("/product/productlist.do")
	   public void adminManager(Model model, Criteria cri) {
		  System.out.println("cri: "+cri);
	      List<ProductVO> list = Pservice.getProductAll(cri);
	      
	      int total = Pservice.getTotalProduct(cri);
	      
	      model.addAttribute("list",list);
	      model.addAttribute("pageMaker", new PageVO(cri,total));
	   }
	   
	   @GetMapping("/product/productModify.do")
	   public void read(@RequestParam("pseq") int pseq, Criteria cri, Model model) { 
	      //System.out.println(Pservice.selectOneProduct(pseq));
	      ProductVO pvo = Pservice.selectOneProduct(pseq);
	      String[] kind = {"모든제품","샐러드","닭가슴살","다이어트 도시락","샌드위치","프로틴","저칼로리 간식","무설탕 음료"};
	      //System.out.println("kind"+kind);
	      model.addAttribute("kindList", kind);
	      model.addAttribute("view", Pservice.selectOneProduct(pseq));
	   }
	   
	   @PostMapping("/product/productModify.do")
	   public String modify(ProductVO product, Criteria cri, RedirectAttributes rttr,@RequestParam("uploadFile") MultipartFile upload) {
	      String uploadFolder = "c:\\upload";
	     // System.out.println("product: "+product);
	      
	      log.info("file name : "+upload.getOriginalFilename());
	      log.info("file size : "+upload.getSize());
	      
	      String uploadFileName = upload.getOriginalFilename(); 
	      
	      //ie
	      uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("//")+1);
	      log.info("ie only file name : "+uploadFileName);
	      
	      
	      UUID uuid = UUID.randomUUID(); 
	      uploadFileName = uuid.toString()+"_"+uploadFileName; 
	      log.info("uuid : "+uploadFileName);
	      
	      File uploadPath = new File(uploadFolder, getFolder());
	      log.info("upload path :"+uploadPath);
	      
	      if(uploadPath.exists() == false) {
	         uploadPath.mkdirs();
	      }
	      
	      File saveFile = new File(uploadPath,uploadFileName); 
	      log.info("save file :"+saveFile);
	      String saveURL = saveFile.toString().substring(10); 
	      log.info("save url : "+ saveURL);
	      
	      try {
	         upload.transferTo(saveFile); 
	         product.setImage(saveURL);
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	      
	 //     System.out.println("dsklhjosdfj");
	      if(Pservice.productUpdate(product)) {
	 //        System.out.println("lsdkhslssdsdsssssssss");
	         rttr.addAttribute("result", "success");
	 //        System.out.println("sdlkjhso;hsf");
	      }
	      rttr.addAttribute("pageNum",cri.getPageNum());
	      rttr.addAttribute("amount", cri.getAmount());
	      return "redirect:/adm/product/productlist.do";
	   }
	   
	   @GetMapping("/product/productWrite.do")
	   public void productWriteForm(Model model) {
	      String[] kind = {"모든제품","샐러드","닭가슴살","다이어트 도시락","샌드위치","프로틴","저칼로리 간식","무설탕 음료"};
	      model.addAttribute("kindList", kind);
	   }
	   
	   private String getFolder() {
	      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	      Date date = new Date();
	      String str = sdf.format(date);
	      
	      return str.replace("-", File.separator);
	   }
	   
	   @PostMapping("/admin_product_write.do")
	   public String productWrite(ProductVO product, @RequestParam("uploadFile") MultipartFile upload) {
		//   System.out.println("product: "+product);
	      
	      String uploadFolder = "c:\\upload";
	      
	      log.info("file name : "+upload.getOriginalFilename());
	      log.info("file size : "+upload.getSize());
	      
	      String uploadFileName = upload.getOriginalFilename(); 
	      
	      //ie
	      uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("//")+1);
	      log.info("ie only file name : "+uploadFileName);
	      
	      
	      UUID uuid = UUID.randomUUID(); 
	      uploadFileName = uuid.toString()+"_"+uploadFileName; 
	      log.info("uuid : "+uploadFileName);
	      
	      File uploadPath = new File(uploadFolder, getFolder());
	      log.info("upload path :"+uploadPath);
	      
	      if(uploadPath.exists() == false) {
	         uploadPath.mkdirs();
	      }
	      
	      File saveFile = new File(uploadPath,uploadFileName); 
	      log.info("save file :"+saveFile);
	      String saveURL = saveFile.toString().substring(10); 
	      log.info("save url : "+ saveURL);
	      
	      try {
	         upload.transferTo(saveFile); 
	         product.setImage(saveURL);
	         Pservice.register(product);
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	      
	      return "redirect:/adm/product/productlist.do";
	      
	   }
	   
	   @GetMapping("/productDelete.do")
	   public String productDelete(@RequestParam("pseq") int pseq, RedirectAttributes rttr) {
	 //     System.out.println("lsdkjf "+pseq);
	      if(Pservice.productDelete(pseq)) {
	         rttr.addAttribute("result", "success");
	      }
	      return "redirect:/adm/product/productlist.do";
	      
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

	//리뷰 삭제
	@GetMapping("/reviewdelete.do")
	public String reviewDelete(@RequestParam("rbno") int rbno) {
	//	System.out.println("rbno: "+rbno);
		service.reviewDelete(rbno);
		return "redirect:/adm/review.do";
		
	}
	
	@GetMapping("/reviewdeleteindex.do")
	public String reviewDeleteIndex(@RequestParam("rbno") int rbno) {
	//	System.out.println("rbno: "+rbno);
		service.reviewDelete(rbno);
		return "redirect:/adm/admindex.do";
		
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
		return "redirect:/adm/qnaview.do?qbno="+avo.getQbno();
	}
	//answer 수정 폼
	@GetMapping("/answermodify.do")
	public void answerModifyForm(@RequestParam("abno") int abno, @RequestParam("qbno") int qbno, Model model) {
		QnaVO avo = service.getAnswer(abno);
		model.addAttribute("avo", avo);
		
	}
	//answer 수정(awriter form에 있어야댐)
	@PostMapping("/answermodifypro.do")
	public String answerModify(QnaVO avo) {
		service.AnswerModify(avo);
		return "redirect:/adm/qnaview.do?qbno="+avo.getQbno();
	}
	//answer 삭제
	@GetMapping("/answerdelete.do")
	public String answerDelete(@RequestParam("abno") int abno, @RequestParam("qbno") int qbno) {
		service.AnswerDelete(abno);
		service.updateStatusDelete(qbno);//삭제하면 status 다시 1로
		return "redirect:/adm/qnaview.do?qbno="+qbno;
	}
	
	
	//주문관리 전체 페이지
	@GetMapping("/orderlist.do")
	public void orderList(Criteria cri , Model model) {
		
		List<Integer> oseqlist = service.OseqListPaging(cri);
	//	System.out.println("oseqlist: "+oseqlist);
		
		List<OrderVO> olist = new ArrayList<OrderVO>();
		
		for(int oseq : oseqlist) {
			List<OrderVO> orderList = service.orderDetailList(oseq);
			OrderVO orderVO = orderList.get(0);
			if(orderList.size() > 1) {
				orderVO.setPname(orderVO.getPname()+" 외 "+(orderList.size()-1)+" 건");
			}
			olist.add(orderVO);
		}
		
		int status = cri.getStatus();
		int total = service.OrderCount(status);
		
		if(status == 1) {
			model.addAttribute("title", "주문관리(입금 확인)");
		}else if(status == 2) {
			model.addAttribute("title", "주문관리(배송 대기)");
		}else if(status == 3) {
			model.addAttribute("title", "주문관리(배송중)");
		}else if(status == 4) {
			model.addAttribute("title", "주문관리(배송 완료)");
		}
		
		model.addAttribute("status", status);
		model.addAttribute("olist", olist);
		model.addAttribute("pageMaker", new PageVO(cri, total));
	}
	//주문관리 상세 페이지
	@GetMapping("/orderview.do")
	public void orderView(@RequestParam("oseq") int oseq, Model model) {
		List<OrderVO> odlist = service.orderDetailList(oseq);
		
		OrderVO od = odlist.get(0);
		
		int totalPrice = 0;//주문당 총액 구하기
		for(OrderVO ovo : odlist) {
			totalPrice += ovo.getPrice2()*ovo.getQuantity();
		}
		
		int status = odlist.get(0).getStatus();
		
		System.out.println("totalPrice: "+totalPrice);
		System.out.println("status: "+status);
		System.out.println("odlist: "+odlist);
		System.out.println("od: "+od);
		
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("status", status);//jsp로 보내서 choose when으로 버튼에 쓸 내용 나누기
		model.addAttribute("odlist", odlist);
		model.addAttribute("od", od);
	}
	//주문 단계별 스테이터스 처리(2의 경우 운송장까지 처리), form으로 받을 것이야
	@PostMapping("/orderstatuspro.do")
	public String orserStatus(OrderVO ovo) {//status, oseq, track
		System.out.println("ovo: "+ovo);
		int status = ovo.getStatus();
		ovo.setStatus(status+1);

		
		if(ovo.getTrack() != 0) {
			System.out.println("if문 실행");
			service.orderStatusUpdate(ovo);
			service.TrackInsert(ovo);
			
		}else {
			System.out.println("else문 실행");
			service.orderStatusUpdate(ovo);
		}
		return "redirect:/adm/orderlist.do?status="+status;
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
		System.out.println("tb: "+todayBest);
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
		String toDay = today.get(0).getIndate().substring(5, 10);
		model.addAttribute("toDay", toDay);
		model.addAttribute("totalToday1", totalToday1);
		model.addAttribute("totalToday2", totalToday2);
		model.addAttribute("totalToday3", totalToday3);
		
		List<OrderVO> aDayAgo = service.ADayAgoSales();
		int totalAdayAgo1 = 0;
		int totalAdayAgo2 = 0;
		int totalAdayAgo3 = 0;
		for(OrderVO ovo : aDayAgo) {
			totalAdayAgo1 += ovo.getPrice1();
			totalAdayAgo2 += ovo.getPrice2();
			totalAdayAgo3 += ovo.getPrice3();
		}
		
		String yesterday = aDayAgo.get(0).getIndate().substring(5, 10);
		model.addAttribute("yesterday", yesterday);
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
		String towDaysago = twoDaysAgo.get(0).getIndate().substring(5, 10);
		model.addAttribute("towDaysago", towDaysago);
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
		String month1 = aMonthAgo.get(0).getIndate().substring(5, 7)+"월";
		model.addAttribute("month1", month1);
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
		String month2 = twoMonthsAgo.get(0).getIndate().substring(5, 7)+"월";
		model.addAttribute("month2", month2);
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
		String year1 = aYearAgo.get(0).getIndate().substring(0, 4);
		model.addAttribute("year1", year1);
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
		String year2 = twoYearsAgo.get(0).getIndate().substring(0,4);
		model.addAttribute("year2", year2);
		model.addAttribute("totalTwoYearsAgo1", totalTwoYearsAgo1);
		model.addAttribute("totalTwoYearsAgo2", totalTwoYearsAgo2);
		model.addAttribute("totalTwoYearsAgo3", totalTwoYearsAgo3);
	}
}
