<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../mypage/mypageHeader.jsp" %>

	<div class="col-md-9 newitem" style="margin-bottom: 40px;">
		<h2>회원정보수정</h2>
		<form id="memberEdit" method="post" action="/member/memberModify.do" onsubmit="return check()">
	  	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	  <div class="form-group">
	    <label for="id" class="col-sm-2 control-label">아이디</label>
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
	  </div>
	</form>
</div><!-- 9 end -->

	

	
	
	<script>//제이쿼리
	function check() {
		if(memberEdit.name.value=="") {
			alert("이름 입력");
			memberEdit.name.focus();
			return false;
		}
		if(memberEdit.email.value=="") {
			alert("이메일 입력");
			memberEdit.email.focus();
			return false;
		}
		if(memberEdit.member_post.value=="") {
			alert("우편번호 입력");
			memberEdit.member_post.focus();
			return false;
		}
		if(memberEdit.address1.value=="") {
			alert("주소 입력");
			memberEdit.address1.focus();
			return false;
		}
		if(memberEdit.address2.value=="") {
			alert("상세주소 입력");
			memberEdit.address2.focus();
			return false;
		}
		if(memberEdit.phone.value=="") {
			alert("전화번호 입력");
			memberEdit.phone.focus();
			return false;
		}
		return true;
	}
	
	
	function removeCheck() {
	
	 if (confirm("정말 삭제하시겠습니까??") == true){    //확인
	
	  location.replace("/member/memberDelete.do");
	     
	
	 }else{   //취소
	     return false;
	 }
	}
	</script>
	
<%@ include file = "../footer.jsp" %>
