<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../adminheader.jsp" %>

			<div class="col-md-10" style="margin-top:100px; margin-left:300px; width:1200px;">
				<div class="col-md-12">
					<div class="table-responsive">
					 <div class="search_wrap">
						<div class="record_group">
							<p>총게시글<span>${pageMaker.total}</span>건</p>
						</div>
						<div class="search_group">
							<form name="myform" method="get" action="/adm/product/productlist.do" id="searchForm">
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
					  <table class="table jw_table">
					    <tr>
					    	<th>상품번호</th>
					    	<th>상품명</th>
					    	<th>이미지</th>
					    	<th>원가</th>
					    	<th>판매가</th>
					    	<th>등록일</th>
					    	<th>베스트 아이템</th>
					    	<th>수정</th>
					    	<th>삭제</th>
					    </tr>
					    <c:choose>
					    	<c:when test="${list eq null}">
					    		<tr>
					    			<td colspan="7">출력 데이터가 없습니다</td>
					    		</tr>
					    	</c:when>
					    	<c:otherwise>
					    		<c:forEach items="${list}" var="list">
								    <tr>
								    	<td>${list.pseq}</td>
								    	<td>${list.name}</td>
								    	<td><img src="/upload/${list.image}" style="width:30px;"></td>
								    	<td><fmt:formatNumber value="${list.price1}"/></td>
								    	<td><fmt:formatNumber value="${list.price2}"/></td>
								    	<td><fmt:parseDate var="regdate" value="${list.indate}" pattern="yyyy-MM-dd"/>
											<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd"/></td>
								    	<td>${list.bestyn}</td>
								    	<td onclick="location.href='/adm/product/productModify.do?pseq=${list.pseq}&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}'"><i class="fa fa-solid fa fa-pen"></i></td>
								    	<td onclick="product_delete(${list.pseq})"><i class="fa fa-solid fa-trash"></i></td>
								    </tr>
								</c:forEach>
							 </c:otherwise>
					    </c:choose>
					  </table>
					 <div class="paging" style="text-align: center;">
						<c:if test="${pageMaker.prev }">
							<a href="${pageMaker.startPage-1}"><i class="fa  fa-angle-double-left"></i></a>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<a href="${num}" class="${pageMaker.cri.pageNum == num?'active':''}">${num}</a>
						</c:forEach>
						<c:if test="${pageMaker.next }">
							<a href="${pageMaker.endPage+1}"><i class="fa  fa-angle-double-right"></i></a>
						</c:if>
						<form id="actionForm" action="/adm/product/productlist.do" method="get">
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
							<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
							<input type="hidden" name="type" value="${pageMaker.cri.type}">
							<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
						</form>
					</div>
						<button type="button" class="btn btn-danger writer pull-right" style="float: right;" onclick="go_write()">글쓰기</button>
					</div>
				</div>
  			</div>
  		</div>
  	</div>
</div>
<script>
function product_delete(pseq){
	var msg = confirm("삭제하시겠습니까?");
	if(msg){
		alert("삭제되었습니다");
		location.href="/adm/productDelete.do?pseq="+pseq;
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
  </body>
  </html>