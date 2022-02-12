<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../header.jsp"%>

    <!-- contents -->

    			<div class="col-md-9 newitem" style="margin-bottom: 40px; ">
    				<h2>로그인</h2>
    				
    				<form id="dd" class="form-horizontal" name="dd" method="post" action="/login" >
					  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					  
					  <div class="form-group">
					    <label for="userid" class="col-sm-2 control-label">아이디</label>
					    <div class="col-sm-10">
					      <input type="text" name="username" class="form-control" id="userid" placeholder="아이디 입력">
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="userpwd" class="col-sm-2 control-label">패스워드</label>
					    <div class="col-sm-10">
					      <input type="password" name="password" class="form-control" id="userpwd" placeholder="패스워드 입력">
					    </div>
					  </div>
					  <div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					      <input type="submit" class="btn btn-default" value="로그인"> &nbsp;&nbsp;&nbsp;
					      <button type="button" class="btn btn-default" onclick="location.href='/member/join.do'">회원가입</button>
					      <button type="button" class="btn btn-default" onclick="location.href='/member/findIdPwd.do'">아이디/비밀번호 찾기</button>
					    </div>
					  </div>
					  
					</form>
    			</div><!-- 9 end -->
    		</div>
    	</div>
    </section>
    <!-- contents end -->


<%@ include file = "../footer.jsp"%>