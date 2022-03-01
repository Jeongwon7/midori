<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "adminheader.jsp" %>

<div class="col-md-10" style="margin-top:100px; margin-left:300px; width:1000px;">
	<h2 style="padding-left:10px; padding-bottom:30px;">관리자 로그인</h2>
	<div class="col-md-12">
	<form id="dd" class="form-horizontal" name="admin" method="post" action="/login" >
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	
	<div class="form-group">
		<label for="id" class="col-sm-2 control-label">아이디</label>
		<div class="col-sm-10">
			<input type="text" name="username" class="form-control" id="userid" placeholder="아이디 입력">
		</div>
	</div>
	
	<div class="form-group">
		<label for="pw" class="col-sm-2 control-label">패스워드</label>
		<div class="col-sm-10">
			<input type="password" name="password" class="form-control" id="password" placeholder="패스워드 입력">
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
	      <input type="submit" class="btn btn-default" onClick="admin_check();" value="로그인"> &nbsp;&nbsp;&nbsp;
	    </div>
	</div>
	</form>
	</div>
</div>
<script type="text/javascript">
	function admin_check() {
		if(admin.userid.value=="") {
			alert("아이디입력");
			admin.userid.focus();
			return false;
		}
		if (admin.password.value=="") {
			alert("패스워드입력");
			admin.password.focus();
			return false;
		}
		admin.submit();
	}
</script>	