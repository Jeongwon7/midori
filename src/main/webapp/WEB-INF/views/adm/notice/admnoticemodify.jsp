<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../adminheader.jsp" %>

<div class="col-md-12 col-sm-12" style="margin-left:370px; width:1100px;">
<h2 style="padding-left:10px; padding:30px 0;">공지사항 관리</h2>
	<div class="product-section mt-150 mb-150">
		<div class="noticewrite">
			<form name="notice" method="post" action="admnoticemodifypro.do" onsubmit="return check()" >
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<input type="hidden" name="bno" value="${nvo.bno }">
			<input type="hidden" name="pageNum" value="${cri.pageNum}">
			<input type="hidden" name="amount" value="${cri.amount}">
			<!-- action을 처리하기전에 check()사용자 함수를 실행하고 되돌아 와라-->
				<div class="tbl_noticewrite">
					<table class="noticewrite_table">
					<colgroup>
						<col width="130">
						<col>
						<col width="100">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">
								<div class="txt-1">작성자</div>
							</th>
							<td colspan="3">
								<input type="text" name="writer" id="writer" style="width:100%; margin:0;" value="${nvo.writer}">
							</td>
						</tr>
						<tr>
							<th scope="row">
								<div class="txt-1">제목</div>
							</th>
							<td colspan="3">
								<input type="text" name="title" id="title" style="margin:0; width:100%;" value="${nvo.title}">
							</td>
						</tr>
						<tr>
							<th scope="row">
								<div class="txt-1">내용</div>
							</th>
							<td colspan="3">
								<textarea name="content" id="summernote" style="width:100%; height:150px;">${nvo.content}</textarea>
							</td>
						</tr>
					</tbody>
					</table>
				</div>
				<div class="order_footer" style="float:left;">
					<div class="button_wrap">
					<p class="buy">
						<a href="#" class="first" onclick="location.href='admnotice.do'" style="width: 100px; height: 50px; line-height: 25px;">뒤로가기</a>
					</p>
					<p class="cart">
						<input type="submit" class="btn_ok" style="width: 100px; height: 50px;" value="수정하기">
					</p>
					</div>
				</div>
			</form>
		</div>
	</div>
</div> 
</div>
	  </div>
    </div>	
 	<script>
		function check() {
			if(notice.writer.value=="") {
				alert("글쓴이 입력");
				notice.writer.focus();
				return false;
			}
			if(notice.title.value=="") {
				alert("제목을 입력");
				notice.title.focus();
				return false;
			}
			if(notice.contents.value=="") {
				alert("내용을 입력");
				notice.content.focus();
				return false;
			}
			alert("공지사항 수정 완료!")
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