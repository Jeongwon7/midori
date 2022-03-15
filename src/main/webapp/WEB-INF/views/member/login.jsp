<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../mainheader.jsp"%>

    <!-- contents -->

    			<div class="midori_main">
    			 <div class="section_login">
    				<h2 class="login_h2">로그인</h2>
    				<div class="login_form">
    				 <div class="login_view">
    				 <form id="dd" class="form-horizontal" name="dd" method="post" action="/login" >
					  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					  
					  <div class="form-group">
					    <label for="userid" class="col-sm-2 control-label"></label>
					    <div class="col-sm-12">
					      <input type="text" name="username" class="form-control m_id" id="userid" placeholder="아이디를 입력 해주세요">
					      <span id="msg">${requestScope.error}</span>
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="userpwd" class="col-sm-2 control-label"></label>
					    <div class="col-sm-12">
					      <input type="password" name="password" class="form-control" id="userpwd" placeholder="패스워드를 입력 해주세요">
					    </div>
					  </div>
					   <div class="check_box">
					    <div class="login_search">
					     <button type="button" class="btn btn-default login_link" onclick="location.href='/member/findIdPwd.do'">아이디　|　 비밀번호 찾기</button>
					    </div>
					   </div>
					  <div class="form-group">
					      <button type="submit" class="btn_type1" >
					       <span class="txt_type">로그인</span>
					      </button>
					      <button type="button" class="btn_type2" onclick="location.href='/member/join.do'">
					        <span class="txt_type">회원가입</span>
					      </button>
					  </div>
					</form>
				   </div>
				  </div>
    			</div><!-- 9 end -->
    		  </div>
    		</div>
    	</div>
    </section>
    <!-- contents end -->

	<%@ include file="../footer.jsp" %>