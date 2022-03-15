<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- jstl의 core사용하기 위해 /core태그를 사용하기 위한 접두사 c로 지정 -->
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> <!-- jstl의 형식 지정(형식화) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %><!-- jstl의 함수 사용하기위해 -->
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

 <%@ include file="mainheader.jsp" %>
      <div class="midori_main">
       <div class="midori_content">
        <div class="midori_indexmain page_main">
         <div class="midori_productpage">
           <div class="e1hbqli00">
            <div class="midori_slider">
             <div class="slider">
              <div>
               <img src="/resources/assets/img/midori_slide3.png">
              </div>
                <div>
               <img src="/resources/assets/img/midori_slide2.png">
              </div>
                <div>
               <img src="/resources/assets/img/midori_slide1.png">
              </div>
                <div>
               <img src="/resources/assets/img/midori_slide4.png">
              </div>
             </div>
            </div>
            <div class="midori_one" style="padding-top: 50px; padding-left: 75px;">
             <div class="ee57">
              <div class="one_1wv14">
               <div class="one_li60"> 
                <a href="/product/product_new" class="one_efst">
                 <img src="/resources/assets/img/newproduct.jpg">
                </a>
                <div class="one_ele39">
                 <div class="one_2u01"> 
                  <div class="one_7xc07">
                   <span class="one_195c6">
                   <a href="/product/product_new">
                                               신상품 상품 보러가기 >
                   </a>                             
                   </span>
                  </div>
                 </div>
                 <div class="one_1y0s">
                  <div class="product_slider initia">
                   <button class="prevo1">
                   </button>
                    <button class="nexto1">
                    </button>
			        <div class="midori_wrapper1">
			        <c:forEach var="nlist" items="${newlist}">
			         <div class="product_post">
					   <div class="post_info">
					    <div class="post_thumbnail">
					       <a href="/product/product_view.do?pseq=${nlist.pseq}">
					        <img class="post_img" src="${pageContext.request.contextPath}/upload/${nlist.image}" alt="">
					       </a>
					        <div class="index_cart">
					        <a class="go_cart" onclick="location.href='/mypage/cartinsert.do?pseq=${nlist.pseq}&quantity=1'" >
					         <img src="https://s3.ap-northeast-2.amazonaws.com/res.kurly.com/kurly/ico/2021/cart_white_45_45.svg" >
					        </a>
					       </div>
					    </div>
					    <div class="post_13fhm">
					     <h3 style="margin:0px;">
					      <a href="" class="midori_names">${nlist.name}</a>
					     </h3>
					    <div class="post_price">
					     <div class="midori_prices">
					         ${nlist.price2}
					       <span>원</span>
					     </div>
					    </div>
					    </div>
					   </div>
				     </div>		    
				     </c:forEach>
			        </div>
                  </div>
                 </div>
                </div>
               </div>      
              </div>
             </div>
            </div>
            <div class="midori_one" style="padding-top: 50px; padding-left: 75px;">
            <div class="midori_banner">
             <div class="one_li60">
              <a href="/product/product_best" class="one_efst">
               <img src="/resources/assets/img/bestproduct.png">
              </a>
             </div>
            </div>
             <div class="ee57">
              <div class="one_1wv14">
               <div class="one_li60"> 
                <div class="two_ele39">
                 <div class="one_2u01"> 
                  <div class="one_7xc07">
                   <span class="one_195c6">
                   <a href="/product/product_best">
                                               베스트 상품 보러가기 >
                   </a>                             
                   </span>
                  </div>
                 </div>
                 <div class="one_1y0s">
                  <div class="product_slider initia">
                   <button class="prevo">
                   </button>
                    <button class="nexto">
                    </button>
			        <div class="midori_wrapper">
			        <c:forEach var="blist" items="${bestlist}">
			         <div class="product_post">
					   <div class="post_info">
					    <div class="post_thumbnail">
					       <a href="/product/product_view.do?pseq=${blist.pseq}">
					        <img class="post_img" src="${pageContext.request.contextPath}/upload/${blist.image}" alt="">
					       </a>
					       <div class="index_cart">
					        <a class="go_cart" onclick="location.href='/mypage/cartinsert.do?pseq=${blist.pseq}&quantity=1'" >
					         <img src="https://s3.ap-northeast-2.amazonaws.com/res.kurly.com/kurly/ico/2021/cart_white_45_45.svg" >
					        </a>
					       </div>
					    </div>
					    <div class="post_13fhm">
					     <h3 style="margin:0px;">
					      <a href="" class="midori_names">${blist.name}</a>
					     </h3>
					    <div class="post_price">
					     <div class="midori_prices">
					         ${blist.price2}
					       <span>원</span>
					     </div>
					    </div>
					    </div>
					   </div>
				     </div>		    
				     </c:forEach>
			        </div>
                  </div>
                 </div>
                </div>
               </div>      
              </div>
             </div>
            </div>
            <div class="midori_one" style="padding-top: 50px; padding-left: 75px;">
            <div class="midori_banner">
             <div class="one_li60">
              <a href="/product/product_list?kind=2" class="one_efst">
               <img src="/resources/assets/img/chickenproduct.jpg">
              </a>
             </div>
            </div>
             <div class="ee57">
              <div class="one_1wv14">
               <div class="one_li60"> 
                <div class="two_ele39">
                 <div class="one_2u01"> 
                  <div class="one_7xc07">
                   <span class="one_195c6">
                   <a href="/product/product_list?kind=2">
                                              닭가슴살 상품 보러가기 >
                   </a>                             
                   </span>
                  </div>
                 </div>
                 <div class="one_1y0s">
                  <div class="product_slider initia">
                   <button class="prevo5">
                   </button>
                    <button class="nexto5">
                    </button>
			        <div class="midori_wrapper5">
			        <c:forEach var="clist" items="${clist}">
			         <div class="product_post">
					   <div class="post_info">
					    <div class="post_thumbnail">
					       <a href="/product/product_view.do?pseq=${clist.pseq}">
					        <img class="post_img" src="${pageContext.request.contextPath}/upload/${clist.image}" alt="">
					       </a>
					        <div class="index_cart">
					        <a class="go_cart" onclick="location.href='/mypage/cartinsert.do?pseq=${clist.pseq}&quantity=1'">
					         <img src="https://s3.ap-northeast-2.amazonaws.com/res.kurly.com/kurly/ico/2021/cart_white_45_45.svg" >
					        </a>
					       </div>
					    </div>
					    <div class="post_13fhm">
					     <h3 style="margin:0px;">
					      <a href="" class="midori_names">${clist.name}</a>
					     </h3>
					    <div class="post_price">
					     <div class="midori_prices">
					         ${clist.price2}
					       <span>원</span>
					     </div>
					    </div>
					    </div>
					   </div>
				     </div>		    
				     </c:forEach>
			        </div>
                  </div>
                 </div>
                </div>
               </div>      
              </div>
             </div>
            </div>
              <div class="midori_one2" style="padding-top: 50px; padding-left: 75px;">
             <div class="ee57">
              <div class="one_1wv14">
               <div class="one_li60"> 
                <a href="/product/product_list?kind=1" class="one_efst">
                 <img src="/resources/assets/img/saladproduct.jpg">
                </a>
                <div class="one_ele39">
                 <div class="one_2u01"> 
                  <div class="one_7xc07">
                   <span class="one_195c6">
                   <a href="/product/product_list?kind=1">
                                               샐러드 상품 보러가기 >
                   </a>                             
                   </span>
                  </div>
                 </div>
                 <div class="one_1y0s">
                  <div class="product_slider initia">
                   <button class="prevo2">
                   </button>
                    <button class="nexto2">
                    </button>
			        <div class="midori_wrapper2">
			        <c:forEach var="slist" items="${slist}">
			         <div class="product_post">
					   <div class="post_info">
					    <div class="post_thumbnail">
					       <a href="/product/product_view.do?pseq=${slist.pseq}">
					        <img class="post_img" src="${pageContext.request.contextPath}/upload/${slist.image}" alt="">
					       </a>
					        <div class="index_cart">
					        <a class="go_cart" onclick="location.href='/mypage/cartinsert.do?pseq=${slist.pseq}&quantity=1'" >
					         <img src="https://s3.ap-northeast-2.amazonaws.com/res.kurly.com/kurly/ico/2021/cart_white_45_45.svg" >
					        </a>
					       </div>
					    </div>
					    <div class="post_13fhm">
					     <h3 style="margin:0px;">
					      <a href="" class="midori_names">${slist.name}</a>
					     </h3>
					    <div class="post_price">
					     <div class="midori_prices">
					         ${slist.price2}
					       <span>원</span>
					     </div>
					    </div>
					    </div>
					   </div>
				     </div>		    
				     </c:forEach>
			        </div>
                  </div>
                 </div>
                </div>
               </div>      
              </div>
             </div>
            </div>
            <div class="midori_one3" style="padding-top: 50px; padding-left: 75px;">
            <div class="midori_banner">
             <div class="one_li60">
              <a href="/product/product_list?kind=6" class="one_efst">
               <img src="/resources/assets/img/dessertproduct.jpg">
              </a>
             </div>
            </div>
             <div class="ee57">
              <div class="one_1wv14">
               <div class="one_li60"> 
                <div class="two_ele39">
                 <div class="one_2u01"> 
                  <div class="one_7xc07">
                   <span class="one_195c6">
                   <a href="/product/product_list?kind=6">
                                               디저트 상품 보러가기 >
                   </a>                             
                   </span>
                  </div>
                 </div>
                 <div class="one_1y0s">
                  <div class="product_slider initia">
                   <button class="prevo3">
                   </button>
                    <button class="nexto3">
                    </button>
			        <div class="midori_wrapper3">
			        <c:forEach var="dlist" items="${dlist}">
			         <div class="product_post">
					   <div class="post_info">
					    <div class="post_thumbnail">
					       <a href="/product/product_view.do?pseq=${dlist.pseq}">
					        <img class="post_img" src="${pageContext.request.contextPath}/upload/${dlist.image}" alt="">
					       </a>
					        <div class="index_cart">
					        <a class="go_cart" onclick="location.href='/mypage/cartinsert.do?pseq=${dlist.pseq}&quantity=1'" >
					         <img src="https://s3.ap-northeast-2.amazonaws.com/res.kurly.com/kurly/ico/2021/cart_white_45_45.svg" >
					        </a>
					       </div>
					    </div>
					    <div class="post_13fhm">
					     <h3 style="margin:0px;">
					      <a href="" class="midori_names">${dlist.name}</a>
					     </h3>
					    <div class="post_price">
					     <div class="midori_prices">
					         ${dlist.price2}
					       <span>원</span>
					     </div>
					    </div>
					    </div>
					   </div>
				     </div>		    
				     </c:forEach>
			        </div>
                  </div>
                 </div>
                </div>
               </div>      
              </div>
             </div>
            </div>
            <div class="midori_one4" style="padding-top: 50px; padding-left: 75px;">
            <div class="midori_banner">
             <div class="one_li60">
              <a href="/product/product_list?kind=3" class="one_efst">
               <img src="/resources/assets/img/friedriceproduct.jpg">
              </a>
             </div>
            </div>
             <div class="ee57">
              <div class="one_1wv14">
               <div class="one_li60"> 
                <div class="two_ele39">
                 <div class="one_2u01"> 
                  <div class="one_7xc07">
                   <span class="one_195c6">
                   <a href="/product/product_list?kind=3">
                                              도시락&볶음밥 상품 보러가기 >
                   </a>                             
                   </span>
                  </div>
                 </div>
                 <div class="one_1y0s">
                  <div class="product_slider initia">
                   <button class="prevo4">
                   </button>
                    <button class="nexto4">
                    </button>
			        <div class="midori_wrapper4">
			        <c:forEach var="flist" items="${flist}">
			         <div class="product_post">
					   <div class="post_info">
					    <div class="post_thumbnail">
					       <a href="/product/product_view.do?pseq=${flist.pseq}">
					        <img class="post_img" src="${pageContext.request.contextPath}/upload/${flist.image}" alt="">
					       </a>
					        <div class="index_cart">
					        <a class="go_cart" onclick="location.href='/mypage/cartinsert.do?pseq=${flist.pseq}&quantity=1'" >
					         <img src="https://s3.ap-northeast-2.amazonaws.com/res.kurly.com/kurly/ico/2021/cart_white_45_45.svg" >
					        </a>
					       </div>
					    </div>
					    <div class="post_13fhm">
					     <h3 style="margin:0px;">
					      <a href="" class="midori_names">${flist.name}</a>
					     </h3>
					    <div class="post_price">
					     <div class="midori_prices">
					         ${flist.price2}
					       <span>원</span>
					     </div>
					    </div>
					    </div>
					   </div>
				     </div>		    
				     </c:forEach>
			        </div>
                  </div>
                 </div>
                </div>
               </div>      
              </div>
             </div>
            </div>
           </div>
         </div>
        </div>
       </div>
      </div>
     </div>
    </div>
   </body>
   	 <form id="actionForm" action="/product/product_list.do" method="get">
        <input type="hidden" name="pageNum" value="${pageMaker.cri9.pageNum}">
        <input type="hidden" name="amount" value="${pageMaker.cri9.amount}">
        <input type="hidden" name="keyword" value="${pageMaker.cri9.keyword}">
        <input type="hidden" name="kind" value="${pageMaker.cri9.kind}">
         </form>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
	$(document).ready(function() {
		$('.slider').bxSlider({
			mode : 'fade',
			auto : true,
			paues : 3000
			
		});
	});
</script>
 


<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script>
		$(document).ready(function() {
			$('.midori_wrapper').slick({
				slidesToShow : 4,
				slidesToScroll : 4,
				autoplay : false,
				autoplaySpeed : 10000,
				nextArrow : $('.nexto'),
				prevArrow : $('.prevo'),
			});
		});
	</script>

	<script>
		$(document).ready(function() {
			$('.midori_wrapper1').slick({
				slidesToShow : 4,
				slidesToScroll : 4,
				nextArrow : $('.nexto1'),
				prevArrow : $('.prevo1'),
			});
		});
	</script>
	<script>
		$(document).ready(function() {
			$('.midori_wrapper2').slick({
				slidesToShow : 4,
				slidesToScroll : 4,
				nextArrow : $('.nexto2'),
				prevArrow : $('.prevo2'),
			});
		});
	</script>
	<script>
		$(document).ready(function() {
			$('.midori_wrapper3').slick({
				slidesToShow : 4,
				slidesToScroll : 4,
				nextArrow : $('.nexto3'),
				prevArrow : $('.prevo3'),
			});
		});
	</script>
	<script>
		$(document).ready(function() {
			$('.midori_wrapper4').slick({
				slidesToShow : 4,
				slidesToScroll : 4,
				nextArrow : $('.nexto4'),
				prevArrow : $('.prevo4'),
			});
		});
	</script>
	<script>
		$(document).ready(function() {
			$('.midori_wrapper5').slick({
				slidesToShow : 4,
				slidesToScroll : 4,
				nextArrow : $('.nexto5'),
				prevArrow : $('.prevo5'),
			});
		});
	</script>
	<script>
$(function() {
	var actionForm = $("#actionForm");
	
	$(".product_footer > a").on("click", function(e){
		e.preventDefault();
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	})
  });
  
function goCart(){
	var form = document.getElementById('ofrm');
	form.action = "/mypage/cartInsert.do";
	form.submit();
}
</script>

<%@ include file="footer.jsp" %>