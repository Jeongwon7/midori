<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "../header.jsp" %>
	<!-- contents -->
	<section class="product">
		<div class="container">
			<div class="row">
			
				<div class="col-md-12 newitem">
					<h3>MyPage (주문상세 정보)</h3>
					<form method="post" name="formm">
					<h4>주문 정보</h4>
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
								<td><fmt:parseDate var="regdate" value="${od.indate}" pattern="yyyy-MM-dd"/><!-- String에서 Date타입으로 -->
									<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd"/></td>
								<td>${od.oseq}</td>
								<td>${od.mname}</td>
								<td>${od.oname}</td>
								<td><fmt:formatNumber value="${totalPrice}"/>&#x20a9;</td>
								<td>${od.address1} ${od.address2} ${od.zip_num}</td>
								<td>
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
												<span> / <a href="/review/reviewwrite.do?pseq=${od.pseq}">리뷰 작성</a></span>
											</c:otherwise>
										</c:choose>
									</td>
							</tr>
						</table>
						<h4>주문 상품 정보</h4>
						<table class="table jw_table">
							<tr>
								<th>상품명</th>
								<th>상품이미지</th>
								<th>상품별주문번호</th>
								<th>수량</th>
								<th>가격</th>
							</tr>
							<c:forEach var="list" items="${odlist}">
								<tr>
									<td>${list.pname}</td>
									<td><img src="/upload/${list.image}" alt="상품 사진"></td>
									<td>${list.odseq}</td>
									<td>${list.quantity}</td>
									<td><fmt:formatNumber value="${list.price2}"/>&#x20a9;</td>
									
								</tr>
							</c:forEach>
						</table>
						<div class="col-md-12">
							<input type="button"  value="쇼핑계속하기" onclick="location.href='/'" style="display:block; margin:0 auto;">
						</div>
					</form>
						
				</div><!-- 9 end -->
			</div><!-- row end -->
		</div>
	</section>
	<!-- contents end-->
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