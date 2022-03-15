<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../mainheader.jsp" %>    

     
	
	 <div class="midori_main">
       <div class="midori_content">
        <div class="midori_indexmain page_main">
		 <div class="midori_productpage">
		  <div class="midori_one">
		    <div class="inner_listbody">
		     <div class="list_body">
		  		   <div class="notice_aticle">
		   <h2 class="notice_tit">
		           공지사항 
		   </h2>
		   <span class="notice_titsub">미도리의 새로운 소식들과 유용한 정보들을 이곳에서 확인하세요.</span>
		  </div>
		 <div class="noticemodify_table">
		  <table>
		   <thead>
		    <tr>
		     <th><div class="tb_center">${nvo.title}</div></th>
		    </tr>
		   </thead>
		   <tbody>
		    <tr>
		     <td class="line">
		      <div class="noitce_sub_des">
		       <div>
		        <span>
		           <em>작성일 : </em>
		           ${nvo.regdate.substring(0, 10)} 
		        </span>
		       </div>
		       <div>
		        <span>
		         <em class="notice_em">작성자 : </em>
		          ${nvo.writer }
		          <em style="float:right;">조회수 : 
		          <i class="fas fa-eye"></i> ${nvo.viewcount}</em>
		        </span>
		       </div>
		      </div>
		     </td>
		    </tr>
		    <tr>
		     <td>
		      <div class="modify_body">
		        ${nvo.content}
		      </div>
		     </td>
		    </tr>
		   </tbody>
		  </table>
		  <div class="noticeprev_next">
			<c:if test="${prevVO !=null}">
				<a href="noticeview.do?bno=${prevVO.bno}&pageNum=${cri.pageNum}&amount=${cri.amount}" class="btn_prev"><i class="fas fa-angle-left"></i>
				<span class="prev_wrap">
					<strong>이전글</strong><span>${prevVO.title}</span>
				</span>
				</a>
			</c:if>
			<c:if test="${prevVO == null}">
				<a href="javascript:void(0)" class="btn_prev"><i class="fas fa-angle-left"></i>
				<span class="prev_wrap">
					<strong>이전글</strong><span>없음</span>
				</span>
				</a>
			</c:if>
				<div class="btn_3wrap">
					<a href="notice.do?pageNum=${cri.pageNum}&amount=${cri.amount}&type=${cri.type}&keyword=${cri.keyword}">목록</a>
				</div>
			<c:if test="${nextVO != null}">
				<a href="noticeview.do?bno=${nextVO.bno }&pageNum=${cri.pageNum}&amount=${cri.amount}" class="btn_next">
				<span class="next_wrap">
					<strong>다음글</strong><span>${nextVO.title}</span>
				</span>
				<i class="fas fa-angle-right"></i></a>
			</c:if>
			<c:if test="${nextVO == null}">
				<a href="javascript:void(0)" class="btn_next">
				<span class="next_wrap">
					<strong>다음글</strong><span>없음</span>
				</span>
				<i class="fas fa-angle-right"></i></a>
			</c:if>
			</div>
		 </div> 	
		</div>
	  </div>
     </div>
    </div>
   </div>
  </div>
</div>
	<%@ include file="../footer.jsp" %>