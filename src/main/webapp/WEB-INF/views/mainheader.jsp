<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   

    <head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

	<!-- title -->
	<title>녹색식탁</title>

   <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- jstl의 core사용하기 위해 /core태그를 사용하기 위한 접두사 c로 지정 -->
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> <!-- jstl의 형식 지정(형식화) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %><!-- jstl의 함수 사용하기위해 -->
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

   
	<!-- favicon -->
	<link rel="shortcut icon" type="image/png" href="../assets/img/favicon.png">
	<!-- google font -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
	<!-- fontawesome -->
	<link rel="stylesheet" href="/resources/assets/css/all.min.css">
	<!-- bootstrap -->
	<link rel="stylesheet" href="/resources/assets/bootstrap/css/bootstrap.min.css">
	
	 <link href="/resources/assets/css/font-awesome.min.css" rel="stylesheet">
	<!-- summernote -->
	<link rel="stylesheet" href="/resources/assets/css/summernote.min.css">
	<!-- owl carousel -->
	<link rel="stylesheet" href="/resources/assets/css/owl.carousel.css">
	<!-- magnific popup -->
	<link rel="stylesheet" href="/resources/assets/css/magnific-popup.css">
	<!-- animate css -->
	<link rel="stylesheet" href="/resources/assets/css/animate.css">
	<!-- mean menu css -->
	<link rel="stylesheet" href="/resources/assets/css/meanmenu.min.css">
	<!-- main style -->
	<link rel="stylesheet" href="/resources/assets/css/main.css">
	<!-- responsive -->
	<link rel="stylesheet" href="/resources/assets/css/responsive.css">
	
	<link rel="stylesheet" href="/resources/assets/css/mycss.css">
	<!-- product css summernote 충돌 해결함 -->
	<link rel="stylesheet" href="/resources/assets/css/product.css">
	
	<link rel="stylesheet" href="/resources/assets/css/order.css">
	
	<link rel="stylesheet" href="/resources/assets/css/notice.css">
	
	<link rel="stylesheet" href="/resources/assets/css/cart.css">
	
	<link rel="stylesheet" href="/resources/assets/css/index.css">
	
	<link rel="stylesheet" href="/resources/assets/css/member.css">
	
	<link rel="stylesheet" href="/resources/assets/css/mypage.css">
	


	<!--  <link rel="stylesheet" href="/resources/assets/css/footer.css">-->
	<!-- <link rel="stylesheet" href="/resources/assets/css/footer.css"> -->
	

 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	<!-- jquery -->
	<script src="/resources/assets/js/jquery-1.11.3.min.js"></script>
	<!-- 다음 주소 api -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- 아임포트 결제 -->
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<!-- popper -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<!-- bootstrap -->
	<script src="/resources/assets/bootstrap/js/bootstrap.min.js"></script>
	<!-- summernote -->
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
	<!-- count down -->
	<script src="/resources/assets/js/jquery.countdown.js"></script>
	<!-- isotope -->
	<script src="/resources/assets/js/jquery.isotope-3.0.6.min.js"></script>
	<!-- waypoints -->
	<script src="/resources/assets/js/waypoints.js"></script>
	<!-- owl carousel -->
	<script src="/resources/assets/js/owl.carousel.min.js"></script>
	<!-- magnific popup -->
	<script src="/resources/assets/js/jquery.magnific-popup.min.js"></script>
	<!-- mean menu -->
	<script src="/resources/assets/js/jquery.meanmenu.min.js"></script>
	<!-- sticker js -->
	<script src="/resources/assets/js/sticker.js"></script>
	<!-- main js -->
	<script src="/resources/assets/js/main.js"></script>
	<script src="/resources/assets/js/jquery-3.6.0.min.js"></script>
	<script src="/resources/assets/js/member.js"></script>
	<script src="/resources/assets/js/my.js"></script>
	<script src="/resources/assets/js/review.js"></script>
	<script src="/resources/assets/js/qna.js"></script>
	<script src="/resources/assets/js/purchase.js"></script>
	
	
	  <script>
	$(function() {

		$(".inner_main > ul > li").hover(function() {
			$(".inner_main > ul > li").removeClass("active");
			$(this).addClass("active");
			$(this).children(".gnb_menu").stop().slideDown(0);
		}, function() {
			$(".inner_main > ul > li").removeClass("active");
			$(this).children(".gnb_menu").slideUp(0);
		})
	})
</script>
	

</head>
    
    
    <body class="midori_index">
    <div class="wrap">
     <div class="container1">
      <div class="midori_header">
       <div class="usermenu">
        <ul class="user_ul" style="padding-top:10px;">
        <sec:authorize access="isAnonymous()">
         <li class="menu3 menu_join">
          <a href="/member/join.do" class="link_menu">회원가입</a>
         </li>
         <li class="menu1 menu_login">
          <a href="/member/login.do" class="link_menu">로그인</a>
         </li>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">	
        <li class="menu menu_join">
         <form id="frm" name="logout" method="post" action="/adm/adminLogout">
       	  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
 	      <a href="#" onclick="return chk_form()" class="link_menu" type="submit">로그아웃</a>
		 </form>
         </li>
         <li class="menu1 menu_login">
          <a href="/member/email.do" class="link_menu">내정보</a>
         </li>
         </sec:authorize>
        </ul>
       </div>
       <div class="headerlogo">
        <h1 class="logo">
         <a href="/" class="link_main">
          <img src="/resources/assets/img/logo.png"  style="display: block;" alt="미도리 로고">
         </a>
        </h1>
       </div>
       <div class="category_gnb">
        <div class="fixed_container" id="sticker">
         <h2 class="screen_out">메뉴</h2>
         <div class="gnbmenu gnb_midori">
          <div class="inner_gnbmidori">
           <div class="inner_main">
            <ul class="gnb_ul">
              <li class="gnb_li1">
                <a href="/product/product_list" class="" style="width:152px;">
                  <span class="gnb_ico"><img src="/resources/assets/img/gnb_ico.png"></span>
                  <span class="gnb_txt" style="float:left;">전체 카테고리　</span>
                </a>
                 <ul class="gnb_menu size_over">
               <li class="size_stop">
                <a href="/product/product_list?kind=1" class="size_overmenu">
                 <img src="/resources/assets/img/salad.png" class="category_img">
			            샐러드
			    </a>
               </li>
               <li class="size_stop">
                <a href="/product/product_list?kind=2" class="size_overmenu">
                 <img src="/resources/assets/img/chicken.png" class="category_img">
			            닭가슴살
			    </a>
               </li>
               <li class="size_stop">
                <a href="/product/product_list?kind=3" class="size_overmenu">
                 <img src="/resources/assets/img/lunch_box.png" class="category_img">
			            다이어트 도시락
			    </a>
               </li>
               <li class="size_stop">
                <a href="/product/product_list?kind=4" class="size_overmenu">
                 <img src="/resources/assets/img/sandwich.png" class="category_img">
			            샌드위치
			    </a>
               </li>
               <li class="size_stop">
                <a href="/product/product_list?kind=5" class="size_overmenu">
                 <img src="/resources/assets/img/protein.png" class="category_img">
			            프로틴
			    </a>
               </li>
               <li class="size_stop">
                <a href="/product/product_list?kind=6" class="size_overmenu">
                 <img src="../assets/img/snack.png" class="category_img">
			            저칼로리 간식
			    </a>
               </li>
               <li class="size_stop">
                <a href="/product/product_list?kind=7" class="size_overmenu">
                 <img src="../assets/img/drink.png" class="category_img">
			             무설탕 음료
			    </a>
               </li>
              </ul>              
              </li>
              <li class="gnb_li2">
               <a href="/product/product_new" class="link_new">
                <span class="gnb_txt">신상품</span>
               </a>
              </li>
              <li class="gnb_li3">
               <a href="/product/product_best" class="link_best">
                <span class="gnb_txt">베스트</span>
               </a>
              </li>
              <li class="gnb_li4">
               <a href="/notice/notice" class="link_notice">
                <span class="gnb_txt">공지사항</span>
               </a>
            </ul>
            <div class="index_search">
              <form class="myform" action="/product/product_list.do" method="get" id="searchForm">
                  <input type="hidden" name="pageNum" value="${pageMaker.cri9.pageNum}">
                  <input type="hidden" name="amount" value="${pageMaker.cri9.amount}">
                  <input type="text" name="keyword" placeholder="검색어를 입력해주세요." class="indexin_search">
                  <input type="image" class="indexsearch_icon" src="../assets/img/search_icon.png">
                 <button class="search_none" type="submit"><i class="fa fa-search"></i><span class="sr-only">검색버튼</span></button>
              </form>
            </div>
            <div class="mypage_count">
             <div class="inner_mypagecount">
              <a href="/order/ordering" class="btn_mypage">
               <img src="/resources/assets/img/mypage_icon.png" 
               style="display: block; width: 30px;height:30px">
              </a>
             </div>
            </div>
            <div class="cart_count">
             <div class="inner_cartcount">
              <a href="/mypage/cart_list" class="btn_cart">
               <img src="/resources/assets/img/cart_icon.png" 
               style="display: block; width: 30px;height:30px">
              </a>
             </div>
            </div>   
           </div>
          </div>
         </div>
        </div>
       </div>
      </div>
      <script>
function chk_form() {

document.getElementById('frm').submit();
}
</script>