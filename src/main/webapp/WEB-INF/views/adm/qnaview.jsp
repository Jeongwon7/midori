<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "adminheader.jsp" %>
<body>
	<div style="margin-top:100px; margin-left:300px; width:1200px;">
		<div class="container">
		<div class="board_view">
			<h2>${qvo.qtitle}</h2>
			<p class="info">${qvo.kind} | ${qvo.pname} | <span class="user">${qvo.qwriter}</span> |<fmt:parseDate var="regdate" value="${qvo.qregdate}" pattern="yyyy-MM-dd"/><!-- String에서 Date타입으로 -->
						<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd"/></p>
			<div class="board_body">
				<p>${qvo.qcontent}</p>
			</div>
			<c:choose>
				<c:when test="${qvo.status == 1}">
					<div class="btn_3wrap" style="margin:30px auto 30px 460px;">
						<input type="button" onclick="QuestionDel()" value="삭제">
						<input type="button" onclick="javascript:history.back();" value="목록">
						<input type="button" onclick="answer_write()" value="답변등록">
							<form name="qaform" method="get">
								<input type="hidden" name="qbno" value="${qvo.qbno}">
								<input type="hidden" name="ref" value="${qvo.ref}">
							</form>
					</div>
				</c:when>
				<c:otherwise>
					<div class="btn_3wrap" style="margin:30px auto 30px 515px;">
						<input type="button" onclick="QuestionDel()" value="삭제">
						<input type="button" onclick="javascript:history.back();" value="목록">
					</div>
				</c:otherwise>
			</c:choose>
			<div>
				<h2>답변 내용</h2>
				<c:if test="${qvo.status == 2}">
					<div class="board_body">
						${qvo.acontent}
					</div>
					<div class="btn_3wrap" style="margin:30px auto 30px 515px;">
							<input type="button" onclick="AnswerDel()" value="삭제">
							<input type="button" onclick="AnswerModify()" value="수정">
					</div>
				</c:if>
				<c:if test="${qvo.status == 1}">
					<div>
						<p style="text-align:center;">답변이 등록되지 않았습니다</p>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	</div>
</body>
<script>
//질문 삭제
function QuestionDel(){
	var msg = confirm("삭제하시겠습니까?");
	if(msg){
		alert("삭제되었습니다");
		location.href="/adm/questiondelete.do?qbno="+${qvo.qbno};
	}
}
//답변 작성
function answer_write(){
	var theForm = document.qaform;
	
	theForm.action ="/adm/answerwrite.do";
	
	theForm.submit();
}
//답변수정
function AnswerModify(){
	location.href="/adm/answermodify.do?qbno="+${qvo.qbno}+"&abno="+${qvo.abno};
}
//답변삭제//abno, qbno
function AnswerDel(){
	var msg = confirm("삭제하시겠습니까?");
	if(msg){
		alert("삭제되었습니다");
		location.href="/adm/answerdelete.do?qbno="+${qvo.qbno}+"&abno="+${qvo.abno};
	}
}
</script>
</html>