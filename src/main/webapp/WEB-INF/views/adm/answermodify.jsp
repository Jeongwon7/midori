<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "adminheader.jsp" %>
			<div style="margin-top:100px; margin-left:300px; width:1200px;">
				<div class="col-md-10">
				  <h3 style="font-weight:bold;">Answer Modify</h3>
					<form class="form-horizontal" name="afrm" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<input type="hidden" name="abno" value="${avo.abno}">
					<input type="hidden" name="qbno" value="${avo.qbno}">
					 <div class="form-group">
					    <label for="atitle" class="col-sm-2 control-label">제목</label>
					    <div class="col-sm-10">
					      <input type="text" name="atitle" class="form-control" id="atitle" value="${avo.atitle}">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="awriter" class="col-sm-2 control-label">작성자</label>
					    <div class="col-sm-10">
					      <input type="text" name="awriter" class="form-control" id="awriter" value="${avo.awriter}">
					    </div>
					  </div>
					   <div class="form-group">
					    <label for="acontent" class="col-sm-2 control-label">내용</label>
					    <div class="col-sm-10">
					      <textarea name="acontent" id="summernote" class="form-control" rows="10">${avo.acontent }</textarea>
					    </div>
					  </div>
					    <div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					      <button type="button" onclick="answer_modify()">답변수정</button>
					       <button type="button" onclick="history.back();">목록으로</button>
					    </div>
					  </div>
					</form>
				</div>
				</div>
			</div><!-- row end -->
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
	
    function answer_modify(){
    	var theForm = document.afrm;
    	
    	if(!theForm.atitle.value){
    		alert("제목 입력하세요");
    		theForm.atitle.focus();
    	}else if(!theForm.awriter.value){
    		alert("작성자 입력하세요");
    		theForm.awriter.focus();
    	}else if(!theForm.acontent.value){
    		alert("내용 입력하세요");
    		theForm.acontent.focus();
    	}else{
    		//theForm.encoding = "multipart/form-data";
    		theForm.action = "/adm/answermodifypro.do";
    		theForm.submit();
    	}
    }
	</script>
