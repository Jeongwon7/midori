<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../adminheader.jsp" %>
<body>
<div class="col-md-12 col-sm-12" style="margin-left:370px; width:1100px;">
      <h2 style="padding-left:10px; padding:30px 0;">공지사항 관리</h2>
	   <div class="table-responsive">
		<div class="noticemodify">
		 <div class="noticemodify_table">
		  <table>
		   <thead>
		    <tr>
		     <th><div class="tb_center" style="text-align: center;">${nvo.title}</div></th>
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
		      <div class="modify_body" style="text-align: center;">
		        ${nvo.content}
		      </div>
		     </td>
		    </tr>
		   </tbody>
		  </table>
		  <div class="noticeprev_next">
			<c:if test="${prevVO !=null}">
				<a href="/adm/notice/admnoticeview.do?bno=${prevVO.bno}&pageNum=${cri.pageNum}&amount=${cri.amount}" class="btn_prev" class="arrow-prev"><i class="fa fa-angle-left" style="width: 50px; height: 50px; margin: 24px 0;"></i>
				<span class="prev_wrap"  style=" position: absolute; top: 25px;">
					<strong>이전글</strong><span>${prevVO.title}</span>
				</span>
				</a>
			</c:if>
			<c:if test="${prevVO == null}">
				<a href="javascript:void(0)" class="btn_prev"><i class="fa fa-angle-left" style="width: 50px; height: 50px; margin: 24px 0;"></i>
				<span class="prev_wrap" style=" position: absolute; top: 25px;">
					<strong>이전글</strong><span>없음</span>
				</span>
				</a>
			</c:if>
				<div class="order_footer" style="float:left; margin-left: 50px;">
	    		<div class="button_wrap">
	    		  <p class="buy">
					<a href="/adm/notice/admnotice.do?pageNum=${cri.pageNum}&amount=${cri.amount}&type=${cri.type}&keyword=${cri.keyword}" class="first" style="width: 100px; height: 50px; line-height: 25px; margin: 0 5px;">목록</a>
					<a href="/adm/notice/admnoticemodify.do?bno=${nvo.bno}&pageNum=${cri.pageNum}&amount=${cri.amount}" class="first" style="width: 100px; height: 50px; line-height: 25px; margin: 0 5px;">수정</a> 
					<a href="/adm/notice/admnoticedelete.do?bno=${nvo.bno}" onClick="return confirm('삭제하시겠어요?')" class="first" style="width: 100px; height: 50px; line-height: 25px; margin: 0 5px;">삭제</a>
					</p>
				</div>
				</div>
			<c:if test="${nextVO != null}">
				<a href="/adm/notice/admnoticeview.do?bno=${nextVO.bno }&pageNum=${cri.pageNum}&amount=${cri.amount}" class="btn_next">
				<span class="next_wrap" style=" position: absolute; top: 25px; right: 50px;">
					<strong>다음글</strong><span>${nextVO.title}</span>
				</span>
				<i class="fa fa-angle-right" style="width: 50px; height: 50px; margin: 24px 0;"></i></a>
			</c:if>
			<c:if test="${nextVO == null}">
				<a href="javascript:void(0)" class="btn_next">
				<span class="next_wrap" style=" position: absolute; top: 25px; right: 50px;">
					<strong>다음글</strong><span>없음</span>
				</span>
				<i class="fa fa-angle-right" style="width: 50px; height: 50px; margin: 24px 0;"></i></a>
			</c:if>
			</div>
		 </div> 	
		</div>
	  </div>
    </div>	
    </div>
	  </div>
    </div>		