<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

  <div class="col-md-9">
     <div class="container">
	   <div class="row">
		<div class="order">
		 <h2>주문/결제</h2>
		 <div class="order_body">
		  <form name="orderfrm" method="post" >
		   		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		 		<input type="hidden" name="cseq" value="${cartlist[0].cseq}">
		 		<input type="hidden" name="pseq" value="${cartlist[0].pseq}">
		 		<input type="hidden" name="quantity" value="${cartlist[0].quantity}">
           <h3>주문 정보</h3>
           <div class="tbl_order">
            <table class="jw_table"style="width:825px;">
			      <colgroup>
			       <col width="70">
			       <col width="70">
			       <col width="*">
			       <col width="90">
			       <col width="90">
			      </colgroup>
			      <thead>
			       <tr>
			       <th scope="col">
                     <div class="tb_center">
                                                   번호
                     </div>			        
			        </th>
			        <th scope="col">
                     <div class="tb_center">
                                                   사진
                     </div>			        
			        </th>
			        <th scope="col">
			         <div class="tb_center">
			                         상품명
			         </div>
			        <th scope="col">
			         <div class="tb_center">
			                        가격
			         </div>
			        </th>
			        <th scope="col">
			         <div class="tb_center">
			                         수량
			         </div>
			        </th>
			       </tr>
			      </thead>
			        <tbody><!-- 티바디 시작 -->
			        <c:set var="num" value="${cartlist.size()-(cartlist.size()-1)}"/>
			        <c:forEach var="list" items="${cartlist}">
			         <tr>	
			         <td>
			           <div class="tb_center">
			             ${num}
			           </div>
			          </td>
			          <td>
			           <div class="tb_center">
			            <div class="thumb">
			             <a href="">
			              <img src="/upload/${list.image}">
			             </a>
			            </div>
			           </div>
			          </td>
			          <td>
			           <div class="tb_center">
			            <a href="">${list.pname}</a>
			           </div>
			          </td>
			          <td>
			           <div class="tb_center">
			            <span>${list.price2}</span>원
			           </div>
			          </td>
			          <td>
			           <div class="tb_center">
			             <span>${list.quantity}</span>
			           </div>
			          </td>
			         </tr>
			         <c:set var="num" value="${num+1}" />
			         </c:forEach>
			        </tbody><!-- tbody end -->
			        <tfoot class="tfoot_right">
			         <tr>
			          <td colspan="10">
			                           총금액
			            <strong>
			            	<fmt:formatNumber value="${totalPrice}"/>
			            <span class="displaynone">()</span>
		                </strong>
		                 <span class="displaynone"></span>
		                 + 배송비 3,000
		                 <span class="displaynone"></span>
		                 = 합계 : 
		                 <strong class="txtEm">
		                  <span class="txt18"><fmt:formatNumber value="${totalPrice+3000}"/></span>
		                                       원
		                 </strong>
		                  <span class="displaynone"></span>             
			          </td>
			         </tr>
			        </tfoot>
			     </table>
			    </div>
			    <h3>배송정보 </h3>
			    <div class="tbl_order">
			     <table class="address_table">
			      <colgroup>
			       <col width="130">
			       <col>
			       <col width="100">
			       <col>
			      </colgroup>
			      <tbody>
			       <tr>
			        <th scope="row">
			         <div class="txt-1">받는사람</div>
			        </th>
			        <td colspan="3">
			         <input type="text" name="oname" id="oname" style="margin:0;" value="${mvo.name}">
			        </td>
			       </tr>
			       <tr>
			        <th scope="row">
			         <div class="txt-1">연락처</div>
			        </th>
			        <td colspan="3">
			         <input type="text" name="phone" id="phone" style="margin:0;" value="${mvo.phone}">
			        </td>
			       </tr>
			       <tr>
			        <th scope="row">
			         <div class="txt-1">배송지</div>
			        </th>
			        <td colspan="3">
			          <input id="member_post" class="w60" name="zip_num"  type="text"  value="${mvo.zip_num}" readonly >
					  <input type="button"  value="우편번호" onclick="findAddr()" class="btn-white"><br>
					 <div class="address">
					  <strong class="address1">주소</strong>
	  				  <input id="member_addr" name="address1" type="text" class="form-control w240" style="float:left;" value="${mvo.address1}" readonly>
	 				  <strong class="address2">상세 주소</strong>
	 				  <input type="text" name="address2" class="form-control w240" value="${mvo.address2}" style="position: relative;left: 10px;">
			         </div>
			        </td>
			       </tr>
			      </tbody>
			     </table>
			    </div>
		     </form>
		 </div>
		   <div class="order_footer" style="float:left;">
	    		<div class="button_wrap">
	    		  <p class="buy">
	    		  <!-- 뷰페이지에서 바로 결제할 경우까지 생각해야 돼서 온클릭을 뒤로가기 함수로 바꿨어요!-->
	    		  <a href="#" class="first" onclick="history.back();">뒤로가기</a>
	    		  </p>
	    		  <p class="cart">
	    		  <a href="#" class="first" onclick="orderInsert()"  >결제하기</a><!-- id="check_module"  -->
	    		  </p>
	    		</div>
	    	  </div>
		</div>      
	   </div>
	 </div>   
  </div>
 
</body>
<script type="text/javascript">
$(function(){
	var name = "";
	
	if("${cartlist.size()-1}" == 0){
		name = "${cartlist[0].pname}";
	}else{
		name = "${cartlist[0].pname}"+" 외"+"${cartlist.size()-1}"+"건";
	}

    $("#check_module").click(function () {
    	var IMP = window.IMP; // 생략가능
    	IMP.init('imp78738453');
    	IMP.request_pay({
    	pg: 'inicis', // version 1.1.0부터 지원.
    	pay_method: 'card',
    	merchant_uid: 'merchant_' + new Date().getTime(),
    	name: name,
    	//결제창에서 보여질 이름
    	amount: "${totalPrice+3000}",
    	//가격
    	buyer_email: '${mvo.email}',
    	buyer_name: '${mvo.name}',
    	buyer_tel: '${mvo.phone}',
    	buyer_addr: '${mvo.address1}'+'${mvo.address2}',
    	buyer_postcode: '${mvo.zip_num}',
    	m_redirect_url: '/'
    	/*
    	모바일 결제시,
    	결제가 끝나고 랜딩되는 URL을 지정
    	(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
    	*/
    	}, function (rsp) {
    	console.log(rsp);
    	if (rsp.success) {
    	var msg = '결제가 완료되었습니다.';
    	msg += '고유ID : ' + rsp.imp_uid;
    	msg += '상점 거래ID : ' + rsp.merchant_uid;
    	msg += '결제 금액 : ' + rsp.paid_amount;
    	msg += '카드 승인번호 : ' + rsp.apply_num;
    	
    	orderInsert();
    	
    	} else {
    	var msg = '결제에 실패하였습니다.';
    	msg += '에러내용 : ' + rsp.error_msg;
    	}
    	alert(msg);
    	});
    	});
}); 
function orderInsert(){
	document.orderfrm.action = "/order/orderInsert.do";
	document.orderfrm.submit();
}
</script>
