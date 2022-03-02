<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>

	<div class="col-md-9">
	  <div class="container">
	   <div class="row"> 
		 <div class="productlist_body">
		  <div class="total_sort list_clear">
		    <p class="list_total">
		      <span>${pageMaker.total}</span>
		      items
		    </p>
		  <div class="product_search">   
              <form class="myform" action="/product/product_list.do" method="get" id="searchForm">
                   <input type="hidden" name="pageNum" value="${pageMaker.cri9.pageNum}">
                  <input type="hidden" name="amount" value="${pageMaker.cri9.amount}">
                  <input type="text" name="keyword" placeholder="검색어를 입력해주세요." class="in_search">
                  <input type="image" class="search_icon" src="../assets/img/search_icon.png">
                 <button class="search_none" type="submit"><i class="fa fa-search"></i><span class="sr-only">검색버튼</span></button>
              </form>
             </div>
		  </div>
          <div class="list_body">
           <div class="inner_listbody">
            <ul class="list">
            <c:set var="num" value="${pageMaker.total-((pageMaker.cri9.pageNum-1)*10)}" />
             <c:forEach items="${list}" var="list">
             <li>
              <div class="item">
               <div class="thumb"> 
                 <a href="/product/product_view.do?pseq=${list.pseq}">
				   <img src="${pageContext.request.contextPath}/upload/${list.image}" alt="">
				 </a>
               </div>
               <a class="list_info">
                <span class="list_name">${list.name}</span>
                <span class="list_cost">
                 <span class="list_price"><fmt:formatNumber value="${list.price2}"/></span>
                </span>
                <!--<span class="list_desc">${list.content}</span>  -->
                <span class="list_tag">
                <c:choose>
	                <c:when test="${list.kind == '1'}">샐러드</c:when>
	                <c:when test="${list.kind == '2'}">닭가슴살</c:when>
	                <c:when test="${list.kind == '3'}">다이어트 도시락</c:when>
	                <c:when test="${list.kind == '4'}">샌드위치</c:when>
	                <c:when test="${list.kind == '5'}">프로틴</c:when>
	                <c:when test="${list.kind == '6'}">저칼로리간식</c:when>
	                <c:when test="${list.kind == '7'}">무설탕음료</c:when>
	             </c:choose>
	             </span>
               </a>
              </div>
             </li>
            </c:forEach>
            </ul>
           </div>
          </div>
          <div class="product_footer">
		 <c:if test="${pageMaker.prev}">
			<a href="${pageMaker.startPage-1}"><i class="fa  fa-angle-double-left"></i></a>
		</c:if>
		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage }">
			<a href="${num}" class="${pageMaker.cri9.pageNum==num?'active':''}">${num}</a>
		</c:forEach>
		<c:if test="${pageMaker.next}">
			<a href="${pageMaker.endPage+1}"><i class="fa  fa-angle-double-right"></i></a>
		</c:if>
		  <form id="actionForm" action="/product/product_list.do" method="get">
		  <input type="hidden" name="pageNum" value="${pageMaker.cri9.pageNum}">
		  <input type="hidden" name="amount" value="${pageMaker.cri9.amount}">
		  <input type="hidden" name="type" value="${pageMaker.cri9.kind}">
			</form>
	     </div>
		 </div>
	   </div>
	  </div>
	</div>

<script>
$(function() {
	var actionForm = $("#actionForm");
	
	$(".product_footer > a").on("click", function(e){
		e.preventDefault();
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	})
  });
</script>
	