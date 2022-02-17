<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "adminheader.jsp" %>
<body>
	<div style="margin-top:100px; margin-left:300px;">
		<!-- 전체기간  판매량 top10 -->
		<div id="AllSales"></div>
		<!-- 오늘 판매량 top5 -->
		<div id="TodaysBest"></div>
		<!-- 3일간 매출, 수익, 원가 정보 -->
		<div id="3DaysSales"></div>
		<!-- 3개월간 매출, 수익, 원가 정보 -->
		<div id="3MonthsSales"></div>
		<!-- 3년간 매출, 수익, 원가 정보 -->
		<div id="3YearsSales"></div>
	</div>
</body>
<script>
	google.charts.load('current', {'packages':['corechart']});
	google.charts.load('current', {'packages':['bar']});
	
	//전체기간 판매량 top10
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
		                 'width':400,
		                 'height':300};
		
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