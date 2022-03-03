<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "adminheader.jsp" %>
<body>
	<div style="margin-top:100px; margin-left:300px; margin-bottom:100px;">
	<h3 style="font-weight: bold;"><a href="/adm/statistics.do">통계 분석</a></h3>
		<div class="jw-charts-2wrap">
		<!-- 전체기간  판매량 top10 -->
		<div id="AllSales"></div>
		<!-- 오늘 판매량 top5 -->
		<div id="TodaysBest" style="margin-top:30px; width: 500px;">
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
							<td>샐러드</td>
							<td>비엔나 샐러드</td>
							<td>35</td>
						</tr>
						<tr>
							<td>2</td>
							<td>샐러드</td>
							<td>볼샐러드 깻잎가득</td>
							<td>30</td>
						</tr>
						<tr>
							<td>3</td>
							<td>닭가슴살</td>
							<td>스팀 닭가슴살 마늘맛</td>
							<td>23</td>
						</tr>
						<tr>
							<td>4</td>
							<td>닭가슴살</td>
							<td>햇살닭</td>
							<td>20</td>
						</tr>
						<tr>
							<td>5</td>
							<td>저칼로리간식</td>
							<td>한끼곤약</td>
							<td>10</td>
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
		    ['${AllSales[0].pname}', 2345],
		    ['${AllSales[1].pname}', 2210],
		    ['${AllSales[2].pname}', 2100],
		    ['${AllSales[3].pname}', 1780],
		    ['${AllSales[4].pname}', 1200]
//		    ['${AllSales[5].pname}', ${AllSales[5].sales_count}],
//		    ['${AllSales[6].pname}', ${AllSales[6].sales_count}],
//		    ['${AllSales[7].pname}', ${AllSales[7].sales_count}],
//		    ['${AllSales[8].pname}', ${AllSales[8].sales_count}],
//		    ['${AllSales[9].pname}', ${AllSales[9].sales_count}]
		 
		  ]);
		
		  // Set chart options
		  var options = {'title':'전체기간 판매 순위 Top5',
				   		'fontSize': 17,
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
	          ['${towDaysago}', 341765, 102529, 239236],
	          ['${yesterday}', 369026, 110707, 258318],
	          ['${toDay}', 257428, 77228.4, 180199.6]
	        ]);

	        var options = {
	          chart: {
	            title: '3일간 매출 정보',
	            subtitle: 'Sales, Expenses, and Costs: for 3 days',
	            legend: { position: "none" }
	          }
	        };

	        var chart = new google.charts.Bar(document.getElementById('3DaysSales'));

	        chart.draw(data, google.charts.Bar.convertOptions(options));
	      }
	 
	 function ThreeMonthsSalesChart() {
	        var data = google.visualization.arrayToDataTable([
	          ['월', '매출', '수익', '원가'],
	          ['${month2}', 10252972, 3075891, 7177080],
	          ['${month1}', 11070792, 3321237, 7749554],
	          ['${month}', 16612530, 4983759, 11628771]
	        ]);

	        var options = {
	          chart: {
	            title: '3개월간 매출 정보',
	            subtitle: 'Sales, Expenses, and Costs: for 3 months',
	            legend: { position: "none" }
	          }
	        };

	        var chart = new google.charts.Bar(document.getElementById('3MonthsSales'));

	        chart.draw(data, google.charts.Bar.convertOptions(options));
	      }

	 function ThreeYearsSalesChart() {
	        var data = google.visualization.arrayToDataTable([
	          ['연', '매출', '수익', '원가'],
	          ['${year2}', 123035670, 36910701, 86124969],
	          ['${year1}', 132849504, 39854851, 92994652],
	          ['${year}', 49837590, 14951277, 34886313]
	        ]);

	        var options = {
	          chart: {
	            title: '3년간 매출 정보',
	            subtitle: 'Sales, Expenses, and Costs: for 3 years',
	            legend: { position: "none" }
	          }
	        };

	        var chart = new google.charts.Bar(document.getElementById('3YearsSales'));

	        chart.draw(data, google.charts.Bar.convertOptions(options));
	      }
	
	
	
	
</script>
</html>