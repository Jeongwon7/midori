<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../adminheader.jsp" %>
<body>
<div class="col-md-10" style="margin-top:100px; margin-left:300px; width:1000px;">
      <h2 style="padding-left:10px; padding-bottom:30px;">공지사항 관리</h2>
	  <div class="col-md-12">
	   <div class="table-responsive">
		<div class="noticemodify">
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
		         <em>작성자 : </em>
		          ${nvo.writer }
		          <em style="float:right;">조회수 : 
		          <i class="fa fa-eye"></i> ${nvo.viewcount}</em>
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
				<a href="/adm/notice/admnoticeview.do?bno=${prevVO.bno}&pageNum=${cri.pageNum}&amount=${cri.amount}" class="btn_prev"><i class="fa fa-angle-left"></i>
				<span class="prev_wrap">
					<strong>이전글</strong><span>${prevVO.title}</span>
				</span>
				</a>
			</c:if>
			<c:if test="${prevVO == null}">
				<a href="javascript:void(0)" class="btn_prev"><i class="fa fa-angle-left"></i>
				<span class="prev_wrap">
					<strong>이전글</strong><span>없음</span>
				</span>
				</a>
			</c:if>
				<div class="btn_3wrap">
					<a href="/adm/notice/admnotice.do?pageNum=${cri.pageNum}&amount=${cri.amount}&type=${cri.type}&keyword=${cri.keyword}">목록</a>
								<a href="/adm/notice/admnoticemodify.do?bno=${nvo.bno}&pageNum=${cri.pageNum}&amount=${cri.amount}">수정</a> 
								<a href="/adm/notice/admnoticedelete.do?bno=${nvo.bno}" onClick="return confirm('삭제하시겠어요?')">삭제</a>
				</div>
			<c:if test="${nextVO != null}">
				<a href="/adm/notice/admnoticeview.do?bno=${nextVO.bno }&pageNum=${cri.pageNum}&amount=${cri.amount}" class="btn_next">
				<span class="next_wrap">
					<strong>다음글</strong><span>${nextVO.title}</span>
				</span>
				<i class="fa fa-angle-right"></i></a>
			</c:if>
			<c:if test="${nextVO == null}">
				<a href="javascript:void(0)" class="btn_next">
				<span class="next_wrap">
					<strong>다음글</strong><span>없음</span>
				</span>
				<i class="fa fa-angle-right"></i></a>
			</c:if>
			</div>
		 </div> 	
		</div>
	  </div>
     </div>
    </div>		