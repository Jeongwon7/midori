<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../mainheader.jsp" %>
 
	  <div class="midori_main">
       <div class="midori_content">
        <div class="midori_indexmain page_main">
		 <div class="midori_productpage">
		  <div class="midori_one">
		   
	<%-- 	  <div class="product_search">   
              <form class="myform" action="/product/product_list.do" method="get" id="searchForm">
                   <input type="hidden" name="pageNum" value="${pageMaker.cri9.pageNum}">
                  <input type="hidden" name="amount" value="${pageMaker.cri9.amount}">
                  <input type="text" name="keyword" placeholder="검색어를 입력해주세요." class="in_search">
                  <input type="image" class="search_icon" src="../assets/img/search_icon.png">
                 <button class="search_none" type="submit"><i class="fa fa-search"></i><span class="sr-only">검색버튼</span></button>
              </form>
             </div> --%>

		 <div class="newproduct_thumbnail">
		   <img src="/resources/assets/img/newproduct_header.jpg">
		 </div>
         <div class="inner_listbody">          
          <div class="list_body">
           <div style="width: 1050px;margin: 0 auto;text-align: center;">		    
              <h3 style="position: relative;padding-top: 80px;">신상품</h3>
            <div class="total_sort list_clear">
		     <p class="list_total">
		       <span>${pageMaker.total}</span>
		       items
		      </p>
		     </div>
		    </div>
            <ul class="list"> 
            <c:set var="num" value="${pageMaker.total-((pageMaker.cri9.pageNum-1)*10)}" />
             <c:forEach items="${nlist}" var="nlist">
             <li>
              <div class="item">
               <div class="thumb"> 
                 <a href="/product/product_view.do?pseq=${nlist.pseq}">
				   <img src="${pageContext.request.contextPath}/upload/${nlist.image}" alt="">
				 </a>
               </div>
               <a class="list_info">
                <span class="list_name">${nlist.name}</span>
                <span class="list_cost">
                 <span class="list_price"><fmt:formatNumber value="${nlist.price2}"/></span>
                </span>
                <!--<span class="list_desc">${list.content}</span>  -->
                <span class="list_tag">
                <c:choose>
	                <c:when test="${nlist.kind == '1'}">샐러드</c:when>
	                <c:when test="${nlist.kind == '2'}">닭가슴살</c:when>
	                <c:when test="${nlist.kind == '3'}">다이어트 도시락</c:when>
	                <c:when test="${nlist.kind == '4'}">샌드위치</c:when>
	                <c:when test="${nlist.kind == '5'}">프로틴</c:when>
	                <c:when test="${nlist.kind == '6'}">저칼로리간식</c:when>
	                <c:when test="${nlist.kind == '7'}">무설탕음료</c:when>
	             </c:choose>
	             </span>
               </a>
              </div>
             </li>
            </c:forEach>
            </ul>
           </div>
          </div>

	     </div>
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
		<%@ include file="../footer.jsp" %>