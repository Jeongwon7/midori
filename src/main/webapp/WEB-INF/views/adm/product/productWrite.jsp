<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../adminheader.jsp" %>

<div class="col-md-12 col-sm-12" style="margin-left:250px; width:1100px;">
	<h2 style="padding-left:10px; padding:30px 0;">상품등록</h2>
	<div class="noticewrite">
	<form name="frm" method="post" enctype="multipart/form-data">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
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
			  <input type="text" name="name" id="name" style="width:100%; margin:0;" placeholder="상품명 입력">
			 </td>
			</tr>
			<tr>
			 <th scope="row">
			  <div class="txt-1">원가</div>
			 </th>
			 <td colspan="3">
			 	<input type="text" name="price1" class="form-control" id="price1"  style="width:100%; margin:0;"  placeholder="원가 입력" onKeyUp='NumberFormat(this)'>
			  </td>
			 </tr>
			 <tr>
			 <th scope="row">
			  <div class="txt-1">판매가</div>
			 </th>
			 <td colspan="3">
			 	<input type="text" name="price2" id="price2"  style="width:100%; margin:0;"  placeholder="판매가 입력" onBlur="go_ab()" onKeyUp='NumberFormat(this)'>
			  </td>
			 </tr>
			 <tr>
			 <th scope="row">
			  <div class="txt-1">수익</div>
			 </th>
			 <td colspan="3">
			 	<input type="text" name="price3" id="price3"  style="width:100%; margin:0;" onKeyUp="NumberFormat(this)" readonly>
			  </td>
			 </tr>
			 <tr>
			 <th scope="row">
			  <div class="txt-1">베스트 상품</div>
			 </th>
			 <td colspan="3">
			 	<input type="radio" name="bestyn" id="bestyn" value="y"  >
			 		<label class="form-check-label" for="bestyn" style="margin-right:50px;">Y</label>
	 	  		<input class="form-check-input" type="radio" name="bestyn" id="bestyn" value="n" checked="checked">
			  		<label class="form-check-label" for="bestyn">N</label>
			  </td>
			 </tr>
			 <tr>
			 <th scope="row">
			  <div class="txt-1">상품설명</div>
			 </th>
			 <td colspan="3">
			 	<textarea name="content" rows="10" id="summernote" style="width:100%; height:150px;"></textarea>
			 </td>
			 </tr>
			  <tr>
			 <th scope="row">
			  <div class="txt-1">대표이미지</div>
			 </th>
			 <td colspan="3">
			 	<input type="file" name="uploadFile" id="image"  style="width:100%; margin:0;" onKeyUp="NumberFormat(this)" readonly>
			 </td>
			 </tr>
			</tbody>
	  		</table>
		    </div>
		    <div class="order_footer" style="float:left;">
    		<div class="button_wrap">
    		  <p class="buy">
    		  <button type="button" class="rarara" onclick="go_save()">상품등록</button>
    		  </p>
    		  <p class="cart">
    		  <button type="button" class="rarara" onclick="location.href='/adm/product/productlist.do'">목록</button>
    		  </p>
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