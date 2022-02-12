<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../header.jsp"%>

    
    			<div class="col-md-9 newitem" style="margin-bottom: 40px;">
    				<h2>회원가입</h2>
    				<form class="form-horizontal" name="aaa" method="post">
					  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					  
					  <div class="form-group">
					    <label for="id" class="col-sm-2 control-label">아이디</label>
					    <div class="col-sm-10">
					      <input type="text" name="id" class="form-control" id="id" placeholder="아이디 입력">
					      <span id="msg"></span>
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="pwd" class="col-sm-2 control-label">패스워드</label>
					    <div class="col-sm-10">
					      <input type="password" name="pwd" class="form-control" id="pwd" placeholder="암호입력">
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="pwdcheck" class="col-sm-2 control-label">패스워드 확인</label>
					    <div class="col-sm-10">
					      <input type="password" name="pwdcheck" class="form-control" id="pwdcheck" placeholder="암호확인">
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="name" class="col-sm-2 control-label">이름</label>
					    <div class="col-sm-10">
					      <input type="text" name="name" class="form-control" id="name" placeholder="이름입력">
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="email" class="col-sm-2 control-label">이메일</label>
					    <div class="col-sm-10">
					      <input type="text" name="email" class="form-control" id="email"  placeholder="이메일입력">
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="member_post" class="col-sm-2 control-label">주소</label>
					    <div class="col-sm-10">
					      <input type="text" name="zip_num"  id="member_post" onclick="findAddr()" placeholder="우편번호" readonly>
					      <input type="button" value="우편번호 찾기" onclick="findAddr()">
					      <input type="text" name="address1" class="form-control"  placeholder="주소" id="member_addr">
					      <input type="text" name="address2" id="address2" class="form-control"  placeholder="나머지 주소">
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="phone" class="col-sm-2 control-label">전화번호</label>
					    <div class="col-sm-10">
					      <input type="text" name="phone" class="form-control" id="phone" placeholder="전화번호 입력">
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					    	<button type="button" class="btn btn-default " onclick="goJoin()" style="background-color: #49904E; color: #051922; border-radius: 50px; font-weight: 700; text-transform: uppercase; font-size: 15px; border: none !important; cursor: pointer; padding: 6px 14px;">회원가입</button>
					    	<button type="reset" class="btn btn-default">취소</button>
					    </div>
					  </div>
					  
					</form>
    			</div><!-- 9 end -->
    		</div>
    	</div>
    </section>
    <!-- contents end -->


<%@ include file = "../footer.jsp"%>