<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminheader.jsp" %>

	<div class="col-md-12 col-sm-12" style="margin-left:250px; width:1050px;">
	  <h2 style="padding-left:10px; padding:30px 0;">상품 수정</h2>
	  <div class="noticewrite">
	  <form name="frm" method="post" enctype="multipart/form-data">
	  	<input type="hidden" name="pseq" value="${view.pseq}"> <!-- post방식으로 bno넘기기 -->
	  	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	    <!-- action을 처리하기전에 check()사용자 함수를 실행하고 되돌아 와라-->
	    <div class="tbl_noticewrite">
	  	<table class="noticewrite_table">
	      <colgroup>
	       <col width="130">
	       <col> 
	       <col>
	      </colgroup>
	      <tbody>
			<tr>
			 <th scope="row">
			  <div class="txt-1">상품분류</div>
			 </th>
			 <td colspan="3">
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
			 </td>
			</tr>
	    	<tr>
			 <th scope="row">
			  <div class="txt-1">상품명</div>
			 </th>
			 <td colspan="3">
			  <input type="text" name="name" id="name" style="width:100%; margin:0;" value="${view.name}">
			 </td>
			</tr>
			<tr>
			 <th scope="row">
			  <div class="txt-1">원가</div>
			 </th>
			 <td colspan="3">
			 	<input type="text" name="price1" class="form-control" id="price1"  style="width:100%; margin:0;" value="${view.price1}" onBlur="go_ab()">
			  </td>
			 </tr>
			 <tr>
			 <th scope="row">
			  <div class="txt-1">판매가</div>
			 </th>
			 <td colspan="3">
			 	<input type="text" name="price2" id="price2"  style="width:100%; margin:0;"  value="${view.price2}" onBlur="go_ab()">
			  </td>
			 </tr>
			 <tr>
			 <th scope="row">
			  <div class="txt-1">수익</div>
			 </th>
			 <td colspan="3">
			 	<input type="text" name="price3" id="price3"  style="width:100%; margin:0;" value="${view.price3}"  onKeyUp="NumberFormat(this)" readonly>
			  </td>
			 </tr>
	    	<tr>
			 <th scope="row">
			  <div class="txt-1">베스트 상품</div>
			 </th>
			 <td colspan="3">
			 	<c:choose>
				  <c:when test="${view.bestyn eq 'y'}">
				  	<input class="form-check-input" type="radio" name="bestyn" id="bestyn" value="y" checked="checked" style="margin-left: 10px;">
					  <label class="form-check-label" for="bestyn" style="margin-right:50px; margin-left: 35px;">Y</label>
			 	 	 <input class="form-check-input" type="radio" name="bestyn" id="bestyn" value="n">
					  <label class="form-check-label" for="bestyn" style="margin-left: 10px;">N</label>
				  </c:when>
				  <c:otherwise>
				  	 <input class="form-check-input" type="radio" name="bestyn" id="bestyn" value="y" style="margin-left: 10px;">
					  <label class="form-check-label" for="bestyn" style="margin-right:50px; margin-left: 35px;">Y</label>
			 	 	 <input class="form-check-input" type="radio" name="bestyn" id="bestyn" value="n" checked="checked">
					  <label class="form-check-label" for="bestyn" style="margin-left: 10px;">N</label>
				  </c:otherwise>
		   		</c:choose>
			  </td>
			 </tr>
			 <tr>
			 <th scope="row">
			  <div class="txt-1">상품설명</div>
			 </th>
			 <td colspan="3">
			 	<textarea name="content" class="form-control" rows="10" id="summernote" style="width:100%; height:150px;">${view.content}</textarea>
			 </td>
			 </tr>
			<tr>
			 <th scope="row">
			  <div class="txt-1">대표이미지</div>
			 </th>
			 <td colspan="3">
			 	<input type="file" name="uploadFile" id="image"  style="width:100%; margin:0;" value="${view.image}">
			 </td>
			 </tr>
			</tbody>
	  		</table>
		    </div>
	    		<div class="btn_wrap" style="text-align: center; margin: 30px; padding-bottom: 50px;">
	    		  	<input type="button" onclick="go_modify()" value="저장" class="rarara" style="width: 100px; height: 50px; line-height: 25px; margin: 0 5px;">&nbsp;&nbsp;
					<input type="reset" value="다시쓰기" class="rarara" style="width: 100px; height: 50px; line-height: 25px; margin: 0 5px;">&nbsp;&nbsp;
					<input type="button" value="목록" class="rarara" onClick="location.href='/adm/product/productlist.do';" style="width: 100px; height: 50px; line-height: 25px; margin: 0 5px;">
				</div>
		</form>
	  </div>
	  </div>
	  </div>
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
