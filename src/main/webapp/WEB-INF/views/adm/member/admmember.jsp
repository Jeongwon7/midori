<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../adminheader.jsp" %>

          <div class="col-md-12" style="margin-top:100px; margin-left:300px; width:1150px;">
           <h2 style="padding-left:10px; padding-bottom:30px;"><a href="/adm/member/admmember">회원 관리</a></h2>
				<div class="col-md-12">
				<div class="notice_search">
				<div class="record_group">
					<p>총회원수<span>${pageMaker.total}</span>명</p>
				</div>
				 <form class="myform" action="/adm/member/admmember" method="get" id="searchForm">
				    <select name="type" class="select">
					  <option value="I">아이디</option>
					  <option value="N">이름</option>
					  <option value="F">이메일</option>
					  <option value="P">핸드폰</option> 
					</select> <!-- ★INFP★ -->
				       <input type="text" name="keyword" class="ms_input">
				       <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
					   <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
					  <button class="btn_search fasearch" type="submit"><i class="fa fa-search"></i><span class="sr-only">검색버튼</span></button>
				  </form> 
				 </div>
					<div class="table-responsive">
					  <table class="table">
					  <caption class="sr-only">리뷰 리스트</caption>
						<colgroup>
							<col width="110">
							<col width="110">
							<col width="*">
							<col width="150">
							<col width="150">
							<col width="150">
							<col width="50">
						</colgroup>
						<thead> 
					    <tr>
					    	<th>아이디</th>
					    	<th>이름</th>
					    	<th style="text-align:center;">주소</th>
					    	<th>이메일</th>
					    	<th>핸드폰번호</th>
					    	<th>가입일</th>
					    	<th>삭제</th>
					    </tr>
					    </thead>
					    <tbody>
					    		<c:set var="num" value="${pageMaker.total-((pageMaker.cri.pageNum-1)*10)}" />
			                     <c:forEach var="list" items="${list}">
								    <tr>
								    	<td>
								    	   ${list.id}
								    	</td>
								    	<td>
								    	   ${list.name}
								    	</td>
								    	<td>
								           ${list.address1}, ${list.address2}
								        </td>
								    	<td>
								    	   ${list.email}
								    	</td>
								    	<td>
								    	   ${list.phone}
								    	</td>
								    	<td>
										 <fmt:parseDate var="indate" value="${list.indate}" pattern="yyyy-MM-dd" />
                                         <fmt:formatDate value="${indate }" pattern="yyyy-MM-dd" />
								    	</td>
								    	<td><a href='/adm/member/admmemberdelete?id=${list.id}' style="color:#000; padding-left:10px;" onClick="return confirm('삭제하시겠어요?')"><i class="fa fa-solid fa-trash"></i></a></td>
								    </tr>
								    <c:set var="num" value="${num-1}" />
								</c:forEach>
					   </tbody>
					  </table>
					<div class="notice_footer">
						 <c:if test="${pageMaker.prev}">
							<a href="${pageMaker.startPage-1}"><i class="fa  fa-angle-double-left"></i></a>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage }">
							<a href="${num}" class="${pageMaker.cri.pageNum==num?'active':''}">${num}</a>
						</c:forEach>
						<c:if test="${pageMaker.next}">
							<a href="${pageMaker.endPage+1}"><i class="fa  fa-angle-double-right"></i></a>
						</c:if>
						<div class="button_wrap">
					    	  <p class="buy"> 
					         	<a href="" class="first">회원등록</a>
					    	  </p>
					   </div>
					 </div> 
				</div>
  			</div>
  		</div>
  	</div>
</div>

  <form id="actionForm" action="/adm/member/admmember" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<input type="hidden" name="type" value="${pageMaker.cri.type}">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
	</form>
     <script>
		$(function() {
   
			var actionForm = $("#actionForm");
			
			$(".notice_footer > a").on("click", function(e) {
				e.preventDefault();
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));1
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