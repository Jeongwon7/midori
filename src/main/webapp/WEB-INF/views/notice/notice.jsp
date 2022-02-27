<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

  <div class="col-md-9">
     <div class="container">
	   <div class="row">
		<div class="notice">
		 <div class="notice_head">
		  <strong><a href="/notice/notice.do">공지사항</a></strong>
		  <p>총게시글<span>${pageMaker.total}</span>건</p>
		 </div>
		 <div class="notice_search">
		  <form class="myform" action="/notice/notice" method="get" id="searchForm">
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
		 <div class="search_table_body">
		   <table class="notice_table">
		    <colgroup>
		     <col width="50">
		     <col width="*">
		     <col width="110">
		     <col width="90">
		     <col width="80">
		    </colgroup>
		    <thead>
		     <tr>
		      <th scope="col">
		       <div class="tb_center">번호</div>
		      </th> 
		      <th scope="col">
		       <div class="tb_center">제목</div>
		      </th>
		      <th scope="col">
		       <div class="tb_center">작성자</div>
		      </th>
		      <th scope="col">
		       <div class="tb_center">작성일</div>
		      </th>
		      <th scope="col">
		       <div class="tb_center">조회수</div>
		      </th>
		     </tr>
		    </thead>
		    <tbody>
		    <c:set var="num" value="${pageMaker.total-((pageMaker.cri.pageNum-1)*10)}" />
			<c:forEach var="list" items="${list}">	    
		     <tr>
		      <td>
		       <div class="tb_center">${num}</div>
		       <fmt:parseDate var="kbs" pattern="yyyy-MM-dd" value="${list.regdate}"/>
		      </td>
		      <td>
		       <div class="tb_center">
		        <a href="noticeview.do?bno=${list.bno}&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">
		         <strong>${list.title}</strong>
		        </a>
		       </div>
		      </td>
		      <td>
		       <div class="tb_center">${list.writer}</div>
		      </td>
		      <td>
		       <div class="tb_center"><fmt:formatDate var="mbc" pattern="yyyy-MM-dd" value="${kbs}"/>${mbc}</div>
		      </td>
		      <td>
		       <div class="tb_center">${list.viewcount}</div>
		      </td>
		     </tr>
		     <c:set var="num" value="${num-1}" />
		    </c:forEach>
		    </tbody>
		   </table>
		 </div>
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
	     </div>
		</div>      
	   </div>
	 </div>   
  </div>
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Result Message</h4>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
    <form id="actionForm" action="/notice/notice" method="get">
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
			});
			
    
			var result='<c:out value="${result}"/>';
			
			checkModal(result);
			
			function checkModal(result) {
				if(result == "") {
					return;
				}
				if(parseInt(result)>0) {
					$(".modal-body").html("게시글"+parseInt(result)+" 번 등록 완료");
				}
				if(result == 'success') {
					$(".modal-body").html("처리 완료");
				}
				$("#myModal").modal("show");
			}
			
			var searchForm = $("#searchForm");
			$("#searchForm button").on("click", function(e) {
				if(!searchForm.find("option:selected").val()) {
					alert("검색종류를 선택하세요");
					return false;
				}
				if(!searchForm.find("input[name='keyword']").val()) {
					alert("검색 키워드 입력");
					return false;
				}
				searchForm.find("input[name='pageNum']").val("1");
				e.preventDefault();
				
				searchForm.submit();
			})
			
		}); //
	</script>