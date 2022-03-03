<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "adminheader.jsp" %>
<body>
	<div style="margin-top:100px; margin-left:300px; width:1200px;">
		
		<!-- 네모 띵띵띵띵 누르면 링크(해당 주문관리 페이지)로 가게! -->
		<a href="/adm/orderlist.do?status=1"><p>입금확인 대기 ${count1} 건</p></a>
		<a href="/adm/orderlist.do?status=2"><p>배송대기 ${count2} 건</p></a>
		<a href="/adm/orderlist.do?status=3"><p>배송중 ${count3} 건</p></a>
		<a href="/adm/orderlist.do?status=4"><p>배송완료${count4} 건</p></a>
		<div class="jw-charts-2wrap">
			<div id="Weekly_Sales" style="margin-top:10px;"></div>
			<div id="Monthly_Top10" ></div>
		</div>
		<div><!-- 상품 문의 -->
			<h3 style="font-weight:bold;">상품문의 현황</h3>
			<input class="float-right" type="button" onclick="location.href='/adm/qna.do'" value="더보기">
			<table class="table jw_table">
			<caption class="sr-only">상품문의 리스트</caption>
			<colgroup>
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="*">
				<col width="10%">
				<col width="10%">
				<col width="10%">
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>문의분류</th>
					<th>카테고리</th>
					<th>상품명</th>
					<th>제목</th>
					<th>답변상태</th>
					<th>아이디</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody class="review_box">
			<c:set var="num" value="${qnaList.size() - (qnaList.size()-1)}"/>
			<c:forEach var="list" items="${qnaList}">
			<c:if test ="${not empty list}">
				<tr>
					<td>${num}</td>
					<c:choose>
						<c:when test="${list.category eq 1 }">
							<td>상품문의</td>
						</c:when>
						<c:when test="${list.category eq 2 }">
							<td>배송문의</td>
						</c:when>
						<c:otherwise>
							<td>기타문의</td>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${list.kind eq '1'}">
							<td>샐러드</td>
						</c:when>
						<c:when test="${list.kind eq '2'}">
							<td>닭가슴살</td>
						</c:when>
						<c:when test="${list.kind eq '3'}">
							<td>다이어트도시락</td>
						</c:when>
						<c:when test="${list.kind eq '4'}">
							<td>샌드위치</td>
						</c:when>
						<c:when test="${list.kind eq '5'}">
							<td>프로틴</td>
						</c:when>
						<c:when test="${list.kind eq '6'}">
							<td>저칼로리간식</td>
						</c:when>
						<c:otherwise>
							<td>무설탕음료</td>
						</c:otherwise>
					</c:choose>
					<td>${list.pname }</td>
					<td class="title"><a href="/adm/qnaview.do?qbno=${list.qbno}">${list.qtitle}</a></td>
					<c:choose>
						<c:when test="${list.status == 1}">
							<td>답변대기</td>
						</c:when>
						<c:otherwise>
							<td>답변완료</td>
						</c:otherwise>
					</c:choose>
					<td>${list.qwriter}</td>
					<td>
						<fmt:parseDate var="regdate" value="${list.qregdate}" pattern="yyyy-MM-dd"/><!-- String에서 Date타입으로 -->
						<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd"/><!-- 날짜 형식을 출력 -->
					</td>
				</tr>
				</c:if>
				<c:set var="num" value="${num+1}" />
			</c:forEach>
			<c:if test="${empty qnaList }">
				<tr><td colspan="8" style="text-align:center;">상품 문의가 없습니다</td></tr>
			</c:if>
			</tbody>
		</table>
		</div>
		<div><!-- 리뷰 -->
			<h3 style="font-weight:bold;">상품후기 현황</h3>
			<input class="float-right" type="button" onclick="location.href='/adm/review.do'" value="더보기">
			<table class="table table-hover my_reviewtbl jw_table">
				<caption class="sr-only">리뷰 리스트</caption>
				<colgroup>
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="*">
					<col width="5%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>카테고리</th>
						<th>상품명</th>
						<th>제목</th>
						<th>별점</th>
						<th>아이디</th>
						<th>등록일</th>
						<th>관리</th>
					</tr>
				</thead>
				<tbody class="review_box">
				<c:set var="num" value="${reviewList.size() - (reviewList.size()-1)}"/>
				<c:forEach var="list" items="${reviewList}">
				<c:if test ="${not empty list}">
					<tr class="item">
						<td>${num}</td>
							<c:choose>
								<c:when test="${list.kind eq '1'}">
									<td>샐러드</td>
								</c:when>
								<c:when test="${list.kind eq '2'}">
									<td>닭가슴살</td>
								</c:when>
								<c:when test="${list.kind eq '3'}">
									<td>다이어트도시락</td>
								</c:when>
								<c:when test="${list.kind eq '4'}">
									<td>샌드위치</td>
								</c:when>
								<c:when test="${list.kind eq '5'}">
									<td>프로틴</td>
								</c:when>
								<c:when test="${list.kind eq '6'}">
									<td>저칼로리간식</td>
								</c:when>
								<c:otherwise>
									<td>무설탕음료</td>
								</c:otherwise>
							</c:choose>
						
						<td>${list.pname}</td>
						<td class="title">${list.title}</td>
						<td>${list.star}/5 </td>
						<td>${list.writer}</td>
						<td>
							<fmt:parseDate var="regdate" value="${list.regdate }" pattern="yyyy-MM-dd"/><!-- String에서 Date타입으로 -->
							<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd"/><!-- 날짜 형식을 출력 -->
						</td>
						<td>
							<input type="button" onclick="review_deleteOpen(${list.rbno})" value="삭제" style="border: none; background: green; color:white;">
						</td>
					</tr>
					<tr class="hide">
						<td colspan="8">
							<div class="review_content_wrap">
								<div class="review_content">
									${list.content}
								</div>
							</div>
						</td>
					</tr>
					</c:if>
					<c:set var="num" value="${num+1}" />
				</c:forEach>
				<c:if test="${empty reviewList }">
					<tr><td colspan="8" style="text-align:center;">상품 후기가 없습니다</td></tr>
				</c:if>
				</tbody>
			</table>
		</div>
		
	</div>
</body>
<script>
function review_delete(rbno){
	var msg = confirm("삭제하시겠습니까?");
	if(msg){
		alert("삭제되었습니다");
		location.href="/adm/reviewdeleteindex.do?rbno="+rbno;
	}
}

</script>
<script>
	$(function(){ 

        var article = (".my_reviewtbl .my_show");  
        
        $(document).on('click', '.my_reviewtbl .item  td', function() { 

            var myArticle =$(this).parents().next("tr");  

            if($(myArticle).hasClass('hide')) {

                $(article).removeClass('my_show').addClass('hide');  

                $(myArticle).removeClass('hide').addClass('my_show');  

            }  

            else {  

                $(myArticle).addClass('hide').removeClass('my_show');  

            }  

        }); 
});  
	</script>
<script>
	google.charts.load('current', {'packages':['corechart']});
	
	//월간 판매 top10
	google.charts.setOnLoadCallback(drawMonthlyChart);
	
	//주간 매출 정보
	google.charts.setOnLoadCallback(drawWeeklyChart);
	
	function drawMonthlyChart() {
	
	  // Create the data table.
	  var data = new google.visualization.DataTable();
	  data.addColumn('string', 'product');
	  data.addColumn('number', 'sales');
	  data.addRows([
	    ['${monthly10[0].pname}', 123],
	    ['${monthly10[1].pname}', 90],
	    ['${monthly10[2].pname}', 86],
	    ['${monthly10[3].pname}', 40],
	    ['${monthly10[4].pname}', 32]
//	    ['${monthly10[5].pname}', ${monthly10[5].sales_count}],
//	    ['${monthly10[6].pname}', ${monthly10[6].sales_count}],
//	    ['${monthly10[7].pname}', ${monthly10[7].sales_count}],
//	    ['${monthly10[8].pname}', ${monthly10[8].sales_count}],
//	    ['${monthly10[9].pname}', ${monthly10[9].sales_count}]
	  ]);
	
	  // Set chart options
	  var options = {'title':'월간 판매 순위 Top5',
			 		 'fontSize': 18,
	                 'width':600,
	                 'height':500};
	
	  // Instantiate and draw our chart, passing in some options.
	  var chart = new google.visualization.PieChart(document.getElementById('Monthly_Top10'));
	  chart.draw(data, options);
}
	//주간 매출 정보
   function drawWeeklyChart() {
	      var data = google.visualization.arrayToDataTable([
	        ["Element", "원: ", { role: "style" } ],
	        ["매출액", 4164550, "red"],
	        ["수익", 1249365, "gold"],
	        ["원가", 2915185, "green"]
	      ]);

	      var view = new google.visualization.DataView(data);
	      view.setColumns([0, 1,
	                       { calc: "stringify",
	                         sourceColumn: 1,
	                         type: "string",
	                         role: "annotation" },
	                       2]);

	      var options = {
	        title: "주간 매출 정보",
	        'fontSize': 18,
	        width: 600,
	        height: 400,
	        bar: {groupWidth: "95%"},
	        legend: { position: "none" },
	      };
	      var chart = new google.visualization.BarChart(document.getElementById("Weekly_Sales"));
	      chart.draw(view, options);
	  }
</script>
</html>
