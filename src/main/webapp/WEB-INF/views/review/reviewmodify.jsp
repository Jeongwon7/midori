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
				            Review Modify
				   </h2>
				  </div>
				  <div class="member_join" style="width:1050px;">
					<form class="form-horizontal" name="rvfrm" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<input type="hidden" name="rbno" value="${rvo.rbno}">
					<input type="hidden" name="pseq" value="${rvo.pseq}">
					<table class="tbl_comm">
						<tbody>
							<tr class="fst">
			 	       		 <th>제목 </th>
			 	       		 <td>
			 	        		 <input type="text"  name="title" class="member_cont" id="title" value="${rvo.title}">
			 	        	 </td>
			 	      		</tr>
			 	      		<tr class="fst">
			 	       		 <th>별점 </th>
			 	       		 <td>
			 	        		 <div class="star-rating space-x-4 ">
									<input type="radio" id="5-stars" name="star" value="5" />
									<label for="5-stars" class="star pr-4">★</label>
									<input type="radio" id="4-stars" name="star" value="4"/>
									<label for="4-stars" class="star">★</label>
									<input type="radio" id="3-stars" name="star" value="3"/>
									<label for="3-stars" class="star">★</label>
									<input type="radio" id="2-stars" name="star" value="2"/>
									<label for="2-stars" class="star">★</label>
									<input type="radio" id="1-star" name="star" value="1" />
									<label for="1-star" class="star">★</label>
								</div>
			 	        	 </td>
			 	      		</tr>
			 	      		<tr class="fst">
			 	       		 <th>내용 </th>
			 	       		 <td>
			 	        		  <textarea name="content" class="member_cont" id="summernote" rows="10">	${rvo.content }</textarea>
			 	        	 </td>
			 	      		</tr>
						</tbody>
					</table>
						<div class="join_footer" style="padding-left:200px;">
						<button type="button" class="btn_join btn_active" onclick="review_modify();">리뷰수정</button>
					    <button type="button"class="btn_back1"  onclick="history.back();" style="margin-right: 90px;"><span class="txt_type">뒤로가기</span></button>
					</div>
					</form>
					</div>
				</div>
				</div>
			</div>
		</div>
	   </div>
	  </div>
	 </div>
		</body>
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