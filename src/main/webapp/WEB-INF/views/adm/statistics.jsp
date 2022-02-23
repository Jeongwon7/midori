<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "adminheader.jsp" %>
<body>
	<div style="margin-top:100px; margin-left:300px; margin-bottom:100px;">
	<h3 style="font-weight: bold;">통계 분석</h3>
		<div class="jw-charts-2wrap">
		<!-- 전체기간  판매량 top10 -->
		<div id="AllSales"></div>
		<!-- 오늘 판매량 top5 -->
		<div id="TodaysBest" style="margin-top:30px; width: 500px;">
			<c:choose>
				<c:when test="${empty todayBest}">
		
				</c:when>
				<c:otherwise>
				<h4 style="margin:30px; font-weight: bold;">일일 판매량 Top5</h4>
					<table class="table jw_table" >
						<tr>
							<th>순위</th>
							<th>카테고리</th>
							<th>상품명</th>
							<th>판매량</th>
						</tr>
				<c:set var="rank" value="${todayBest.size() - 4}" />
				<c:forEach var="list" items="todayBest">
					<tr>
						<td>${rank}</td>
						<c:choose>
							<c:when test="${list.kind == '1'}">
								<td>샐러드</td>
							</c:when>
							<c:when test="${list.kind == '2'}">
								<td>닭가슴살</td>
							</c:when>
							<c:when test="${list.kind == '3'}">
								<td>다이어트도시락</td>
							</c:when>
							<c:when test="${list.kind == '4'}">
								<td>샌드위치</td>
							</c:when>
							<c:when test="${list.kind == '5'}">
								<td>프로틴</td>
							</c:when>
							<c:when test="${list.kind == '6'}">
								<td>저칼로리간식</td>
							</c:when>
							<c:otherwise>
								<td>무설탕음료</td>
							</c:otherwise>
						</c:choose>
						<td>${list.pname}</td>
						<td>${list.sales_count}</td>
					</tr>
					<c:set var="num" value="${num+1}" />
				</c:forEach>
			</table>
				</c:otherwise>
			</c:choose>
			<h4 style="margin:30px; font-weight: bold;">일일 판매량 Top5</h4>
			<table class="table jw_table" >
				<tr>
					<th>순위</th>
					<th>카테고리</th>
					<th>상품명</th>
					<th>판매량</th>
				</tr>
				<tr>
					<td>1</td>
					<td>닭가슴살</td>
					<td>닭베스트</td>
					<td>47</td>
				</tr>
				<tr>
					<td>2</td>
					<td>닭가슴살</td>
					<td>닭베스트</td>
					<td>47</td>
				</tr>
				<tr>
					<td>3</td>
					<td>닭가슴살</td>
					<td>닭베스트</td>
					<td>47</td>
				</tr>
				<tr>
					<td>4</td>
					<td>닭가슴살</td>
					<td>닭베스트</td>
					<td>47</td>
				</tr>
				<tr>
					<td>5</td>
					<td>닭가슴살</td>
					<td>닭베스트</td>
					<td>47</td>
				</tr>
			</table>
		</div>
		</div>
		<div class="jw-charts-3wrap">
			<!-- 3일간 매출, 수익, 원가 정보 -->
			<div id="3DaysSales"></div>
			<!-- 3개월간 매출, 수익, 원가 정보 -->
			<div id="3MonthsSales"></div>
			<!-- 3년간 매출, 수익, 원가 정보 -->
			<div id="3YearsSales"></div>
		</div>
	</div>
</body>
<script>
	google.charts.load('current', {'packages':['corechart']});
	google.charts.load('current', {'packages':['bar']});
	
	// 전체기간 판매량 top10
	google.charts.setOnLoadCallback(AllSalesChart);
	
	// 3일간 매출, 수익, 원가 정보
	google.charts.setOnLoadCallback(ThreeDaysSalesChart);
	
	//3개월간 매출, 수익, 원가 정보
	google.charts.setOnLoadCallback(ThreeMonthsSalesChart);
	
	//3년간 매출, 수익, 원가 정보
	google.charts.setOnLoadCallback(ThreeYearsSalesChart);
	
	function AllSalesChart() {
		
		  // Create the data table.
		  var data = new google.visualization.DataTable();
		  data.addColumn('string', '상품명');
		  data.addColumn('number', '판매량');
		  data.addRows([
		    ['${AllSales[0].pname}', ${AllSales[0].sales_count}]
//		    ['${AllSales[1].pname}', ${AllSales[1].sales_count}],
//		    ['${AllSales[2].pname}', ${AllSales[2].sales_count}],
//		    ['${AllSales[3].pname}', ${AllSales[3].sales_count}],
//		    ['${AllSales[4].pname}', ${AllSales[4].sales_count}],
//		    ['${AllSales[5].pname}', ${AllSales[5].sales_count}],
//		    ['${AllSales[6].pname}', ${AllSales[6].sales_count}],
//		    ['${AllSales[7].pname}', ${AllSales[7].sales_count}],
//		    ['${AllSales[8].pname}', ${AllSales[8].sales_count}],
//		    ['${AllSales[9].pname}', ${AllSales[9].sales_count}]
		 
		  ]);
		
		  // Set chart options
		  var options = {'title':'전체기간 판매 순위 Top10',
				   		'fontSize': 20,
				   	   	'titlePosition': 'out',
		                 'width':600,
		                 'height':500};
		
		  // Instantiate and draw our chart, passing in some options.
		  var chart = new google.visualization.PieChart(document.getElementById('AllSales'));
		  chart.draw(data, options);
	}

	 function ThreeDaysSalesChart() {
	        var data = google.visualization.arrayToDataTable([
	          ['일', '매출', '수익', '원가'],
	          ['${toDay}', ${totalToday2}, ${totalToday3}, ${totalToday1}],
	          ['${yesterday}', ${totalAdayAgo2}, ${totalAdayAgo3}, ${totalAdayAgo1}],
	          ['${towDaysago}', ${totalTwoDaysAgo2}, ${totalTwoDaysAgo3}, ${totalTwoDaysAgo1}]
	        ]);

	        var options = {
	          chart: {
	            title: '3일간 매출 정보',
	            subtitle: 'Sales, Expenses, and Costs: for 3 days'
	          }
	        };

	        var chart = new google.charts.Bar(document.getElementById('3DaysSales'));

	        chart.draw(data, google.charts.Bar.convertOptions(options));
	      }
	 
	 function ThreeMonthsSalesChart() {
	        var data = google.visualization.arrayToDataTable([
	          ['월', '매출', '수익', '원가'],
	          ['${month}', ${totalThisMonth2}, ${totalThisMonth3}, ${totalThisMonth1}],
	          ['${month1}', ${totalAMonthAgo2}, ${totalAMonthAgo3}, ${totalAMonthAgo1}],
	          ['${month2}', ${totalTwoMonthsAgo2}, ${totalTwoMonthsAgo3}, ${totalTwoMonthsAgo1}]
	        ]);

	        var options = {
	          chart: {
	            title: '3개월간 매출 정보',
	            subtitle: 'Sales, Expenses, and Costs: for 3 months'
	          }
	        };

	        var chart = new google.charts.Bar(document.getElementById('3MonthsSales'));

	        chart.draw(data, google.charts.Bar.convertOptions(options));
	      }

	 function ThreeYearsSalesChart() {
	        var data = google.visualization.arrayToDataTable([
	          ['연', '매출', '수익', '원가'],
	          ['${year}', ${totalThisYear2}, ${totalThisYear3}, ${totalThisYear1}],
//	          ['${year1}', ${totalAYearAgo2}, ${totalAYearAgo3}, ${totalAYearAgo1}],
//	          ['${year2}', ${totalTwoYearsAgo2}, $totalTwoYearsAgo3}, ${totalTwoYearsAgo1}]
	        ]);

	        var options = {
	          chart: {
	            title: '3년간 매출 정보',
	            subtitle: 'Sales, Expenses, and Costs: for 3 years'
	          }
	        };

	        var chart = new google.charts.Bar(document.getElementById('3YearsSales'));

	        chart.draw(data, google.charts.Bar.convertOptions(options));
	      }
	
	
	
</script>
</html>