<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/resources/adminassets/css/admin-member.css">

<html> 
	<head> 
		<meta name="viewport" content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0"> 
	</head> 
	<body> 
	<div class="adminback">
		<div class="adminLogin">
			<h2 style="text-align: center;">Admin Login</h2> 
			<form id="dd" action="/login" name="admin" method="POST" onsubmit="return admin_check()"> 
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<div class="input-box1"> 
					<input id="userid" type="text" name="username" placeholder="아이디"> 
					<label for="username">아이디</label> 
				</div> 
				<div class="input-box1"> 
					<input id="password" type="password" name="password" placeholder="비밀번호"> 
					<label for="password">비밀번호</label> 
				</div>
				<input type="submit" class="w-btn w-btn-gray" value="로그인"> 
			</form> 
		</div>
	</div>
	</body> 
</html>

<script type="text/javascript">
	function admin_check() {
		if(admin.userid.value=="") {
			alert("아이디입력");
			admin.userid.focus();
			return false;
		}else if(admin.password.value==""){
			alert("패스워드입력");
			admin.password.focus();
			return false;
		}else{
			admin.submit();
		}
		
	}
</script>	