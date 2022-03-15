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
                <li class="">
                 <a href="../order/orderall">총 주문 내역</a>
                </li>
                <li>
                 <a href="../member/memberModify.do">개인 정보 변경</a>
                </li>
               </ul>
              </div>
          </div>
		 <div class="page_section section_myinfo type_form">
           <div class="head_aticle">
            <h2 class="tit">주문 상세 페이지</h2>
           </div>
               <div class="mypage_order">
		         <div class="field_email">
		          <div class="tbl_comm" style="border-bottom: 1px solid #333;">
						<table class="table jw_table">
							<tr>
								<th>주문일자</th>
								<th>주문번호</th>
								<th>주문자</th>
								<th>받는 사람</th>
								<th>주문총액</th>
								<th>배송지</th>
								<th>처리상태</th>
							</tr>
							<tr>
								<td style="padding-left:10px"><fmt:parseDate var="regdate" value="${od.indate}" pattern="yyyy-MM-dd"/><!-- String에서 Date타입으로 -->
									<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd"/></td>
								<td style="padding-left:10px">${od.oseq}</td>
								<td style="padding-left:10px">${od.mname}</td>
								<td style="padding-left:10px">${od.oname}</td>
								<td style="padding-left:10px"><fmt:formatNumber value="${totalPrice}"/>&#x20a9;</td>
								<td style="padding-left:10px">${od.address1} ${od.address2} ${od.zip_num}</td>
								<td style="padding-left:10px">
										<c:choose>
											<c:when test="${status == 1}">
												<span>입금 확인</span>
											</c:when>
											<c:when test="${status == 2}">
												<span>배송 준비</span>
											</c:when>
											<c:when test="${status == 3}">
												<span>배송중 / </span>
												<span><a id="confirm">구매확정</a></span>
												<br>
												<span>CJ대한통운</span><!-- 일본 택배사도 가능하긴 한데 데이터 타입을 모르겟음 -->
												<br>
												<span><a href="https://tracker.delivery/#/kr.cjlogistics/${od.track }" 
													onclick="window.open(this.href, '_blank', 'width=800, height=600'); 
													return false;">[${od.track}]</a>
												</span>
											</c:when>
											<c:otherwise>
												<span style="color:#f00;">배송 완료</span>
											</c:otherwise>
										</c:choose>
									</td>
							</tr>
						</table>
					  </div>
					  <div class="head_aticle">
						<h2 class="tit" style="padding-top:20px;">주문 상품 정보</h2>
					 </div>
					 <div class="tbl_comm" style="border-bottom: 1px solid #333;">
						<table class="table jw_table">
							<tr>
								<th>상품명</th>
								<th>상품이미지</th>
								<th>상품별주문번호</th>
								<th>수량</th>
								<th>가격</th>
								<th>처리상태</th>
							</tr>
							<c:forEach var="list" items="${odlist}">
								<tr>
									<td style="padding-left:10px">${list.pname}</td>
									<td style="padding-left:10px"><img src="/upload/${list.image}" alt="상품 사진" style="width:40px;"></td>
									<td style="padding-left:10px">${list.odseq}</td>
									<td style="padding-left:10px">${list.quantity}</td>
									<td style="padding-left:10px"><fmt:formatNumber value="${list.price2}"/>&#x20a9;</td>
									<td style="padding-left:10px">
										<c:choose>
											<c:when test="${status == 1}">
												<span>입금 확인</span>
											</c:when>
											<c:when test="${status == 2}">
												<span>배송 준비</span>
											</c:when>
											<c:when test="${status == 3}">
												<span>배송중 / </span>
												<span><a id="confirm">구매확정</a></span>
												<br>
												<span>CJ대한통운</span>
												<br>
												<span><a href="https://tracker.delivery/#/kr.cjlogistics/${od.track }" 
													onclick="window.open(this.href, '_blank', 'width=800, height=600'); 
													return false;">[${od.track}]</a>
												</span>
											</c:when>
											<c:otherwise>
												<span style="color:#f00;">배송 완료</span>
												<span> / <a href="/review/reviewwrite.do?pseq=${list.pseq}">리뷰 작성</a></span>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</table>
					   </div>
						<div class="join_footer">
						  <button type="button" class="btn_back1" onclick="location.href='/product/product_list'">
						   <span class="txt_type">쇼핑계속하기</span>
						  </button>
						</div>
				</div><!-- 9 end -->
			 </div>
			</div>
		</div>
	</div>
</body>
<script>
	$("#confirm").click(function(){
		var msg = confirm("구매확정 하시겠습니까? (환불 교환 불가)");
		if(msg == true){
			alert("구매확정되었습니다");
			var url = "/mypage/orderconfirm.do?oseq="+${od.oseq};    
			$(location).attr('href',url);
		}
	})
</script>
<%@ include file = "../footer.jsp" %>