<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminheader.jsp" %>

	<div class="container" style="margin-top:100px; margin-left:300px; width:1000px;">

	  <div class="write_wrap">
	  <h2 class="sr-only">상품 수정</h2>
	  <form name="frm" method="post" enctype="multipart/form-data" action="/adm/product/productModify.do" onsubmit="return check()">
	  	<input type="hidden" name="pseq" value="${view.pseq}"> <!-- post방식으로 bno넘기기 -->
	  	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	    <!-- action을 처리하기전에 check()사용자 함수를 실행하고 되돌아 와라-->
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
			      <input type="text" name="name" class="form-control" id="name" value="${view.name}">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="price1" class="col-sm-2 control-label">원가</label>
			    <div class="col-sm-10">
			      <input type="text" name="price1" class="form-control" id="price1" value="${view.price1}" onBlur="go_ab()">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="price2" class="col-sm-2 control-label">판매가</label>
			    <div class="col-sm-10">
			      <input type="text" name="price2" class="form-control" id="price2" value="${view.price2}" onBlur="go_ab()">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="price3" class="col-sm-2 control-label">수익</label>
			    <div class="col-sm-10">
			      <input type="text" name="price3" class="form-control" id="price3" value="${view.price3}" onKeyUp="NumberFormat(this)"  readonly>
			    </div>
			  </div>
			  <div class="form-group">
					     <label class="form-check-label col-sm-2 control-label" for="bestyn">
						  베스트 상품
						  </label>
						  	<c:choose>
								  <c:when test="${view.bestyn eq 'y'}">
								  	<input class="form-check-input" type="radio" name="bestyn" id="bestyn" value="y" checked="checked">
									  <label class="form-check-label" for="bestyn" style="margin-right:50px;">
									    Y
								      </label>
							 	 	 <input class="form-check-input" type="radio" name="bestyn" id="bestyn" value="n" >
									  <label class="form-check-label" for="bestyn">
									    N
								 	 </label>
								  </c:when>
								  <c:otherwise>
								  	  <input class="form-check-input" type="radio" name="bestyn" id="bestyn" value="y" >
									  <label class="form-check-label" for="bestyn" style="margin-right:50px;">
									    Y
								      </label>
							 	 	 <input class="form-check-input" type="radio" name="bestyn" id="bestyn" value="n" checked="checked">
									  <label class="form-check-label" for="bestyn">
									    N
								 	 </label>
								  </c:otherwise>
						   </c:choose>
			</div>
			  <div class="form-group">
			    <label for="content" class="col-sm-2 control-label">상품설명</label>
			    <div class="col-sm-10">
			      <textarea name="content" class="form-control" rows="10" id="summernote">${view.content}</textarea>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="uploadFile" class="col-sm-2 control-label">대표이미지</label>
			    <div class="col-sm-10">
			      <input type="file" name="uploadFile" class="form-control" id="image" value="${view.image}">
			    </div>
			  </div>
			<div class="btn_wrap">
				<input type="submit" value="저장" class="btn_ok">&nbsp;&nbsp;
				<input type="reset" value="다시쓰기" class="btn_reset">&nbsp;&nbsp;
				<input type="button" value="목록" class="btn_list" onClick="location.href='/adm/product/productlist.do';">
			</div>
		</form>
	  </div>
	  
	</div>
	<!-- end contents -->
	<script>
		function check() {
			if(frm.kind.value=="") {
				alert("종류 입력");
				frm.kind.focus();
				return false;
			}
			if(frm.name.value=="") {
				alert("상품명 입력");
				frm.name.focus();
				return false;
			}
			if(frm.price1.value=="") {
				alert("원가 입력");
				frm.price1.focus();
				return false;
			}
			if(frm.price2.value=="") {
				alert("판매가 입력");
				frm.price2.focus();
				return false;
			}
			if(frm.content.value=="") {
				alert("내용을 입력");
				frm.content.focus();
				return false;
			}
			if(frm.image.value=="") {
				alert("사진 등록");
				frm.image.focus();
				return false;
			}
			return true;
		}
	</script>
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
