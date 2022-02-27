<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- jstl의 core사용하기 위해 /core태그를 사용하기 위한 접두사 c로 지정 -->
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> <!-- jstl의 형식 지정(형식화) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %><!-- jstl의 함수 사용하기위해 -->
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

	<!-- title -->
	<title>녹색식탁</title>

	<!-- favicon -->
	<link rel="shortcut icon" type="image/png" href="../assets/img/favicon.png">
	<!-- google font -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
	<!-- fontawesome -->
	<link rel="stylesheet" href="../resources/assets/css/all.min.css">
	
	<!-- bootstrap -->
	<link rel="stylesheet" href="../resources/assets/bootstrap/css/bootstrap.min.css">
	<!-- owl carousel -->
    <link rel="stylesheet" href="../resources/assets/css/summernote.min.css">
	
	<link rel="stylesheet" href="../resources/assets/css/owl.carousel.css">
	<!-- magnific popup -->
	<link rel="stylesheet" href="../resources/assets/css/magnific-popup.css">
	<!-- animate css -->
	<link rel="stylesheet" href="../resources/assets/css/animate.css">
	<!-- mean menu css -->
	<link rel="stylesheet" href="../resources/assets/css/meanmenu.min.css">
	<!-- main style -->
	<link rel="stylesheet" href="../resources/assets/css/main.css">
	<!-- responsive -->
	<link rel="stylesheet" href="../resources/assets/css/responsive.css">
	
	<link rel="stylesheet" href="../resources/assets/css/mycss.css">
    
    <link rel="stylesheet" href="../resources/assets/css/cart.css">
    
    <link rel="stylesheet" href="../resources/assets/css/order.css">
 
    <link rel="stylesheet" href="../resources/assets/css/notice.css">
 
	<!-- jquery -->
	<script src="/resources/assets/js/jquery-1.11.3.min.js"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- bootstrap -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>		
	
	<script src="/resources/assets/bootstrap/js/bootstrap.min.js"></script>
	
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
	
	<script src="/resources/assets/js/member.js"></script>
	<script src="/resources/assets/js/my.js"></script>
	<script src="/resources/assets/js/mypage.js"></script>
	 
</head>
<body>
	<!-- header -->
	<div class="top-header-area" id="sticker" style="background: beige; width:100%; top: 0px; z-index: inherit;">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-sm-4">
					<a href="/">
						<img src="../assets/img/logo.png" style="width: 100px;" alt="">
					</a>
				</div>
				<div class="col-lg-8 col-sm-8" style="text-align: right; color:black;">
					<div class="header-icons" style="padding: 28px 0;">
						<ul style="height: 20px;">
						<sec:authorize access="isAnonymous()">
							<li><a class="shopping-cart" href="/member/login.do"><i class="fa fa-lock"></i></a></li>
							<li><a class="shopping-cart" href="/member/join.do"><i class="fa fa-user-circle" aria-hidden="true"></i></a></li>
						</sec:authorize>
		                <sec:authorize access="isAuthenticated()">				
	     					<li>
		     					<form id="frm" name="logout" method="post" action="/adm/adminLogout">
             					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		     					<a href="#" onclick="return chk_form()" class="shopping-cart" type="submit"><i class="fas fa-lock-open"></i></a>
		     					</form>
	     					</li>
	     					<li><a class="shopping-cart" href="mypage.jsp"><i class="fas fa-address-card" aria-hidden="true"></i></a><li>
			            </sec:authorize>	
	     					<li><a class="shopping-cart" href="/product/cart"><i class="fas fa-shopping-cart"></i></a></li>
							<li><a class="shopping-cart" href="notice.jsp"><i class="fa fa-info-circle" aria-hidden="true"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	 <div class="product-section mt-150 mb-150">
      <div class="container">
	   <div class="row">
		<div class="noticemodify">
		 <div class="noticemodify_head">
		   <strong>공지사항</strong>
		 </div>	
		 <div class="noticemodify_table">
		  <table>
		   <thead>
		    <tr>
		     <th><div class="tb_center">${nvo.title}</div></th>
		    </tr>
		   </thead>
		   <tbody>
		    <tr>
		     <td class="line">
		      <div class="noitce_sub_des">
		       <div>
		        <span>
		           <em>작성일 : </em>
		           ${nvo.regdate.substring(0, 10)} 
		        </span>
		       </div>
		       <div>
		        <span>
		         <em>작성자 : </em>
		          ${nvo.writer }
		          <em style="float:right;">조회수 : 
		          <i class="fa fa-eye"></i> ${nvo.viewcount}</em>
		        </span>
		       </div>
		      </div>
		     </td>
		    </tr>
		    <tr>
		     <td>
		      <div class="modify_body">
		        ${nvo.content}
		      </div>
		     </td>
		    </tr>
		   </tbody>
		  </table>
		  <div class="noticeprev_next">
			<c:if test="${prevVO !=null}">
				<a href="noticeview.do?bno=${prevVO.bno}&pageNum=${cri.pageNum}&amount=${cri.amount}" class="btn_prev"><i class="fa fa-angle-left"></i>
				<span class="prev_wrap">
					<strong>이전글</strong><span>${prevVO.title}</span>
				</span>
				</a>
			</c:if>
			<c:if test="${prevVO == null}">
				<a href="javascript:void(0)" class="btn_prev"><i class="fa fa-angle-left"></i>
				<span class="prev_wrap">
					<strong>이전글</strong><span>없음</span>
				</span>
				</a>
			</c:if>
				<div class="btn_3wrap">
					<a href="notice.do?pageNum=${cri.pageNum}&amount=${cri.amount}&type=${cri.type}&keyword=${cri.keyword}">목록</a>
				</div>
			<c:if test="${nextVO != null}">
				<a href="noticeview.do?bno=${nextVO.bno }&pageNum=${cri.pageNum}&amount=${cri.amount}" class="btn_next">
				<span class="next_wrap">
					<strong>다음글</strong><span>${nextVO.title}</span>
				</span>
				<i class="fa fa-angle-right"></i></a>
			</c:if>
			<c:if test="${nextVO == null}">
				<a href="javascript:void(0)" class="btn_next">
				<span class="next_wrap">
					<strong>다음글</strong><span>없음</span>
				</span>
				<i class="fa fa-angle-right"></i></a>
			</c:if>
			</div>
		 </div> 	
		</div>
	  </div>
     </div>
    </div>		