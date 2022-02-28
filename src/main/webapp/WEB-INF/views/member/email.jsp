<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../mypage/mypageHeader.jsp" %>

	<div class="col-md-9">
			<div class="member_boxL">
                <h4>회원 정보 수정을 위한 메일 인증</h4>
                <div class="login_form">
                    <form id="login" name="login">
	                     <div class="fl_clear mail_check_wrap">
	                    	<input name="sm_email" type="text" class="mail_input" placeholder="이메일 입력" >
	                    	<input type="button" value="이메일인증" class="mail_check_button" id="emailChk" style="display:inline-block; width:100px;">
	                    </div>
	                    <div class="fl_clear">
	                    	<div class="mail_check_input_box">
	                    		<input name="sm_email2" type="text" class="mail_check_input" placeholder="인증번호 입력" disabled="disabled">
	                  			<input type="button" value="인증확인" id="emailChk2" class="mail_check_input" name="emailChk2" style="display:inline-block; width:100px;"><br>
	                    	</div>
	                  		<span class="mail_check_input_box_warn"></span>
	                  		<input type="hidden" id="emailDoubleChk"/>
	                   </div>
	                   <input type="button" onclick="location.href='/member/memberModify.do'" style="display:inline-block; width:100px;" value="회원 정보 수정">
                    </form>
                </div>
            </div>
            </div>
            </div>
	</div>
	<!-- end contents -->
<script>
var code = "";
$(".mail_check_button").click(function(){
	
	
	var email = $(".mail_input").val();				// 이메일 인증
	var cehckBox = $(".mail_check_input");        // 인증 확인
    var boxWrap = $(".mail_check_input_box");    // 인증번호 입력란 박스 만약에 되면 여기 링크타는거 해보기 location.replace();
	 $.ajax({
	        
	        type:"GET",
	        url:"mailCheck?email=" + email,
	        success:function(data){
	        	 console.log("data : " + data);
	        	 cehckBox.attr("disabled",false);
	             boxWrap.attr("id", "mail_check_input_box_true");
	        	 
	        	 code = data;//인증번호 이메일 전송 메서드 내의 ajax success 코드에 Controller부터 전달받은 인증번호를 위에서 선언한 code에 저장시키는 코드를 추가
	        }        
	    });
	 
});

$(".mail_check_input").blur(function(){
	
	
	console.log("code"+code);
	var inputCode = $(".mail_check_input").val(); 
	console.log(inputCode);// 입력코드    
    var checkResult = $(".mail_check_input_box_warn");    // 비교 결과 
    console.log(5555);
    if(inputCode == code){                            // 일치할 경우
        checkResult.html("인증번호가 일치합니다.");
        console.log(5555);
        checkResult.attr("class", "correct");  
        console.log(5555);
    } else {                                            // 일치하지 않을 경우
        checkResult.html("인증번호를 다시 확인해주세요.");
        checkResult.attr("class", "incorrect");
    }    
});

</script>

<%@ include file = "../footer.jsp" %>