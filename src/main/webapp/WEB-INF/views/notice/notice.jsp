<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../mainheader.jsp" %>

 <div class="midori_main">
       <div class="midori_content">
        <div class="midori_indexmain page_main">
		 <div class="midori_productpage">
		  <div class="midori_one">
		    <div class="inner_listbody">
		     <div class="list_body">
		      <div class="notice_head">		        
		     </div>
		   <div class="notice_aticle">
		   <h2 class="notice_tit">
		           공지사항 
		     <span class="notice_titsub">미도리의 새로운 소식들과 유용한 정보들을 이곳에서 확인하세요.</span>
		   </h2>
		  </div>
		 <div class="notice_search">
		 <p style="float:left;">총게시글<span>${pageMaker1.total}</span>건</p>
		  <form class="myform" action="/notice/notice" method="get" id="searchForm">
		    <select name="type" class="select">
			  <option value="T">제목</option>
			  <option value="C">내용</option>
			  <option value="W">글쓴이</option>
			</select>
		       <input type="hidden" name="pageNum" value="${pageMaker1.cri.pageNum}">
			   <input type="hidden" name="amount" value="${pageMaker1.cri.amount}">
	                  <input type="text" name="keyword" placeholder="검색어를 입력해주세요." class="in_search">
                  <input type="image" class="search_noticeicon" src="../assets/img/search_icon.png">
                 <button class="search_none" type="submit"><i class="fa fa-search"></i><span class="sr-only">검색버튼</span></button>
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
		    <c:set var="num" value="${pageMaker1.total-((pageMaker1.cri.pageNum-1)*10)}" />
			<c:forEach var="list" items="${list}">	 
			<c:if test ="${not empty list}">   
		     <tr>
		      <td>
		       <div class="tb_center">${num}</div>
		       <fmt:parseDate var="kbs" pattern="yyyy-MM-dd" value="${list.regdate}"/>
		      </td>
		      <td>
		       <div class="tb_center">
		        <a href="noticeview.do?bno=${list.bno}&pageNum=${pageMaker1.cri.pageNum}&amount=${pageMaker1.cri.amount}&type=${pageMaker1.cri.type}&keyword=${pageMaker1.cri.keyword}">
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
		     </c:if>
		     <c:set var="num" value="${num-1}" />
		    </c:forEach>
		    <c:if test="${empty list }">
				<tr><td colspan="2" class="null_xd">검색 결과가 없습니다</td></tr>
			</c:if>
		    </tbody>
		   </table>
		 </div>
		 <div class="product_footer" style="padding-top:30px;">
		 <c:if test="${pageMaker1.prev}">
			<a href="${pageMaker1.startPage-1}" class="footer_active"><i class="fas  fa-angle-double-left"></i></a>
		</c:if>
		<c:forEach var="num" begin="${pageMaker1.startPage}" end="${pageMaker1.endPage }">
			<a href="${num}" class="${pageMaker1.cri.pageNum==num?'active':''}" class="footer_active">${num}</a>
		</c:forEach>
		<c:if test="${pageMaker1.next}">
			<a href="${pageMaker1.endPage+1}" class="footer_active"><i class="fas  fa-angle-double-right"></i></a>
		</c:if>
	     </div>
	     </div>
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
</div>

    <form id="actionForm" action="/notice/notice" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker1.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker1.cri.amount}">
		<input type="hidden" name="type" value="${pageMaker1.cri.type}">
		<input type="hidden" name="keyword" value="${pageMaker1.cri.keyword}">
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
	<%@ include file="../footer.jsp" %>