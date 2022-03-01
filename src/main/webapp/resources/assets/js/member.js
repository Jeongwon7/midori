function goJoin() {
   if(document.aaa.id.value == "") {
      alert("아이디 입력");
      aaa.id.focus();

   }else if(aaa.pwd.value != aaa.pwdcheck.value) {
      alert("패스워드 확인");
      aaa.pwd.focus;
   }else if(aaa.pwd.value != aaa.pwdcheck.value) {
      alert("패스워드 확인");
      aaa.pwd.focus;
   }else if(document.aaa.name.value == "") {
      alert("이름 입력");
      aaa.name.focus();
   }else if(document.aaa.id.value == "") {
      alert("아이디 입력");
      aaa.id.focus();
   }else if(document.aaa.email.value == "") {
      alert("이메일 입력");
      aaa.email.focus();
   }else if(document.aaa.member_post.value == "") {
      alert("우편번호 입력");
      aaa.member_post.focus();
   }else if(document.aaa.address2.value == "") {
      alert("나머지주소 입력");
      aaa.address2.focus();
   }else if(document.aaa.phone.value == "") {
      alert("전화번호 입력");
      aaa.phone.focus();
   }else{
      aaa.action="/member/memberinsertpro.do";
      aaa.submit();
   }
}

function fn_login(){
         
      if(login.username.value == ""){
         alert("아이디를 입력하세요.")
         login.username.focus();
         return false;
      }
      if(login.password.value == ""){
         alert("비밀번호를 입력하세요.")
         login.password.focus();
         return false;
      }
      
      var form = document.login;
      form.action = "/login";
      form.submit();
}


function findAddr(){
   new daum.Postcode({
        oncomplete: function(data) {
           
           console.log(data);
           
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('member_post').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("member_addr").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("member_addr").value = jibunAddr;
            }
        }
    }).open();
}

//id 존재여부
$(function() {

   $("#id").blur(function() {

      $.ajax({
         type:"get",
         url:"/member/checkUserid.do",
         data:{id:$("#id").val()},
         //contentType:"application/json; charset=utf8", 보내는 타입
         dataType:"json", //받는 타입
         success:function(data) {
            if(data != 1) {
               if($("#id").val() != "") {
                  $("#msg").html("사용 가능한 아이디 입니다");
               }
            }else{
               if($("#id").val() != "") {
                  $("#msg").html("사용 불가능한 아이디 입니다");
            //      $("#id").val("");
                  $("#id").focus();
               }
            }
         }, error:function() {
            alert("통신에러");
         }
      })
   })
});