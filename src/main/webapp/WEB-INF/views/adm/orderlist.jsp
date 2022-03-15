<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "adminheader.jsp" %>

<div class="col-md-12 col-sm-12" style="margin-left:370px; width:1080px;">
	
	 <div class="container">
	 <h2 style="padding-left:10px; padding:30px 0;"><a href="/adm/orderlist.do?status=${status}">${title}</a></h2>
	  <div class="search_wrap">
		<div class="record_group float-right">
			<p>총게시글<span>${pageMaker.total}</span>건</p>
		</div>
	  </div> <!-- search end -->
	 <div class="my_review">
		<table class="table my_reviewtbl jw_table">
			<caption class="sr-only">주문관리 리스트</caption>
			<colgroup>
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="*">
				<col width="20%">
				<col width="10%">
			</colgroup>
			<thead>
				<tr>
					<th style="text-align:center;">주문번호</th>
					<th style="text-align:center;">아이디</th>
					<th style="text-align:center;">주문자</th>
					<th style="text-align:center;">상품명</th>
					<th style="text-align:center;">전화</th>
					<th style="text-align:center;">주문일</th>
				</tr>
			</thead>
			<tbody class="review_box">
			<c:forEach var="list" items="${olist}">
			<c:if test ="${not empty list}">
				<tr>
					<td style="text-align:center;">${list.oseq}</td>
					<td style="text-align:center;">${list.id}</td>
					<td style="text-align:center;">${list.mname}</td>
					<td style="text-align:center;"><a href="/adm/orderview.do?oseq=${list.oseq}">${list.pname}</a></td>
					<td style="text-align:center;">${list.phone}</td>
					<td style="text-align:center;">
						<fmt:parseDate var="indate" value="${list.indate}" pattern="yyyy-MM-dd"/>
						<fmt:formatDate value="${indate}" pattern="yyyy-MM-dd"/>
					</td>
				</tr>
				</c:if>
			</c:forEach>
			<c:if test="${empty olist }">
				<tr style="text-align:center;"><td colspan="6">해당 주문이 없습니다</td></tr>
			</c:if>
			</tbody>
	  </div>
	</div>
	<!-- end contents -->
</div>
</body>
<script>
$(function() {
	var actionForm = $("#actForm");
	
	$(".paging > a").on("click", function(e){
		e.preventDefault();
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));//현재 페이지 번호의 값을 구해서 전송해라
		actionForm.submit();
	})
	
});
</script>
</html>