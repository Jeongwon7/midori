<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../header.jsp" %>
	<!-- contents -->
	<section class="product">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<h2>CATEGORY</h2>
					<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
						  <div class="panel panel-default">
						    <div class="panel-heading" role="tab" id="headingOne">
						      <h4 class="panel-title">
						        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
						          Side Menu
						          <span class="badge pull-right"><i class="fa fa-plus"></i></span>
						        </a>
						      </h4>
						    </div>
						    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
						      <div class="panel-body">
								<ul>
									<li><a href="cartlist.do">장바구니 내역</a></li>
									<li><a href="mypage.do">진행중인 주문내역</a></li>
									<li><a href="orderAll.do">총 주문내역</a></li>
								</ul>
						      </div>
						    </div>
						  </div>
					</div>
				</div>
				<div class="col-md-9 newitem">
				  <h2>Answer Writing</h2>
					<form class="form-horizontal" name="qafrm" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<input type="hidden" name="qbno" value="${qbno}">
					<input type="hidden" name="pseq" value="${pseq}">
					<input type="hidden" name="ref" value="${ref}">
					 <div class="form-group">
					    <label for="atitle" class="col-sm-2 control-label">제목</label>
					    <div class="col-sm-10">
					      <input type="text" name="atitle" class="form-control" id="atitle" value="▲답변완료▲">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="awriter" class="col-sm-2 control-label">작성자</label>
					    <div class="col-sm-10">
					      <input type="text" name="awriter" class="form-control" id="awriter" value="관리자">
					    </div>
					  </div>
					   <div class="form-group">
					    <label for="content" class="col-sm-2 control-label">내용</label>
					    <div class="col-sm-10">
					      <textarea name="acontent" id="summernote" class="form-control" rows="10"></textarea>
					    </div>
					  </div>
					    <div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					      <button type="button" class="btn btn-default" onclick="answer_save()">답변등록</button>
					       <button type="button" class="btn btn-default" onclick="history.back();">목록으로</button>
					    </div>
					  </div>
					</form>
				</div>
			</div><!-- row end -->
		</div>
	</section>
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