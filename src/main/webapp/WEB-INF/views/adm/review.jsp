<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "adminheader.jsp" %>
<body>
	<div class="col-md-12 col-sm-12" style="margin-left:370px; width:1100px;">
	<h2 style="padding-left:10px; padding:30px 0;"><a href="/adm/review.do">상품리뷰 관리</a></h2>
	<!-- <div class="container"> -->
	  <div class="search_wrap">
		<div class="record_group">
			<p>총게시글<span>${pageMaker.total}</span>건</p>
		</div>
		<div class="search_group">
			<form name="myform" method="get" action="/adm/review.do" id="searchForm">
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
	 <div class="my_review">
		<table class="table table-hover my_reviewtbl jw_table">
			<caption class="sr-only">리뷰 리스트</caption>
			<colgroup>
				<col width="10%">
				<col width="10%">
				<col width="15%">
				<col width="*">
				<col width="5%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>카테고리</th>
					<th>상품명</th>
					<th>제목</th>
					<th>별점</th>
					<th>아이디</th>
					<th>등록일</th>
					<th>관리</th>
				</tr>
			</thead>
			<tbody class="review_box">
			<c:set var="num" value="${pageMaker.total - ((pageMaker.cri.pageNum-1) * 10)}"/>
			<c:forEach var="list" items="${rlist}">
			<c:if test ="${not empty list}">
				<tr class="item">
					<td>${num}</td>
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
					<td class="title">${list.title}</td>
					<td>${list.star}/5 </td>
					<td>${list.writer}</td>
					<td>
						<fmt:parseDate var="regdate" value="${list.regdate }" pattern="yyyy-MM-dd"/><!-- String에서 Date타입으로 -->
						<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd"/><!-- 날짜 형식을 출력 -->
					</td>
					<td style="text-align:center;">
						<a style="color:#000; padding-left:10px;" onClick="review_deleteOpen(${list.rbno})"><i class="fa fa-solid fa-trash"></i></a>
					</td>
				</tr>
				<tr class="hide">
					<td colspan="8">
						<div class="review_content_wrap">
							<div class="review_content">
								${list.content}
							</div>
						</div>
					</td>
				</tr>
				</c:if>
				<c:set var="num" value="${num-1}" />
			</c:forEach>
			<c:if test="${empty rlist }">
				<tr><td colspan="8" style="text-align:center;">상품 후기가 없습니다</td></tr>
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
			<form id="actionForm" action="/adm/review.do" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="kind" value="${pageMaker.cri.kind}">
			</form>
		</div>
	  </div>
	<!-- </div> -->
	<!-- end contents -->
</div>
</body>
<script>
function review_deleteOpen(rbno){
	var msg = confirm("삭제하시겠습니까?");
	if(msg){
		alert("삭제되었습니다");
		location.href="/adm/reviewdelete.do?rbno="+rbno;
	}
}

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
<script>
	$(function(){ 

        var article = (".my_reviewtbl .my_show");  
        
        $(document).on('click', '.my_reviewtbl .item  td', function() { 

            var myArticle =$(this).parents().next("tr");  

            if($(myArticle).hasClass('hide')) {

                $(article).removeClass('my_show').addClass('hide');  

                $(myArticle).removeClass('hide').addClass('my_show');  

            }  

            else {  

                $(myArticle).addClass('hide').removeClass('my_show');  

            }  

        }); 
});  
	</script>
</html>