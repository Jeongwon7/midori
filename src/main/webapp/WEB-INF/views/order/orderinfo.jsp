<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../header.jsp" %>
<body>
	<h3>주문정보</h3>
	<table>
		<tr>
			<th>번호</th>
			<th>상품이미지</th>
			<th>상품명</th>
			<th>가격</th>
			<th>수량</th>
		</tr>
		<c:forEach var="list" items="${cartlist}">
			<tr>
				<td>${list.pseq}</td>
				<td><img src="/upload/${list.image}" alt="상품 사진" class="w100"></td>
				<td>${list.pname}</td>
				<td>${list.price2}</td>
				<td>${list.quantity}</td>
			</tr>
		</c:forEach>
		<tr>
			<td>총액: ${totalPrice} 원</td>
		</tr>
	</table>
	<h3>배송 정보</h3>
	
		<span>받는 사람</span>
		<input type="text" name="oname" value="${mvo.name}">
		<br>
		<span>휴대폰</span>
		<input type="text" name="phone" value="${mvo.phone}">
		<br>
		<span>우편번호</span>
		<input type="text" name="zip_num"  id="member_post" onclick="findAddr()" value="${mvo.zip_num}" readonly>
	    <input type="button" value="우편번호 찾기" onclick="findAddr()">
	    <br>
	    <span>주소</span>
	    <input type="text" name="address1" class="form-control" id="member_addr" value="${mvo.address1}">
	    <br>
	    <span>상세주소</span>
	    <input type="text" name="address2" id="address2" class="form-control"  value="${mvo.address2}">
	    <br>
	
	 <input type="button" id="check_module" value="결제하기"><!--  -->
	 
		<form method="post" name="orderfrm">
		 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		 	<!--<c:forEach var="list" items="${cartlist}">-->
		 		<input type="hidden" name="cseq" value="${cartlist[0].cseq}"><!--  -->
		 		<input type="hidden" name="pseq" value="${cartlist[0].pseq}">
		 		<input type="hidden" name="quantity" value="${cartlist[0].quantity}">
		 	<!--</c:forEach>-->
		 		<input type="hidden" name="oname" value="${mvo.name}">
		 		<input type="hidden" name="phone" value="${mvo.phone}">
		 		<input type="hidden" name="zip_num" value="${mvo.zip_num}">
		 		<input type="hidden" name="address1" value="${mvo.address1}">
		 		<input type="hidden" name="address2" value="${mvo.address2}">
		 </form>
</body>
	
<script type="text/javascript">
$(function(){

    $("#check_module").click(function () {
    	var IMP = window.IMP; // 생략가능
    	IMP.init('imp78738453');
    	// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
    	// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
    	IMP.request_pay({
    	pg: 'inicis', // version 1.1.0부터 지원.
    	/*
    	'kakao':카카오페이,
    	html5_inicis':이니시스(웹표준결제)
    	'nice':나이스페이
    	'jtnet':제이티넷
    	'uplus':LG유플러스
    	'danal':다날
    	'payco':페이코
    	'syrup':시럽페이
    	'paypal':페이팔
    	*/
    	pay_method: 'card',
    	/*
    	'samsung':삼성페이,
    	'card':신용카드,
    	'trans':실시간계좌이체,
    	'vbank':가상계좌,
    	'phone':휴대폰소액결제
    	*/
    	merchant_uid: 'merchant_' + new Date().getTime(),
    	/*
    	merchant_uid에 경우
    	https://docs.iamport.kr/implementation/payment
    	위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
    	참고하세요.
    	나중에 포스팅 해볼게요.
    	*/
    	//정보 수정 해야함!!
    	name: "${cartlist[0].pname}"+" 외"+"${cartlist.size()-1}"+"건",
    	//결제창에서 보여질 이름
    	amount: "${totalPrice}",
    	//가격
    	buyer_email: '${mvo.email}',
    	buyer_name: '${mvo.name}',
    	buyer_tel: '${mvo.phone}',
    	buyer_addr: '${mvo.address1}'+'${mvo.address2}',
    	buyer_postcode: '${mvo.zip_num}',
    	m_redirect_url: '/'
    	/*
    	모바일 결제시,
    	결제가 끝나고 랜딩되는 URL을 지정
    	(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
    	*/
    	}, function (rsp) {
    	console.log(rsp);
    	if (rsp.success) {
    	var msg = '결제가 완료되었습니다.';
    	msg += '고유ID : ' + rsp.imp_uid;
    	msg += '상점 거래ID : ' + rsp.merchant_uid;
    	msg += '결제 금액 : ' + rsp.paid_amount;
    	msg += '카드 승인번호 : ' + rsp.apply_num;
    	
    	orderInsert();
    	
    	} else {
    	var msg = '결제에 실패하였습니다.';
    	msg += '에러내용 : ' + rsp.error_msg;
    	}
    	alert(msg);
    	});
    	});
}); 
function orderInsert(){
	document.orderfrm.action = "/order/orderInsert.do";
	document.orderfrm.submit();
}
</script>
</html>