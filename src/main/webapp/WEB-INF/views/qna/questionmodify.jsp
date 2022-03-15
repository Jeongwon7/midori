<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../mainheader.jsp" %>
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
				          Question Modify 
				   </h2>
				  </div>
				   <div class="member_join" style="width:1050px;">
					<form class="form-horizontal" name="qfrm" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<input type="hidden" name="qbno" value="${qvo.qbno}">
					<input type="hidden" name="pseq" value="${qvo.pseq}">
					<table class="tbl_comm">
						 <tbody>
						 	<tr class="fst">
				 	        <th>제목 </th>
				 	        <td>
				 	         <input type="text"  name="qtitle" class="member_cont" id="qtitle" value="${qvo.qtitle}">
				 	        </td>
				 	       </tr>
				 	        <tr>
				 	        <th>문의분류</th>
				 	        <td>
				 	         <select name="category">
						      	<option value="0">선택</option>
						      	<option value="1">상품문의</option>
						      	<option value="2">배송문의</option>
						      	<option value="3">기타문의</option>
						      </select>
				 	        </td>
				 	       </tr>
				 	       <tr>
				 	        <th>내용</th>
				 	        <td>
				 	         <textarea name="qcontent" id="summernote" class="form-control" rows="10">${qvo.qcontent}</textarea>
				 	        </td>
				 	       </tr>
				 	       <tr>
				 	        <th>비밀글 설정</th>
				 	        <td style="padding-left:20px;padding-top:18px;">
				 	           <c:choose>
							  <c:when test="${qvo.secret == true }">
							  	<input class="form-check-input" type="checkbox" name="secret" id="secret" checked="checked">
							  </c:when>
							  <c:otherwise>
							  	<input class="form-check-input" type="checkbox" name="secret" id="secret">
							  </c:otherwise>
						  </c:choose>
							  <p>체크하지 않을 경우 공개글로 저장됩니다</p>
				 	        </td>
				 	        </tr>
						 </tbody>
					</table>
					<div class="join_footer" style="padding-left:200px;">
					   <button class="btn_join btn_active" onclick="return question_modify()">문의수정</button>
					   <button type="button" class="btn_back1" onclick="history.back();" style="margin-right: 90px;">
						  <span class="txt_type">목록으로</span>
						</button>
					  </div>
					  </form>
					 </div>
				</div>
			</div>
		</div>
	   </div>
	</body>
   </div>
  </div>
 </div>
	<!-- contents end-->
	<script>
	//썸머노트
    $(function(){
      $('#summernote').summernote({
         height: 600,
         fontNames : [ '맑은고딕', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', ],
         fontNamesIgnoreCheck : [ '맑은고딕' ],
         focus: true,
         
         callbacks: {
            onImageUpload: function(files, editor, welEditable) {
                  for (var i = files.length - 1; i >= 0; i--) {
                     sendFile(files[i], this);
                  }
              }
         }
         
      });

   })
   
   function sendFile(file,  el) {
      var form_data = new FormData();
      var csrfHeaderName = "${_csrf.headerName}";
      var csrfTokenValue = "${_csrf.token}";
      //스프링 시큐리티 이용하면 CSRF 토큰을 같이 전송해야한다
      
      $(document).ajaxSend(function(e, xhr, options) {
            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
         });
      
      console.log(file);
      
         form_data.append('file', file);
         $.ajax({
           data: form_data,
           type: "POST",
           url: '/summer/Image.do',
           contentType: false,
           enctype: 'multipart/form-data',
           processData: false,
           success: function(img_name) {
              console.log(img_name);
                $(el).summernote('editor.insertImage', img_name.url);
           }
         })
    }
	
	</script>
<%@ include file = "../footer.jsp" %>