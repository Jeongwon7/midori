<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../adminheader.jsp" %>

  			<div class="col-md-10" style="margin-top:100px; margin-left:300px; width:1200px;">
  				<h2>상품등록</h2>
				<div class="col-md-12">
					<form class="form-horizontal" name="frm" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					  <div class="form-group">
					    <label for="kind" class="col-sm-2 control-label">상품분류</label>
					    <div class="col-sm-10">
					     <select name="kind" class="select">
							<option value="">선택</option>
							<option value="1">샐러드</option>
							<option value="2">닭가슴살</option>
							<option value="3">다이어트도시락</option>
							<option value="4">샌드위치</option>
							<option value="5">프로틴</option>
							<option value="6">저칼로리간식</option>
							<option value="7">무설탕음료</option>
						</select>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="name" class="col-sm-2 control-label">상품명</label>
					    <div class="col-sm-10">
					      <input type="text" name="name" class="form-control" id="name" placeholder="상품명 입력">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="price1" class="col-sm-2 control-label">원가</label>
					    <div class="col-sm-10">
					      <input type="text" name="price1" class="form-control" id="price1" placeholder="원가 입력" onKeyUp='NumberFormat(this)'>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="price2" class="col-sm-2 control-label">판매가</label>
					    <div class="col-sm-10">
					      <input type="text" name="price2" class="form-control" id="price2" placeholder="판매가 입력" onBlur="go_ab()" onKeyUp='NumberFormat(this)'>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="price3" class="col-sm-2 control-label">수익</label>
					    <div class="col-sm-10">
					      <input type="text" name="price3" class="form-control" id="price3" onKeyUp="NumberFormat(this)" readonly>
					    </div>
					  </div>
					   <div class="form-group">
					     <label class="form-check-label col-sm-2 control-label" for="bestyn">
						  베스트 상품
						  </label>
						   <input class="form-check-input" type="radio" name="bestyn" id="bestyn" value="y">
							  <label class="form-check-label" for="bestyn" style="margin-right:50px;">
							    Y
						      </label>
					 	  <input class="form-check-input" type="radio" name="bestyn" id="bestyn" value="n">
							  <label class="form-check-label" for="bestyn">
							    N
						  </label>
					  </div>
					 
					  <div class="form-group">
					    <label for="content" class="col-sm-2 control-label">상품설명</label>
					    <div class="col-sm-10">
					      <textarea name="content" class="form-control" rows="10" id="summernote"></textarea>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="image" class="col-sm-2 control-label">대표이미지</label>
					    <div class="col-sm-10">
					      <input type="file" name="uploadFile" class="form-control" id="image">
					    </div>
					  </div>
					  <div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					      <button type="button" class="btn btn-default" onclick="go_save()">상품등록</button>
					      <button type="button" class="btn btn-default" onclick="go_mov()">목록</button>
					    </div>
					  </div>
					</form>
				</div>
  			</div>
  		</div>
  	</div>
</div>
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
  </body>
  </html>