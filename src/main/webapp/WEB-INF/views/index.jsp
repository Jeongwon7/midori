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
	<link rel="shortcut icon" type="image/png" href="assets/img/favicon.png">
	<!-- google font -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
	<!-- fontawesome -->
	<link rel="stylesheet" href="../resources/assets/css/all.min.css">
	<!-- bootstrap -->
	<link rel="stylesheet" href="../resources/assets/bootstrap/css/bootstrap.min.css">
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
	<!-- bootstrap -->
	<script src="/resources/assets/bootstrap/js/bootstrap.min.js"></script>
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
	
</head>
<body>
	<!-- header -->
	<div class="top-header-area" id="sticker">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-sm-4">
					<a href="index.do">
						<img src="assets/img/logo.png" style="width: 100px;" alt="">
					</a>
				</div>
				<div class="col-lg-8 col-sm-8" style="text-align: right;">
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
	
	<!-- end header -->
	
	<!-- search area -->
	<div class="search-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<span class="close-btn"><i class="fas fa-window-close"></i></span>
					<div class="search-bar">
						<div class="search-bar-tablecell">
							<h3>Search For:</h3>
							<input type="text" placeholder="Keywords">
							<button type="submit">Search <i class="fas fa-search"></i></button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end search area -->

	<!-- home page slider -->
	<div class="homepage-slider">
		<!-- single home slider -->
		<div class="single-homepage-slider homepage-bg-1">
			<div class="container">
				<div class="row">
					<div class="col-md-12 col-lg-7 offset-lg-1 offset-xl-0">
						<div class="hero-text">
							<div class="hero-text-tablecell">
								<p class="subtitle">Fresh & Organic</p>
								<h1>Delicious Seasonal Fruits</h1>
								<div class="hero-btns">
									<a href="shop.html" class="boxed-btn">Fruit Collection</a>
									<a href="contact.html" class="bordered-btn">Contact Us</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- single home slider -->
		<div class="single-homepage-slider homepage-bg-2">
			<div class="container">
				<div class="row">
					<div class="col-lg-10 offset-lg-1 text-center">
						<div class="hero-text">
							<div class="hero-text-tablecell">
								<p class="subtitle">Fresh Everyday</p>
								<h1>100% Organic Collection</h1>
								<div class="hero-btns">
									<a href="shop.html" class="boxed-btn">Visit Shop</a>
									<a href="contact.html" class="bordered-btn">Contact Us</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- single home slider -->
		<div class="single-homepage-slider homepage-bg-3">
			<div class="container">
				<div class="row">
					<div class="col-lg-10 offset-lg-1 text-right">
						<div class="hero-text">
							<div class="hero-text-tablecell">
								<p class="subtitle">Mega Sale Going On!</p>
								<h1>Get December Discount</h1>
								<div class="hero-btns">
									<a href="shop.html" class="boxed-btn">Visit Shop</a>
									<a href="contact.html" class="bordered-btn">Contact Us</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end home page slider -->




	<!-- product section -->
	<div class="product-section mt-150 mb-150">
		<div class="container">

			<div class="row">
				<div class="col-md-3">
    				<h3>카테고리</h3>
    				<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
					  <div class="panel panel-default">
					    <div class="panel-heading" role="tab">
					      <h4 class="panel-title">
					      	<a href=""><image src="assets/img/all.png" class="icon-food">
					         	모든제품
					        </a>
					      </h4>
					    </div>
					  </div>
					  <div class="panel panel-default">
					    <div class="panel-heading" role="tab">
					      <h4 class="panel-title">
					      	<a href=""><image src="assets/img/salad.png" class="icon-food">
					          	샐러드
					        </a>
					      </h4>
					    </div>
					  </div>
					  <div class="panel panel-default">
					    <div class="panel-heading" role="tab">
					      <h4 class="panel-title">
					      	<a href=""><image src="assets/img/chicken.png" class="icon-food">
					          	닭가슴살
					        </a>
					      </h4>
					    </div>
					  </div>
					  <div class="panel panel-default">
					    <div class="panel-heading" role="tab">
					      <h4 class="panel-title">
					        <a href=""><image src="assets/img/lunch_box.png" class="icon-food">
					          	다이어트 도시락
					        </a>
					      </h4>
					    </div>
					  </div>
					  <div class="panel panel-default">
					    <div class="panel-heading" role="tab">
					      <h4 class="panel-title">
					        <a href=""><image src="assets/img/sandwich.png" class="icon-food">
					          	샌드위치
					        </a>
					      </h4>
					    </div>
					  </div>
					  <div class="panel panel-default">
					    <div class="panel-heading" role="tab">
					      <h4 class="panel-title">
					        <a href=""><image src="assets/img/protein.png" class="icon-food">
					          	프로틴
					        </a>
					      </h4>
					    </div>
					  </div>
					  <div class="panel panel-default">
					    <div class="panel-heading" role="tab">
					      <h4 class="panel-title">
					        <a href=""><image src="assets/img/snack.png" class="icon-food">
					        	저칼로리 간식
					        </a>
					      </h4>
					    </div>
					  </div>
					  <div class="panel panel-default">
					    <div class="panel-heading" role="tab">
					      <h4 class="panel-title">
					        <a href=""><image src="assets/img/drink.png" class="icon-food">
					          	무설탕 음료
					        </a>
					      </h4>
					    </div>
					  </div>
					</div>
    			</div>
    			
    			
				<div class="col-md-9 newitem">
    				<h3>베스트 상품</h3>
    				<div class="row">
    					<c:forEach var="blist" items="${bestlist}">
						<div class="col-lg-4 col-md-6 text-center">
							<div class="single-product-item">
								<div class="product-image">
									<a href="/product/product_view?pseq=${blist.pseq}"><img src="/upload/${blist.image}" alt=""></a>
								</div>
								<h4>${blist.name}</h4>
								<p class="product-price">${blist.price2} 원   <a href="cart.html" class="cart-btn"><i class="fas fa-shopping-cart"></i></a></p>
							</div>
						</div>
						</c:forEach>
					</div>
					<h3>신상품</h3>
    				<div class="row">
    				<c:forEach var="nlist" items="${newlist}">
						<div class="col-lg-4 col-md-6 text-center">
							<div class="single-product-item">
								<div class="product-image">
									<a href="/product/product_view?pseq=${nlist.pseq}"><img src="/upload/${nlist.image}" alt=""></a>
								</div>
								<h4>${nlist.name}</h4>
								<p class="product-price">${nlist.price2} 원   <a href="cart.html" class="cart-btn"><i class="fas fa-shopping-cart"></i></a></p>
							</div>
						</div>
					</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end product section -->

<script>
function chk_form() {

document.getElementById('frm').submit();
}
</script>

<%@ include file = "footer.jsp"%>