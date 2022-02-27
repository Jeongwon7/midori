$(function() {
   var total = function(n) {
   var price=$(".newitem .information span").attr("class");
   var amount = $(".quantity").attr("value"); //수량
   var amount = parseInt(amount); //정수 숫자 변환
   var amount = amount + n; //수량 증가 감소 수식
   if(amount < 1) {
      amount = 1;
      alert("최소 수량은 1개 입니다");
   }
   var tot = price * amount; //수량 * 단가

   $(".quantity").attr("value",amount); 
   var regexp=/\B(?=(\d{3})+(?!\d))/g;
   var tot = tot.toString().replace(regexp,',');
   $(".total").html(tot);
  }
  total(0);
  $(".plus").on("click",function() {
     total(1);
  });
  $(".minus").on("click",function() {
     total(-1);
  });
});
