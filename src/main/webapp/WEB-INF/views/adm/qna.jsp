<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "adminheader.jsp" %>
<body>
	<div style="margin-top:100px; margin-left:300px; width:1200px;">
	<h2 style="margin-bottom: 30px;">상품문의 관리</h2>
	<!-- <div class="container"> -->
	  <div class="search_wrap">
		<div class="record_group">
			<p>총게시글<span>${pageMaker.total}</span>건</p>
		</div>
		<div class="search_group">
			<form name="myform" method="get" action="/adm/qna.do" id="searchForm">
				<select name="kind" class="select">
					<option value="">선택</option>
					<option value="1">샐러드</option>
					<option value="2">닭가슴살</option>
					<option value="3">다이어트도시락</option>
					<option value="4">샌드위치</option>
					<option value="5">프로틴</option>
					<option value="6">저칼로리간식</option>
					<option value="7">무설탕음료</option>
				</select>
				<!-- <input type="text" name="keyword" class="search_word"> -->
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
            	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<button class="btn_search" type="submit"><i class="fa fa-search"></i><span class="sr-only">검색버튼</span></button>
			</form>
		</div>
	  </div> <!-- search end -->
	 <div class="my_review" style="margin-top:100px;">
		<table class="table table-hover my_reviewtbl jw_table">
			<caption class="sr-only">상품문의 리스트</caption>
			<colgroup>
				<col width="5%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="*">
				<col width="10%">
				<col width="10%">
				<col width="10%">
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>문의분류</th>
					<th>카테고리</th>
					<th>상품명</th>
					<th>제목</th>
					<th>답변상태</th>
					<th>아이디</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody class="review_box">
			<c:set var="num" value="${pageMaker.total - ((pageMaker.cri.pageNum-1) * 10)}"/>
			<c:forEach var="list" items="${qnaList}">
			<c:if test ="${not empty list}">
				<tr>
					<td>${num}</td>
					<c:choose>
						<c:when test="${list.category eq 1 }">
							<td>상품문의</td>
						</c:when>
						<c:when test="${list.category eq 2 }">
							<td>배송문의</td>
						</c:when>
						<c:otherwise>
							<td>기타문의</td>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${list.kind eq '1'}">
							<td>샐러드</td>
						</c:when>
						<c:when test="${list.kind eq '2'}">
							<td>닭가슴살</td>
						</c:when>
						<c:when test="${list.kind eq '3'}">
							<td>다이어트도시락</td>
						</c:when>
						<c:when test="${list.kind eq '4'}">
							<td>샌드위치</td>
						</c:when>
						<c:when test="${list.kind eq '5'}">
							<td>프로틴</td>
						</c:when>
						<c:when test="${list.kind eq '6'}">
							<td>저칼로리간식</td>
						</c:when>
						<c:otherwise>
							<td>무설탕음료</td>
						</c:otherwise>
					</c:choose>
					<td>${list.pname }</td>
					<td class="title"><a href="/adm/qnaview.do?qbno=${list.qbno}">${list.qtitle}</a></td>
					<c:choose>
						<c:when test="${list.status == 1}">
							<td>답변대기</td>
						</c:when>
						<c:otherwise>
							<td>답변완료</td>
						</c:otherwise>
					</c:choose>
					<td>${list.qwriter}</td>
					<td>
						<fmt:parseDate var="regdate" value="${list.qregdate}" pattern="yyyy-MM-dd"/><!-- String에서 Date타입으로 -->
						<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd"/><!-- 날짜 형식을 출력 -->
					</td>
				</tr>
				</c:if>
				<c:set var="num" value="${num-1}" />
			</c:forEach>
			<c:if test="${empty qnaList }">
				<tr><td colspan="8" style="text-align:center;">상품 문의가 없습니다</td></tr>
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
			<form id="actionForm" action="/adm/qna.do" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="type" value="${pageMaker.cri.type}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
			</form>
		</div>
	  </div>
	<!-- </div> -->
	<!-- end contents -->
</div>
</body>
<script>

$(function() {
	var actionForm = $("#actionForm");
	
	$(".paging > a").on("click", function(e){
		e.preventDefault();
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));//현재 페이지 번호의 값을 구해서 전송해라
		actionForm.submit();
	})
	
	var searchForm = $("#searchForm");
	
	$("#searchForm button").on("click", function(e) {
		if(!searchForm.find("option:selected").val()){
			alert("검색종류를 선택하세요");
			return false;
		}
		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();
		
		searchForm.submit();
	})
});
</script>
</html>