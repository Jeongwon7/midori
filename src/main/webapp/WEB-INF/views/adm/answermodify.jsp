<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "adminheader.jsp" %>
         <div class="col-md-12 col-sm-12" style=" margin-left:250px; width:1100px;">
              <h2 style="padding-left:10px; padding:30px 0;">Answer Modify</h2>
               <form class="form-horizontal" name="afrm" method="post">
               <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
               <input type="hidden" name="abno" value="${avo.abno}">
               <input type="hidden" name="qbno" value="${avo.qbno}">
                <div class="tbl_noticewrite">
                 <table class="noticewrite_table">
                 <colgroup>
                      <col width="130">
                      <col>
                    </colgroup>
                  <tr>
                   <th scope="row">
                    <div class="txt-1">제목</div>
                   </th>
                   <td colspan="3">
                    <input type="text" name="atitle" id="atitle" style="width:100%; margin:0;" value="${avo.atitle}">
                   </td>
                  </tr>
                  <tr>
                   <th scope="row">
                    <div class="txt-1">작성자</div>
                   </th>
                   <td colspan="3">
                    <input type="text" name="awriter" id="awriter" style="width:100%; margin:0;"value="${avo.awriter}">
                   </td>
                  </tr>
                  <tr>
                   <th scope="row">
                    <div class="txt-1">내용</div>
                   </th>
                   <td colspan="3">
                    <textarea name="acontent" id="summernote" style="width:100%; height:150px;">${avo.acontent }</textarea>
                   </td>
                  </tr>
                  </table>
                   <div style="text-align:center; margin:20px 0">
                  <button type="button" class="rarara" onclick="answer_modify()">답변수정</button>
                   <button type="button" class="rarara" onclick="history.back();">목록으로</button>
              </div>
              </div>
            </form>
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