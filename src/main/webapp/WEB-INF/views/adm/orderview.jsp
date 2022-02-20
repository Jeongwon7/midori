<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "adminheader.jsp" %>
<body>
	<div style="margin-top:100px; margin-left:300px;">
			<div class="container">
			<div class="row">
				<div class="col-md-12 newitem">
					<h2>주문관리 (주문상세 정보)</h2>
					<h3>주문자 정보</h3>
						<table class="table">
							<tr>
								<th>주문일자</th>
								<th>주문번호</th>
								<th>주문자</th>
								<th>아이디</th>
								<th>주문총액</th>
								<c:if test="${status == 3 or status == 4}">
								<th>배송조회</th>
								</c:if>
							</tr>
							<tr>
								<td><fmt:parseDate var="regdate" value="${od.indate}" pattern="yyyy-MM-dd"/><!-- String에서 Date타입으로 -->
									<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd"/></td>
								<td>${od.oseq}</td>
								<td>${od.mname}</td>
								<td>${od.id}</td>
								<td>${totalPrice}&#x20a9;</td>
								<c:if test="${status == 3 or status == 4}">
									<td>
										<span>CJ대한통운</span>
										<br>
										<span><a href="https://tracker.delivery/#/kr.cjlogistics/${od.track }" 
											onclick="window.open(this.href, '_blank', 'width=800, height=600'); 
											return false;">[${od.track}]</a>
										</span>
									</td>
								</c:if>
							</tr>
						</table>
					<h3>배송 정보</h3>
						<table class="table">
							<tr>
								<th>수취인</th>
								<th>우편번호</th>
								<th>주소</th>
								<th>상세주소</th>
							</tr>
							<tr>
								<td>${od.oname}</td>
								<td>${od.zip_num}</td>
								<td>${od.address1}</td>
								<td>${od.address2}</td>
							</tr>
						</table>
						<h3>주문 상품 정보</h3>
						<table class="table">
							<tr>
								<th>상품별주문번호</th>
								<th>상품명</th>
								<th>이미지</th>
								<th>수량</th>
								<th>가격</th>
							</tr>
							<c:forEach var="list" items="${odlist}">
								<tr>
									<td>${list.odseq}</td>
									<td>${list.pname}</td>
									<td><img src="/upload/${list.image}" alt="상품 사진"></td>
									<td>${list.quantity}</td>
									<td>${list.price2}&#x20a9;</td>
									
								</tr>
							</c:forEach>
						</table>
						<div class="col-md-12">
							<form name="opfrm" method="post">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
								<input type="hidden" name="status" value="${status}">
								<input type="hidden" name="oseq" value="${od.oseq}">
							<c:choose>
								<c:when test="${status == 1}">
									<input type="button" value="입금확인" onclick="orderPro1()">
								</c:when>
								<c:when test="${status == 2}">
									<input type="text" name="track" placeholder="운송장번호 입력">
									<input type="button" value="발송처리" onclick="orderPro2()">
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
							</form>
							<input type="button" value="목록으로" onclick="history.back()">
						</div>
				</div><!-- 9 end -->
			</div><!-- row end -->
		</div>
		
	
	</div>
</body>
</html>
<script>
	function orderPro1(){
		var theForm = document.opfrm;
		var msg = confirm("임급확인 하시겠습니까?");
		if(msg == true){
			alert("입금확인 처리되었습니다")
			theForm.action = "/adm/orderstatuspro.do";
			theForm.submit();
		}
	}
	function orderPro2(){
		var theForm = document.opfrm;
		
		if(!theForm.track.value){
			alert("운송장 번호 입력하세요");
			theForm.track.focus();
		}else{
			var msg = confirm("발송처리 하시겠습니까?");
			if(msg == true){
				alert("발송 처리되었습니다")
				theForm.action = "/adm/orderstatuspro.do";
				theForm.submit();
			}
		}//else
	}
</script>