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
                 <p class="col-md-12"><a href="../mypage/cart_list">장바구니</a></p>
                </li>
                <li>
                 <p class="col-md-12"><a href="../order/ordering">진행중인 주문 내역</a></p>
                </li>
                <li>
                 <p class="col-md-12"><a href="../order/orderall">총 주문 내역</a></p>
                </li>
                <li class="on">
                 <p class="col-md-12"><a href="../member/email.do">개인 정보 변경</a></p>
                </li>
               </ul>
                </div>
               </div>
               <div class="page_section section_myinfo type_form">
                <div class="head_aticle">
                 <h2 class="tit">개인 정보 수정</h2>
                </div>
               <div class="mypage_email">
                <div class="field_email">
                 <h2 class="tit">
                                        이메일  재확인
                 </h2>
                 <p class="sub">회원님의 정보를 안전하게 보호하기 위해 이메일을 다시 한번 확인해주세요.</p>
                 <form id="login" name="login">
                  <table class="tbl_comm">
                   <tbody>
                    <tr class="fst">
                     <th>이메일</th>
                     <td>
                     <div class="fl_clear mail_check_wrap">
                      <input name="sm_email" type="text" class="mail_input input_email" placeholder="이메일을 입력 해주세요" >
                      <input type="button" value="이메일인증" class="mail_check_button member_checked member_btn" style="color:#49904E;" id="emailChk" style="display:inline-block; width:100px;">
                      </div>
                     </td>
                    </tr>
                    <tr>
                     <th>인증번호<span class="member_ico">*</span></th>  
                     <td>
                     <div class="mail_check_input_box">
                       <input name="sm_email2" type="password" class="mail_check_input input_email" placeholder="받은 인증번호를 입력 해주세요" disabled="disabled">
                       <input type="button" value="인증확인" id="jyh" class="mail_check_input member_checked member_btn" name="emailChk2" >
                      <span id="sendmessage"class="mail_check_input_box_warn"></span>
                           <input type="hidden" id="emailDoubleChk"/>
                     </div>
                     </td>
                   </tbody>
                 </table>
                  <input id="checkbutton" disabled="disabled" type="button" onclick="location.href='/member/memberModify.do'" class="email_button email_ok" value="확인">
                </form>
               </div>
               </div>
               </div>
             <!--    <div class="login_form">
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
                </div> -->
            </div>
            </div>
            </div>
   </div>
   <!-- end contents -->
<script>
var code = "";
$(".mail_check_button").click(function(){
   
   var email = $(".mail_input").val();            // 이메일 인증
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

               alert("인증메일이 전송 되었습니다.");
           }        

       });

});

$("#jyh").on("click",function(){

   
   console.log("code"+code);
   var inputCode = $("input[name=sm_email2]").val(); 
   console.log("입력값 : "+inputCode)
   console.log(inputCode);// 입력코드    
    var checkResult = $(".mail_check_input_box_warn");    // 비교 결과 
  
    

    if(code == "" && inputCode == ""){                            // 일치할 경우
    
       $(sendmessage).html("인증번호를 다시 확인해주세요.");
        checkResult.attr("class", "incorrect");
        $("#checkbutton").attr("disabled", true);
    }    
    else{
       if(code==inputCode) {                                            // 일치하지 않을 경우
          
          checkResult.attr("class", "correct");  
          $("#sendmessage").html("인증번호가 일치합니다.");
           $("#checkbutton").attr("disabled", false);
         } else{
          
            $("#checkbutton").attr("disabled", true);
             $("#sendmessage").html("인증번호를 다시 확인해주세요.");
              checkResult.attr("class", "incorrect");
         }
    }
    
    

});



$(function(){
   
   
})


</script>


<%@ include file = "../footer.jsp" %>