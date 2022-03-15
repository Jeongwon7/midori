<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "adminheader.jsp" %>
<body>
	<div class="col-md-12 col-sm-12" style="margin-left:370px; width:1100px; margin-top:20px;">
		<h2 style="padding-left:10px; padding:30px 0;"><a href="/adm/qna.do">문의관리</a></h2>
		<div style="width:50%; float:left;">
		<table class=table3_1>
			<tr>
				<th>
					<h2>${qvo.qtitle}</h2>
					<p class="info">${qvo.kind} | ${qvo.pname} | <span class="user">${qvo.qwriter}</span> |<fmt:parseDate var="regdate" value="${qvo.qregdate}" pattern="yyyy-MM-dd"/><!-- String에서 Date타입으로 -->
					<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd"/></p>
				</th>
			</tr>
			<tr>
				<td>
					<div style="text-align:center;">
						<p style="text-align:center;">${qvo.qcontent}</p>
					</div>
				</td>
			</tr>
			<tr>
				<td style="height:100px;">
					<c:choose>
					<c:when test="${qvo.status == 1}">
						<div style="text-align: center;">
							<input type="button" onclick="QuestionDel()" value="삭제" class="rarara" style="width: 100px; height: 50px; line-height: 25px; margin: 0 5px;">
							<input type="button" onclick="location.href='/adm/qna.do'" value="목록" class="rarara" style="width: 100px; height: 50px; line-height: 25px; margin: 0 5px;">
							<input type="button" onclick="answer_write()" value="답변등록" class="rarara" style="width: 100px; height: 50px; line-height: 25px; margin: 0 5px;">
								<form name="qaform" method="get">
									<input type="hidden" name="qbno" value="${qvo.qbno}">
									<input type="hidden" name="ref" value="${qvo.ref}" >
								</form>
						</div>
					</c:when>
					<c:otherwise>
						<div style="text-align: center;">
							<input type="button" onclick="QuestionDel()" value="삭제" class="rarara" style="width: 100px; height: 50px; line-height: 25px; margin: 0 5px;">
							<input type="button" onclick="location.href='/adm/qna.do'" value="목록" class="rarara" style="width: 100px; height: 50px; line-height: 25px; margin: 0 5px;">
						</div>
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
		</table>
		</div>
		
		<div style="width:50%; float:right;">
		<table class=table3_1>
			<tr>
				<th>
					<h2 style="height:75px; padding:20px;">답변 내용</h2>
				</th>
			</tr>
			<tr>
				<td>
					<c:if test="${qvo.status == 2}">
						<div style="text-align:center; margin-top: 40px;">
							${qvo.acontent}
						</div>
						<div style="text-align: center; margin-top: 80px;">
								<input type="button" onclick="AnswerDel()" value="삭제" class="rarara" style="width: 100px; height: 50px; line-height: 25px; margin: 0 5px;">
								<input type="button" onclick="AnswerModify()" value="수정" class="rarara" style="width: 100px; height: 50px; line-height: 25px; margin: 0 5px;">
						</div>
					</c:if>
					<c:if test="${qvo.status == 1}">
						<div style="height:100px;">
							<p style="text-align:center;">답변이 등록되지 않았습니다</p>
						</div>
					</c:if>
				</td>
			</tr>
		</table>
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