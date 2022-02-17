<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "adminheader.jsp" %>
<body>
	<div style="margin-top:100px; margin-left:300px;">
		
		<p>${count1}</p>
		<p>${count2}</p>
		<p>${count3}</p>
		<p>${count4}</p>
		<p>${monthly10}</p>
		<p>${weekily}</p>
		<p>${qnaList}</p>
		<p>${reviewList}</p>
		<div id="Weekly_Sales"></div>
		<div id="Monthly_Top10"></div>
	</div>
</body>
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
	    ['${monthly10[0].pname}', ${monthly10[0].sales_count}],
	    ['${monthly10[1].pname}', ${monthly10[1].sales_count}],
	    ['${monthly10[2].pname}', ${monthly10[2].sales_count}],
	    ['${monthly10[3].pname}', ${monthly10[3].sales_count}],
	    ['${monthly10[4].pname}', ${monthly10[4].sales_count}],
	    ['${monthly10[5].pname}', ${monthly10[5].sales_count}],
	    ['${monthly10[6].pname}', ${monthly10[6].sales_count}],
	    ['${monthly10[7].pname}', ${monthly10[7].sales_count}],
	    ['${monthly10[8].pname}', ${monthly10[8].sales_count}],
	    ['${monthly10[9].pname}', ${monthly10[9].sales_count}]
	  ]);
	
	  // Set chart options
	  var options = {'title':'월간 판매 순위 Top10',
	                 'width':400,
	                 'height':300};
	
	  // Instantiate and draw our chart, passing in some options.
	  var chart = new google.visualization.PieChart(document.getElementById('Monthly_Top10'));
	  chart.draw(data, options);
}
	//주간 매출 정보
   function drawWeeklyChart() {
	      var data = google.visualization.arrayToDataTable([
	        ["Element", "원: ", { role: "style" } ],
	        ["매출액", ${totalPrice2}, "red"],
	        ["수익",  ${totalPrice3}, "gold"],
	        ["원가", ${totalPrice1}, "green"]
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
