<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- jstl의 core사용하기 위해 /core태그를 사용하기 위한 접두사 c로 지정 -->
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> <!-- jstl의 형식 지정(형식화) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %><!-- jstl의 함수 사용하기위해 -->
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
<head>

	<!-- title -->
	<title>녹색식탁</title>
	<!-- favicon -->
	<link rel="shortcut icon" type="image/png" href="../../assets/img/favicon.png">
	<!-- bootstrap css -->
	<link rel="stylesheet" href="/resources/assets/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/adminassets/css/styles.css">
	
	<link rel="stylesheet" href="/resources/adminassets/css/admin.css">
	<link rel="stylesheet" href="/resources/adminassets/css/admin-product.css">
	<link rel="stylesheet" href="/resources/assets/css/mycss.css">
	<!-- google font -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">

    <!-- jquery -->
	<script src="/resources/adminassets/js/jquery-1.11.3.min.js"></script>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- bootstrap 
	<script src="/resources/adminassets/bootstrap/js/bootstrap.min.js"></script>-->
	<!-- count down -->
	<script src="/resources/adminassets/js/jquery/jquery.countdown.js"></script>
	<!-- count down -->
	<script src="/resources/adminassets/js/jquery/jquery.min.js"></script>
	<script src="/resources/adminassets/js/jquery/jquery-3.3.1.min.js"></script>
	<!-- isotope -->
	<script src="/resources/adminassets/js/jquery/jquery.isotope-3.0.6.min.js"></script>
	<!-- waypoints -->
	<script src="/resources/adminassets/js/waypoints.js"></script>
	<!-- owl carousel -->
	<script src="/resources/adminassets/js/owl.carousel.min.js"></script>
	<!-- magnific popup -->
	<script src="/resources/adminassets/js/jquery.magnific-popup.min.js"></script>
	<!-- mean menu -->
	<script src="/resources/adminassets/js/jquery.meanmenu.min.js"></script>
	<!-- sticker js -->
	<script src="/resources/adminassets/js/sticker.js"></script>
	<!-- main js -->
	<script src="/resources/adminassets/js/main.js"></script>
	<!-- google chart js -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	
	
	<script src="/resources/assets/js/member.js"></script>
	<script src="/resources/assets/js/my.js"></script>
	<script src="/resources/assets/js/qna.js"></script>
	<script src="/resources/adminassets/js/product.js"></script>
	 

	<!-- summernote css -->
	<link rel="stylesheet" href="/resources/assets/css/summernote.min.css">
	<!-- popper js -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<!-- bootstrap js -->
	<script src="/resources/assets/bootstrap/js/bootstrap.min.js"></script>
	<!-- summernote js-->
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
	
</head>
    
    
 
	<script src="/resources/adminassets/js/datatables-simple-demo.js"></script>
	<!-- count down -->
	<script src="/resources/adminassets/js/scripts.js"></script>
</head>
    	
    	
    	
    	<script>
		$(function() {
			$(".navi > ul > li").hover(function() {
				$(".navi > ul > li").removeClass("active");
				$(this).addClass("active");
				$(this).children(".sub-category").stop().slideDown(0);
			}, function() {
				$(".navi > ul > li").removeClass("active");
				$(this).children(".sub-category").slideUp(0);
			});
		});
	</script>
	
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>녹색식탁 어드민</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
      <div id="layoutSidenav">
     
        
         
           

            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                        	    <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/adm/admindex.do" style="color:white;">녹색식탁 관리자</a>
                            <a class="nav-link" href="/adm/admindex.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-home"></i></div>
                                                                          홈 
                            </a>
                            <div>
                                <nav class="navi">
                                  <ul>
                                   <li class="category-record"><a href="/adm/product/productlist.do"><i class="fas fa-store" style="padding-right:5px;"></i>상품관리<i class="fas fa-angle-right" style="font-size:20px;"></i></a>
                                    <ul class="sub-category" style="display: none; left: 95px;">
                                     <li><a class="nav-link" href="/adm/product/productlist.do">상품 리스트</a></li>
                                     <li><a class="nav-link" href="/adm/product/productWrite.do">상품 등록</a></li>
                                   </ul>
                                  </li>
                                  <li class="category-record"><a href="/adm/orderlist.do?status=1"><i class="fas fa-shipping-fast" style="padding-right:5px;"></i>주문관리<i class="fas fa-angle-right" style="font-size:20px;"></i></a>
                                    <ul class="sub-category" style="display: none; left: 95px;">
                                     <li><a class="nav-link" href="/adm/orderlist.do?status=1">입금 확인</a></li>
                                     <li><a class="nav-link" href="/adm/orderlist.do?status=2">배송 대기</a></li>
                                     <li><a class="nav-link" href="/adm/orderlist.do?status=3">배송 중</a></li>
                                     <li><a class="nav-link" href="/adm/orderlist.do?status=4">배송 완료</a></li>
                                   </ul>
                                  </li>
                                  <li class="category-record"><a href="/adm/member/admmember"><i class="fas fa-user" style="padding-right:5px;"></i>고객관리</a>
                                    <ul class="sub-category" style="display: none; left: 95px;">
                                   </ul>
                                  </li>
                                  <li class="category-record"><a href="/adm/review.do"><i class="fas fa-book-open" style="padding-right:5px;"></i>리뷰관리</a>
                                    <ul class="sub-category" style="display: none; left: 95px;">
                                   </ul>
                                  </li>
                                  <li class="category-record"><a href="/adm/qna.do"><i class="fas fa-comment" style="padding-right:5px;"></i>문의관리</a>
                                    <ul class="sub-category" style="display: none; left: 95px;">
                                   </ul>
                                  </li>	
                                  <li class="category-record"><a href="/adm/notice/admnotice"><i class="fa fa-info-circle" style="padding-right:5px;"></i>공지관리</a>
                                    <ul class="sub-category" style="display: none; left: 95px;">
                                   </ul>
                                  </li>	
                                  <li class="category-record"><a href="/adm/statistics.do"><i class="fas fa-calendar-week" style="padding-right:5px;"></i>통계</a>
                                    <ul class="sub-category" style="display: none; left: 95px;">
                                   </ul>
                                  </li>	
                                   <li class="category-record">
                                   <form id="frm" name="logout" method="post" action="/adm/adminLogout">
             							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                 		<a type="submit" onclick="return chk_form()"><i class="fas fa-user" style="padding-right:5px;"></i>로그아웃</a>
                                   </form>
                                    <ul class="sub-category" style="display: none; left: 95px;"></ul>
                                  </li>
                                 </ul>
                                </nav>	
                            </div>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Admin
                    </div>
                </nav>
            </div>
         </div>
    </body>
<script>
	function chk_form() {
	
	document.getElementById('frm').submit();
	}
</script>