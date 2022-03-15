<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../mainheader.jsp" %>

	<div class="midori_main">
	  <div class="tit_page"style="padding-top:100px;">
        <div class="sub_my">
          <h2 class="tit_snb">마이페이지</h2>
           <div class="inner_snb">
             <ul class="mypage_menu" style="padding-left:0px;">
           		<li>
                 <a href="../mypage/cart_list">장바구니</a>
                </li>
                <li>
                 <a href="../order/ordering">진행중인 주문 내역</a>
                </li>
                <li>
                 <a href="../order/orderall">총 주문 내역</a>
                </li>
                <li class="on">
                 <a href="/member/email.do">개인 정보 변경</a>
                </li>
               </ul>
              </div>
          </div>
		 <div class="page_section section_myinfo type_form">
           <div class="head_aticle">
             <h2 class="tit">개인 정보 변경</h2>
           </div>
           <div class="mypage_email">
             <div class="field_email">
			   <form id="memberEdit" method="post" action="/member/memberModify.do" onsubmit="return check()">
			   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	  	        <table class="tbl_comm">
                 <tbody>
                  <tr class="fst">
                    <th>아이디</th>
                    <td>
                      <input type="text" name="id" class="form-control" value="${view.id }" readonly>
	                  <span id="msg"></span>
                    </td>
                   </tr>
                   <tr>
                    <th>비밀번호</th>  
                    <td>
                       <input type="password" name="pwd" class="form-control" id="pwd" placeholder="비밀번호를 입력 해주세요">
                       <p style="margin:0;font-size: 13px;font-weight: 600;">(비밀번호 미기재시 기존 비밀번호로 저장됩니다)<p>
                    </td>
                   </tr>
                   <tr>
                    <th>비밀번호 확인</th>
                    <td>
                     <input type="password" name="pwdcheck" class="form-control" id="pwdcheck"placeholder="비밀번호를 재입력 해주세요">
                     <span id="pwmsg" style="font-size:13px;display: inline-block; padding-top: 10px;"></span>
                    </td>
                   </tr>
                   <tr>
                    <th>이름</th>
                    <td>
                     <input type="text" name="name" class="form-control" id="name" value="${view.name }"placeholder="이름을 입력 해주세요">
                    </td>
                   </tr>
                   <tr>
                    <th>이메일</th>
                    <td>
                     <input type="text" name="email" class="form-control" id="email"  value="${view.email }"placeholder="이메일을 입력 해주세요"> 
                    </td>
                   </tr>
                   <tr>
                    <th>주소</th>
                    <td>
                     <input type="text" name="zip_num" id="member_post" class="member_address" onclick="findAddr()"style="width:145px;" value="<c:out value='${view.zip_num }'></c:out>" readonly>
		 	           <a class="member_checked member_btn" style="color:#49904E;" onclick="findAddr()">우편번호찾기</a>
		 	          <input type="text" name="address1" class="member_cont1"  value="${view.address1 }" id="member_addr" >
				      <input type="text" name="address2" id="address2" class="member_cont1" value="${view.address2 }">
                    </td>
                   </tr>
                   <tr>
                    <th>전화번호</th>
                    <td>
                     <input type="text" name="phone" class="form-control" id="phone" value="${view.phone}"placeholder="전화번호를 입력 해주세요">
                    </td>
                   </tbody>
                 </table>
                 <div class="join_footer">
                   <button type="button" class="btn_back1" onclick="location.href='/'" >
				    <span class="txt_type">홈으로</span>   
				   </button>
				   <button class="btn_join btn_active btn_ok"type="submit">회원정보수정</button>
				   <button type="button" class="btn_join btn_active btn_list"onclick="removeCheck()"style="margin-right: 145px;">탈퇴하기</button>
		  </div>
	  <%-- <div class="form-group">
	    <label for="id" class="col-sm-2 control-label input_email">아이디</label>
	    <div class="col-sm-10">
	      <input type="text" name="id" class="form-control" value="${view.id }" readonly>
	      <span id="msg"></span>
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="pwd" class="col-sm-2 control-label" style="flex: 0 0 16.666667%; max-width: 49.666667%;">패스워드(비밀번호 미기재시 기존 비밀번호로 저장됩니다)</label>
	    <div class="col-sm-10">
	      <input type="password" name="pwd" class="form-control" id="pw1">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="pwdcheck" class="col-sm-2 control-label">패스워드 확인</label>
	    <div class="col-sm-10">
	      <input type="password" name="pw2" class="form-control" id="pw2">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="name" class="col-sm-10 control-label">이름</label>
	    <div class="col-sm-10">
	      <input type="text" name="name" class="form-control" id="name" value="${view.name }">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="email" class="col-sm-2 control-label">이메일</label>
	    <div class="col-sm-10">
	      <input type="text" name="email" class="form-control" id="email"  value="${view.email }">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="member_post" class="col-sm-2 control-label">주소</label>
	    <div class="col-sm-10">
	      <input type="text" name="zip_num"  id="member_post" onclick="findAddr()" value="<c:out value='${view.zip_num }'></c:out>" readonly>
	      <input type="button" value="우편번호 찾기" onclick="findAddr()">
	      <input type="text" name="address1" class="form-control" value="${view.address1 }" id="member_addr">
	      <input type="text" name="address2" id="address2" class="form-control"  value="${view.address2 }">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="phone" class="col-sm-2 control-label">전화번호</label>
	    <div class="col-sm-10">
	      <input type="text" name="phone" class="form-control" id="phone" value="${view.phone}">
	    </div>
	  </div>
	  <div class="form-group">
 		<input type="submit" value="저장" class="btn_ok">&nbsp;&nbsp;
		<input type="button" value="홈으로" class="btn_reset" onclick="location.href='/'">&nbsp;&nbsp;
		<input type="button" value="회원 탈퇴" class="btn_list" onclick="removeCheck()">
	  </div> --%>
	</form>
   </div>
  </div>
</div>
</div><!-- 9 end -->
</div>

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

	
	
	<script>//제이쿼리
	function check() {
		if(memberEdit.name.value=="") {
			alert("이름을 입력 해주세요");
			memberEdit.name.focus();
			return false;
		}
		if(memberEdit.email.value=="") {
			alert("이메일을 입력 해주세요");
			memberEdit.email.focus();
			return false;
		}
		if(memberEdit.member_post.value=="") {
			alert("우편번호를 입력 해주세요");
			memberEdit.member_post.focus();
			return false;
		}
		if(memberEdit.address1.value=="") {
			alert("주소를 입력 해주세요");
			memberEdit.address1.focus();
			return false;
		}
		if(memberEdit.address2.value=="") {
			alert("상세주소를 입력 해주세요");
			memberEdit.address2.focus();
			return false;
		}
		if(memberEdit.phone.value=="") {
			alert("전화번호를 입력 해주세요");
			memberEdit.phone.focus();
			return false;
		}
		alert("회원정보 수정이 완료 되었습니다.")
		return true;	
	}
	
	
	function removeCheck() {
	
	 if (confirm("정말 탈퇴하시겠습니까? 작성한 리뷰 및 문의글이 모두 삭제됩니다") == true){    //확인
	
	
	 
	  location.replace("/member/memberDelete.do");
	     
		 alert("회원탈퇴가 완료 되었습니다.")
	 }else{   //취소
	     return false;
	 }
	}
	</script>
	
<%@ include file = "../footer.jsp" %>
