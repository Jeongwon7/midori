<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../mainheader.jsp" %>

 <div class="midori_main">
	  <div class="tit_page"style="padding-top:100px;">
        <div class="sub_my">
          <h2 class="tit_snb">마이페이지</h2>
           <div class="inner_snb">
             <ul class="mypage_menu" style="padding-left:0px;">
             	 <li>
                 <a href="../mypage/cart_list">장바구니</a>
                </li>
                <li>
                 <a href="../order/ordering">진행중인 주문 내역</a>
                </li>
                <li class="on">
                 <a href="../order/orderall">총 주문 내역</a>
                </li>
                <li>
                 <a href="../member/email.do">개인 정보 변경</a>
                </li>
               </ul>
              </div>
          </div>
		 <div class="page_section section_myinfo type_form">
           <div class="head_aticle">
            <h2 class="tit">총 주문 내역</h2>
           </div>
        <div class="mypage_order">
         <div class="field_email">  
		 <form method="post" name="formm">
		  <div class="tbl_comm" style="padding-left:0px; border-bottom: 1px solid #333;">
		   <table class="mypage_table" style="margin-top:10px; width:100%;">
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
		       <div class="or_center">주문일자</div>
		      </th> 
		      <th scope="col">
		       <div class="or_center">주문번호</div>
		      </th>
		      <th scope="col">
		       <div class="or_center">상품명</div>
		      </th>
		      <th scope="col">
		       <div class="or_center">결제금액</div>
		      </th>
		      <th scope="col">
		       <div class="or_center">주문상세</div>
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
		 </div>
		 </form>
		</div>
		<div class="join_footer">
		  <button type="button" class="btn_back1" onclick="location.href='/product/product_list'">
		   <span class="txt_type">쇼핑계속하기</span>
		  </button>
		</div>
	   </div>
	  </div>
	 </div>
  </div> 
	<%@ include file="../footer.jsp" %>