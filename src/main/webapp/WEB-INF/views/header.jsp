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
	<!-- summernote -->
	<link rel="stylesheet" href="../resources/assets/css/summernote.min.css">
	<!-- owl carousel -->
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
	
	<script src="/resources/assets/js/member.js"></script>
	<script src="/resources/assets/js/my.js"></script>
	<script src="/resources/assets/js/review.js"></script>
	<script src="/resources/assets/js/qna.js"></script>
	<script src="/resources/assets/js/purchase.js"></script>
	
</head>
<body>
	<!-- header -->
	<div class="top-header-area" id="sticker" style="background: beige; width: 100%; top: 0px; z-index: inherit;">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-sm-4">
					<a href="index.do">
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
	     					<li><a class="shopping-cart" href="cart.jsp"><i class="fas fa-shopping-cart"></i></a></li>
							<li><a class="shopping-cart" href="notice.jsp"><i class="fa fa-info-circle" aria-hidden="true"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- contents -->
    <div class="product-section mt-150 mb-150">
		<div class="container">

			<div class="row">
				<div class="col-md-3" style="padding-bottom: 50px;">
    				<h3>카테고리</h3>
    				<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
					  <div class="panel panel-default">
					    <div class="panel-heading" role="tab">
					      <h4 class="panel-title">
					      	<a href=""><image src="../assets/img/all.png" class="icon-food">
					         	모든제품
					        </a>
					      </h4>
					    </div>
					  </div>
					  <div class="panel panel-default">
					    <div class="panel-heading" role="tab">
					      <h4 class="panel-title">
					      	<a href=""><image src="../assets/img/salad.png" class="icon-food">
					          	샐러드
					        </a>
					      </h4>
					    </div>
					  </div>
					  <div class="panel panel-default">
					    <div class="panel-heading" role="tab">
					      <h4 class="panel-title">
					      	<a href=""><image src="../assets/img/chicken.png" class="icon-food">
					          	닭가슴살
					        </a>
					      </h4>
					    </div>
					  </div>
					  <div class="panel panel-default">
					    <div class="panel-heading" role="tab">
					      <h4 class="panel-title">
					        <a href=""><image src="../assets/img/lunch_box.png" class="icon-food">
					          	다이어트 도시락
					        </a>
					      </h4>
					    </div>
					  </div>
					  <div class="panel panel-default">
					    <div class="panel-heading" role="tab">
					      <h4 class="panel-title">
					        <a href=""><image src="../assets/img/sandwich.png" class="icon-food">
					          	샌드위치
					        </a>
					      </h4>
					    </div>
					  </div>
					  <div class="panel panel-default">
					    <div class="panel-heading" role="tab">
					      <h4 class="panel-title">
					        <a href=""><image src="../assets/img/protein.png" class="icon-food">
					          	프로틴
					        </a>
					      </h4>
					    </div>
					  </div>
					  <div class="panel panel-default">
					    <div class="panel-heading" role="tab">
					      <h4 class="panel-title">
					        <a href=""><image src="../assets/img/snack.png" class="icon-food">
					        	저칼로리 간식
					        </a>
					      </h4>
					    </div>
					  </div>
					  <div class="panel panel-default">
					    <div class="panel-heading" role="tab">
					      <h4 class="panel-title">
					        <a href=""><image src="../assets/img/drink.png" class="icon-food">
					          	무설탕 음료
					        </a>
					      </h4>
					    </div>
					  </div>
					</div>
    			</div>
    			
<script>
	function chk_form() {
	
	document.getElementById('frm').submit();
	}
</script>
	<!-- end header -->