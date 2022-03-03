<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "adminheader.jsp" %>
<body>
	<div style="margin-top:100px; margin-left:300px; width:1200px;">
	
	 <div class="container">
	 <h2><a href="/adm/orderlist.do?status=${status}">${title}</a></h2>
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
					<th>주문번호</th>
					<th>아이디</th>
					<th>주문자</th>
					<th>상품명</th>
					<th>전화</th>
					<th>주문일</th>
				</tr>
			</thead>
			<tbody class="review_box">
			<c:forEach var="list" items="${olist}">
			<c:if test ="${not empty list}">
				<tr>
					<td>${list.oseq}</td>
					<td>${list.id}</td>
					<td>${list.mname}</td>
					<td><a href="/adm/orderview.do?oseq=${list.oseq}">${list.pname}</a></td>
					<td>${list.phone}</td>
					<td>
						<fmt:parseDate var="indate" value="${list.indate}" pattern="yyyy-MM-dd"/>
						<fmt:formatDate value="${indate}" pattern="yyyy-MM-dd"/>
					</td>
				</tr>
				</c:if>
			</c:forEach>
			<c:if test="${empty olist }">
				<tr><td colspan="6">해당 주문이 없습니다</td></tr>
			</c:if>
			</tbody>
		</table>
		<div class="paging">
			<c:if test="${pageMaker.prev }">
				<a href="${pageMaker.startPage-1}"><i class="fa  fa-angle-double-left"></i></a>
			</c:if>
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<a href="${num}" class="${pageMaker.cri.pageNum == num?'active':''}">${num}</a>
			</c:forEach>
			<c:if test="${pageMaker.next }">
				<a href="${pageMaker.endPage+1}"><i class="fa  fa-angle-double-right"></i></a>
			</c:if>
			<form id="actForm" action="/adm/orderlist.do" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="type" value="${pageMaker.cri.type}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
				<input type="hidden" name="status" value="${olist[0].status}"> 
			</form>
		</div>
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