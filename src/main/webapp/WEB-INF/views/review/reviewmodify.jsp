<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "../header.jsp" %>
				<div class="col-md-9">
				  <h3>Review Modify (후기 수정)</h3>
					<form class="form-horizontal" name="rvfrm" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<input type="hidden" name="rbno" value="${rvo.rbno}">
					<input type="hidden" name="pseq" value="${rvo.pseq}">
					 <div class="form-group">
					    <label for="title" class="col-sm-2 control-label">제목</label>
					    <div class="col-sm-10">
					      <input type="text" name="title" class="form-control" id="title" value="${rvo.title}">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="star" class="col-sm-2 control-label">별점</label>
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
					</div>
					   <div class="form-group">
					    <label for="content" class="col-sm-2 control-label">내용</label>
					    <div class="col-sm-10">
					      <textarea name="content" id="summernote" class="form-control" rows="10">
					      	${rvo.content }
					      </textarea>
					    </div>
					  </div>
					    <div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					      <button type="button" onclick="review_modify();">리뷰수정</button>
					       <button type="button" onclick="history.back();">수정취소</button>
					    </div>
					  </div>
					</form>
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