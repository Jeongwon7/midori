<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="mypageHeader.jsp" %>

	<div class="col-md-9">
		<!-- <div class="container">
		   <div class="row"> -->
			 <div class="tit_page">
               <h2 class="shopping_header">
                 <img src="../assets/img/shoppingcart.png">
               </h2>
			 </div> 
			 <div class="page-body">
			   <h3 class="tit-cart">
			    <img src="../assets/img/titcart.png">
			   </h3>
			   <div class="table_cart">
			    <form method="post" name="formm" id="cartform">
			    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			    <c:choose>
			        <c:when test="${cartList.size() == 0}">
	    					<h3>장바구니가 비어 있습니다</h3>
	    			</c:when>
	    		 <c:otherwise> 
			     <table style="width:825px;">
			      <colgroup> 
			       <col width="70">
			       <col width="70">
			       <col width="*">
			       <col width="110">
			       <col width="90">
			      </colgroup>
			      <thead>
			       <tr>
			        <th scope="col">
			         <div class="tb_center">
			          <input type="checkbox" id="chkCrtl" checked>
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
			        <tbody>
			        <c:forEach items="${cartList}" var="cartVO">
			         <tr>	 
			          <td>
			           <div class="tb_center">
			            <input type="checkbox" name="cseq" id="cseq" value="${cartVO.cseq}" checked>
			           </div>
			          </td>
			          <td>
			           <div class="tb_center">
			            <div class="thumb">
			             <a href="/product/product_view.do?pseq=${cartVO.pseq}">
			              <img src="${pageContext.request.contextPath}/upload/${cartVO.image}">
			             </a>
			            </div>
			           </div>
			          </td>
			          <td>
			           <div class="tb_center">
			            <a href="/product/product_view.do?pseq=${cartVO.pseq}">${cartVO.pname}</a>
			           </div>
			          </td>
			          <td>
			           <div class="tb_center">
			            <span><fmt:formatNumber value="${cartVO.price2*cartVO.quantity}" type="currency"/></span>
			           </div>
			          </td>
			          <td>
			           <div class="tb_center">
	    				 ${cartVO.quantity}
			           </div>
			          </td>
			         </tr>
			        </c:forEach>
			        </tbody>
			        <tfoot class="tfoot_right">
			         <tr>
			          <td colspan="10">
			            <a onclick="goCartDelete()" class="cart_delete"><strong>삭제</strong></a>
			                           총금액
			            <strong>
			             <fmt:formatNumber value="${totalPrice}" type="currency"/>
			            <span class="displaynone">()</span>
		                </strong>
		                 <span class="displaynone"></span>
		                 + 배송비 3,000
		                 <span class="displaynone"></span>
		                 = 합계 : 
		                 <strong class="txtEm">
		                  <span class="txt18"><fmt:formatNumber value="${totalPrice+3000}" type="currency"/></span>
		                                       원
		                 </strong>
		                  <span class="displaynone"></span>             
			          </td>
			         </tr>
			        </tfoot>
			     </table>
			     </c:otherwise>
			     </c:choose>
			    </form>
			   </div>
			   <div class="order_footer">
	    		<div class="button_wrap">
	    		  <p class="buy">
	    		  <a href="#" class="first" onclick="goOrderInfo()">주문하기</a>
	    		  </p>
	    		  <p class="cart">
	    		  <a href="#" class="first" onclick="location.href='/'">뒤로가기</a>
	    		  </p>
	    		</div>
	    	  </div>
			 </div>
		   </div>
	 	</div>
	</div>
	</div>
	</body>
	<script>
		$(function() {
		
			var chkList= $("input[name=cseq]");
			
			$("#chkCrtl").click(function() {
				if($(this).is(":checked")) { //전체동의 체크 상태이면
					chkList.prop("checked", true);
				}else{
					chkList.prop("checked", false);
				}
			})
			
			$("#cseq").on("click", function() {
				if($("#cseq").is(":checked") == true) {
					$("#chkCtrl").prop("checked", true);
				}else{
					$("#chkCtrl").prop("checked", false);
				}
				
			})
		});
		
		function goCartDelete(){
			
			var count = 0;
			
			if(document.formm.cseq.length == undefined){//checkbox input이 한 개일 때
				if(document.formm.cseq.checked == true){
					count++;
				}
			}
			
			for(var i=0 ; i<document.formm.cseq.length ; i++){
				if(document.formm.cseq[i].checked == true){
					count++;
				}
			}
			if(count == 0){
				alert("삭제할 상품을 선택하세요");
				
			}else{
				document.formm.action="/mypage/cartDelete.do";
				document.formm.submit();//배열 형태로 체크된 값이 넘어간다
			}
		}

		function goOrderInfo(){
			var form = document.getElementById('cartform');
			form.action = "/order/orderinfo.do";
			form.submit();
		}
	</script>