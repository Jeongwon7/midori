<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "adminheader.jsp" %>
<body>
	<div style="margin-top:100px; margin-left:300px;">
		<p>odlist: ${odlist}</p>
		<p>${status}</p>
		<c:if test="${status == 3 or status == 4}">
			<a href="https://tracker.delivery/#/kr.cjlogistics/${odlist[0].track }" 
			onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;">배송조회</a>
		</c:if>
	
	<form name="opfrm" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<input type="hidden" name="status" value="${status}">
	<input type="hidden" name="oseq" value="${odlist[0].oseq }">
	<c:choose>
		<c:when test="${status == 1}">
			<input type="button" value="입금확인" onclick="orderPro1()">
		</c:when>
		<c:when test="${status == 2}">
			<input type="text" name="track" placeholder="운송장번호 입력">
			<input type="button" value="발송처리" onclick="orderPro2()">
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
			<input type="button" value="목록으로" onclick="history.back()">
	</form>
	</div>
</body>
</html>
<script>
	function orderPro1(){
		var theForm = document.opfrm;
		var msg = confirm("임급확인 하시겠습니까?");
		if(msg == true){
			alert("입금확인 처리되었습니다")
			theForm.action = "/adm/orderstatuspro.do";
			theForm.submit();
		}
	}
	function orderPro2(){
		var theForm = document.opfrm;
		
		if(!theForm.track.value){
			alert("운송장 번호 입력하세요");
			theForm.track.focus();
		}else{
			var msg = confirm("발송처리 하시겠습니까?");
			if(msg == true){
				alert("발송 처리되었습니다")
				theForm.action = "/adm/orderstatuspro.do";
				theForm.submit();
			}
		}//else
	}
</script>