<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../mypage/mypageHeader.jsp" %>

 <div class="col-md-9">
     <div class="container">
	   <div class="row">
		<div class="mypage">
		 <div class="mypage_head">
		   <strong><a href="/order/orderall.do">${title}</a></strong> 
		 </div>
		 <div class="search_table_body">
		 <form method="post" name="formm">
		   <table class="mypage_table">
		    <colgroup>
		     <col width="110">
		     <col width="100">
		     <col width="*">
		     <col width="110">
		     <col width="90">
		    </colgroup>
		    <thead>
		     <tr>
		      <th scope="col">
		       <div class="tb_center">주문일자</div>
		      </th> 
		      <th scope="col">
		       <div class="tb_center">주문번호</div>
		      </th>
		      <th scope="col">
		       <div class="tb_center">상품명</div>
		      </th>
		      <th scope="col">
		       <div class="tb_center">결제금액</div>
		      </th>
		      <th scope="col">
		       <div class="tb_center">주문상세</div>
		      </th>
		     </tr>
		    </thead>
		    <tbody>
		    <c:forEach items="${orderList}" var="mvo">
		     <tr>
		      <td>
		       <div class="tb_center">
		       <fmt:parseDate var="indate" value="${mvo.indate}" pattern="yyyy-MM-dd" />
               <fmt:formatDate value="${indate }" pattern="yyyy-MM-dd" />
               </div>
		      </td>
		      <td>
		       <div class="tb_center">${mvo.oseq}</div>
		      </td>
		      <td>
		       <div class="tb_center">${mvo.pname}</div>
		      </td>
		      <td>
		       <div class="tb_center"><fmt:formatNumber value="${mvo.price2}" type="currency"/></div>
		      </td>
		       <td>
		       <div class="tb_center"><a href="/mypage/orderdetail.do?oseq=${mvo.oseq}">조회</a></div>
		      </td> 
		     </tr>
		    </c:forEach>
		   </tbody> 
		  </table>
		 </form>
		</div>
		<div class="mypage_footer">
		  <input type="button" class="btn btn-default" value="쇼핑계속하기" onclick="location.href='/product/product_list'">
		</div>
	   </div>
	  </div>
	 </div>
  </div> 