<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../mainheader.jsp"%>

    
     <div class="midori_main">
       <div class="tit_page">
        <h2 class="login_h2">회원가입</h2>
       </div>
       <div class="page_aticle">
         <div class="member_join">
         <form class="form-horizontal member_form" name="aaa" method="post">
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
          <p class="page_sub">
           <span class="member_ico">*</span>
                       필수입력사항
          </p>
          <table class="tbl_comm">
           <tbody>
             <tr class="fst">
              <th>
                           아이디
               <span class="member_ico">*</span>
              </th>
             <td>
              <input type="text"  name="id" class="member_cont" id="id" placeholder="아이디를 입력해주세요">
              <a class="member_checked member_btn" style="color:#49904E;"><span id="msg">중복확인</span></a>
             </td>
            </tr>
            <tr>
             <th>
                          비밀번호
              <span class="member_ico">*</span>
             </th>
             <td>  
              <input type="password" name="pwd" class="member_cont" id="pwd" placeholder="비밀번호를 입력해주세요">
             </td>
            </tr>
             <tr>
             <th>
                          비밀번호 확인
              <span class="member_ico">*</span>
             </th>
             <td>
              <input type="password" name="pwdcheck" class="member_cont" id="pwdcheck" placeholder="비밀번호를  한번 더 입력해주세요">
                            <span id="pwmsg" style="font-size:13px;display: inline-block; padding-top: 10px;"></span>
             </td>
            </tr>
            <tr>
             <th>
                          이름
              <span class="member_ico">*</span>
             </th>
             <td>
              <input type="text" name="name" class="member_cont" id="name" placeholder="이름을 입력해주세요">
             </td>
            </tr>
            <tr>
             <th>
                          이메일
              <span class="member_ico">*</span>
             </th>
             <td>
              <input type="text" name="email" class="member_cont" id="email" placeholder="예: midori@naver.com">
             </td>
            </tr>
            <tr>
             <th>
                          주소
              <span class="member_ico">*</span>
             </th>
             <td>
               <input type="text" name="zip_num" id="member_post" class="member_address" onclick="findAddr()" placeholder="우편번호" readonly>
               <a class="member_checked member_btn" style="color:#49904E;" onclick="findAddr()">우편번호찾기</a>
               <input type="text" name="address1" class="member_cont1"  placeholder="주소를 입력해주세요" id="member_addr" >
            <input type="text" name="address2" id="address2" class="member_cont1" placeholder="상세주소를 입력해주세요">
             </td>
            </tr>
            <tr>
             <th>
                          전화번호
              <span class="member_ico">*</span>
             </th>
             <td>
              <input type="text" name="phone" class="member_cont" id="phone" placeholder="전화번호를 입력해주세요">
             </td>
            </tr>
           </tbody>
          </table>
        <div class="join_footer">
         <button class="btn_join btn_active" onclick="goJoin()">가입하기</button>
         <button type="button" class="btn_back1" onclick="history.back(-1)" style="margin-right: 90px;">
           <span class="txt_type">뒤로가기</span>
         </button>
        </div>
      </form>
        </div><!-- 9 end -->
          </div>
       </div>
      </div>
    </div>
      
    <!-- contents end -->

<script>
   $(function (){
   
      $("#pwdcheck").blur(function(){
         var pwd = $("#pwd").val();
         var pwdcheck = $("#pwdcheck").val();
         
         if(pwd != pwdcheck){
            $("#pwmsg").html('<span style="color: #f00;">비밀번호가 일치하지 않습니다.</span>');
         }else{
            $("#pwmsg").html('<span>비밀번호가 일치합니다.</span>');
         }
      })
   });
</script>
   <%@ include file="../footer.jsp" %>