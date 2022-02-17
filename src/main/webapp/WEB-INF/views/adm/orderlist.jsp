<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "adminheader.jsp" %>
<body>
	<c:choose>
		<c:when test="${olist[0].oseq == null}">
			<div style="margin-top:100px; margin-left:250px;">
				<p>${title}</p>
				<p>현황 없음</p>
			</div>
		</c:when>
		<c:otherwise>
			<div style="margin-top:100px; margin-left:250px;">
				<p>${title}</p>
				<p>${olist}</p>
				<p>건수: ${count}</p>
				<a href="/adm/orderview.do?oseq=${olist[0].oseq}">상세보기</a>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>