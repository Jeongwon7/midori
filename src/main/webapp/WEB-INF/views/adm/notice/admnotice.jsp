<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../adminheader.jsp" %>

          <div class="col-md-12 col-sm-12" style="margin-left:370px; width:1100px;">
           <h2 style="padding-left:10px; padding:30px 0;"><a href="/adm/notice/admnotice">공지사항 관리</a></h2>
				<div class="notice_search">
				  <form class="myform" action="admnotice" method="get" id="searchForm">
				    <select name="type" class="select">
					  <option value="T">제목</option>
					  <option value="C">내용</option>
					  <option value="W">글쓴이</option>
					</select>
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
							<col width="100">
							<col width="*">
							<col width="110">
							<col width="110">
							<col width="80">
							<col width="80">
						</colgroup>
						<thead>
					    <tr >
					    	<th style="text-align:center;">번호</th>
					    	<th style="text-align:center;">제목</th>
					    	<th style="text-align:center;">작성자</th>
					    	<th style="text-align:center;">등록일</th>
					    	<th style="text-align:center;">수정</th>
					    	<th style="text-align:center;">삭제</th>
					    </tr>
					    </thead>
					    <tbody>
					    <c:choose>
					    	<c:when test="${list eq null}">
					    		<tr>
					    			<td colspan="7">공지사항이 없습니다</td>
					    		</tr>
					    	</c:when>
					    	<c:otherwise>
					    		<c:set var="num" value="${pageMaker.total-((pageMaker.cri.pageNum-1)*10)}" />
			                     <c:forEach var="list" items="${list}">
								    <tr>
								    	<td><div style="text-align:center;">${num}</div>
								    	<fmt:parseDate var="kbs" pattern="yyyy-MM-dd" value="${list.regdate}"/>
								    	</td>
								    	<td>
								    	 <div class="notice_title" style="text-align:center;">
								    	   <a href="/adm/notice/admnoticeview.do?bno=${list.bno}&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">
								            <strong>${list.title}</strong>
								           </a>
								         </div>
								        </td>
								    	<td style="text-align:center;">${list.writer}</td>
								    	<td style="text-align:center;"><fmt:formatDate var="mbc" pattern="yyyy-MM-dd" value="${kbs}"/>${mbc}</td>
								    	<td style="text-align:center;"><a href='/adm/notice/admnoticemodify?bno=${list.bno}' style="color:#000; padding-left:5px;"><i class="fa fa-solid fa fa-pen"></i></a></td>
								    	<td style="text-align:center;"><a href='/adm/notice/admnoticedelete?bno=${list.bno}' style="color:#000; padding-left:10px;" onClick="return confirm('삭제하시겠어요?')"><i class="fa fa-solid fa-trash"></i></a></td>
								    </tr>
								    <c:set var="num" value="${num-1}" />
								</c:forEach>
							 </c:otherwise>
					    </c:choose>
					   </tbody>
					  </table>
					 <div class="paging" style="text-align: center; padding: 20px 0; margin-button:30px;">
						 <c:if test="${pageMaker.prev}">
							<a href="${pageMaker.startPage-1}"><i class="fa  fa-angle-double-left"></i></a>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage }">
							<a href="${num}" class="${pageMaker.cri.pageNum==num?'active':''}">${num}</a>
						</c:forEach>
						<c:if test="${pageMaker.next}">
							<a href="${pageMaker.endPage+1}"><i class="fa  fa-angle-double-right"></i></a>
						</c:if>
						<div style="float:right;">
					    	<a href="admnoticewrite" class="rarara" style="width: 70px; height: 35px; line-height: 10px;">글쓰기</a>
					   </div>
					   <form id="actionForm" action="/adm/notice/admnotice" method="get">
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
							<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
							<input type="hidden" name="type" value="${pageMaker.cri.type}">
							<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
						</form>
					 </div>
				</div>
  		</div>
  	</div>
</div>
</div>
  </body>
  
     <script>
		$(function() {
   
			var actionForm = $("#actionForm");
			
			$(".notice_footer > a").on("click", function(e) {
				e.preventDefault();
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));1
				actionForm.submit();
			});
	     
		});
	</script>