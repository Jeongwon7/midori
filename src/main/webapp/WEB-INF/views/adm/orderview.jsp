<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "adminheader.jsp" %>
<body>
	<div class="col-md-12 col-sm-12" style="margin-left:250px; width:1100px;">
			<div class="container">
			<div class="row">
				<div class="col-md-12 newitem" style="margin-left: 110px;">
					<h2 style="padding-left:10px; padding:30px 0;">주문관리 (주문상세 정보)</h2>
					<h3 class="jw_h3">주문자 정보</h3>
						<table class="table jw_table">
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
					<h3 class="jw_h3">배송 정보</h3>
						<table class="table jw_table">
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
						<h3 class="jw_h3">주문 상품 정보</h3>
						<table class="table jw_table">
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
									<td><img src="/upload/${list.image}" alt="상품 사진" style="width:40px;"></td>
									<td>${list.quantity}</td>
									<td>${list.price2}&#x20a9;</td>
									
								</tr>
							</c:forEach>
						</table>
						<div >
						<div class="col-md-12 jw_float" style="margin: 50px 50px 50px 300px; display:inline-block; text-align:center;">
							<form name="opfrm" method="post">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
								<input type="hidden" name="status" value="${status}">
								<input type="hidden" name="oseq" value="${od.oseq}">
							<c:choose>
								<c:when test="${status == 1}">
									<input type="button" class="rarara" value="입금확인" onclick="orderPro1()" style="width: 100px; height: 50px; margin-left:100px;">
									<input type="button" class="rarara" value="목록으로" onclick="history.back()" style="width: 100px; height: 50px;  margin-left:10px;">
								</c:when>
								<c:when test="${status == 2}">
									<input type="text" class="form-control jw_btn" name="track" placeholder="운송장번호 입력" style="width: 200px; height: 50px; margin-right: 10px;">
									<input type="button" class="rarara" value="발송처리" onclick="orderPro2()" style="width: 100px; height: 50px; margin-right:10px;">
									<input type="button" class="rarara" value="목록으로" onclick="history.back()" style="width: 100px; height: 50px;">
								</c:when>
								<c:otherwise>
									<input type="button" class="rarara" value="목록으로" onclick="history.back()" style="width: 100px; height: 50px; margin-left:160px;">
								</c:otherwise>
							</c:choose>
							</form>
						</div>
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