<%@page import="com.spring.web.vo.ChartCountVO"%>
<%@page import="com.spring.web.vo.StResultVO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.spring.web.vo.StBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<link href="top.css" rel="stylesheet" type="text/css">


  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/5.3.0/css/font-awesome.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- google chart-->  
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);
      
      function drawVisualization() {
		const a = parseInt(document.getElementById('d1').value);
		const a2 = parseInt(document.getElementById('d2').value);
		const a3 = parseInt(document.getElementById('d3').value);
		const b = parseInt(document.getElementById('u1').value);
		const b2 = parseInt(document.getElementById('u2').value);
		const b3 = parseInt(document.getElementById('u3').value);
    	  var arr = [['등락률', '▼', '▲'],
          ['10% / -10%', a, b,],
          ['20% / -20%', a2, b2,],
          ['30% / -30%', a3, b3,]
          ];        
        var data = google.visualization.arrayToDataTable(arr);
        
        var options = {
          title : 'Stock price rises and falls',
          vAxis: {title: 'Count'},
          hAxis: {title: 'percent'},
          seriesType: 'bars',
          series: {20: {type: 'line'}}
        };

        var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
    
<!-- google mapkorchart-->
    <script type="text/javascript">
      google.charts.load('current', {'packages':['treemap']});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
    	  
      	let arrSales = [['name', 'sector', 'cap', 'endprice'],
      		['sector', null, 0, 0]]
      	
    	var jsonData = $.ajax({
			type: "POST", //요청 메소드 방식
			url:"getMapSecJson.do",
			dataType:"json", //서버가 요청 URL을 통해서 응답하는 내용의 타입
			async:false
		}).responseJSON;

      	for(i of jsonData){
      		arrSales.push([i['sector'],'sector',0,0])
      	}
		
    	var jsonData2 = $.ajax({
    		type: "POST", //요청 메소드 방식
    		url:"getMapJson.do",
    		dataType:"json", //서버가 요청 URL을 통해서 응답하는 내용의 타입
			async:false
    		}).responseJSON;
    	
      	for(i of jsonData2){
      		arrSales.push([i['name'],i['sector'],i['cap'],i['endprice']])
      	}
    	
    	
					console.log(arrSales)
        var data = google.visualization.arrayToDataTable(arrSales);
        var tree = new google.visualization.TreeMap(document.getElementById('terrmapkorchart_div'));

        var options = { // For v49 or before
          highlightOnMouseOver: true,
          fontColor:'#FFFFF0',
          hintOpacity:0,
          maxDepth: 1,
          maxPostDepth: 2,
          minColorValue : -3,
          maxColorValue : 3,
          noColor: '#FF69B4',
          noHighlightColor:'#FF69B4',
          minHighlightColor: '#FF69B4',
          midHighlightColor: '#FF69B4',
          maxHighlightColor: '#FF69B4',
          minColor: '#0000CD',
          midColor: '#00BFFF',
          maxColor: '#FF0000',
          headerHeight: 25,
          headerColor:'#4B0082',
          showScale: true,
          height: 400,
          titleTextStyle:{ color: '#4B0082',
        	  fontName: 'Roman',
        	  bold: true,
        	  italic: true },
          useWeightedAverageForAggregation: true,
          showTooltips: true,
          generateTooltip: showFullTooltip
        };

        var optionsV50 = { // For v50+
          enableHighlight: true,
          maxDepth: 1,
          maxPostDepth: 2,
          minHighlightColor: '#FF69B4',
          midHighlightColor: '#FF69B4',
          maxHighlightColor: '#FF69B4',
          minColor: '#0000CD',
          midColor: '#00BFFF',
          maxColor: '#FF0000',
          headerHeight: 25,
          headerColor:'#4B0082',
          height: 400,
          useWeightedAverageForAggregation: true,
          // Use click to highlight and double-click to drill down.
          eventsConfig: {
            highlight: ['click'],
            unhighlight: ['mouseout'],
            rollup: ['contextmenu'],
            drilldown: ['dblclick'],
          }
        };

        tree.draw(data, options);
        
        function showFullTooltip(row, size, value) {
            return '<div style="background:#fd9; padding:10px; border-style:solid">' +
                   '<span style="font-family:Courier"><b>' + data.getValue(row, 0) +
                   '</b>, ' + data.getValue(row, 1) + ', ' + data.getValue(row, 2) +
                   ', ' + data.getValue(row, 3) + '</span><br>' +
                   'Datatable row: ' + row + '<br>' +
        	   data.getColumnLabel(2) +
                   ' (total value of this cell and its children): ' + size + '<br>' +
        	   data.getColumnLabel(3) + ': ' + value + ' </div>';
          }

      }
    </script>
<!-- google mapkorchart-->

    <script type="text/javascript">
      google.charts.load('current', {'packages':['treemap']});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
    	  
      	let arrSales = [['name', 'sector', 'cap', 'endprice'],
      		['sector', null, 0, 0]]
      	
    	var jsonData = $.ajax({
			type: "POST", //요청 메소드 방식
			url:"getMapSnpSecJson.do",
			dataType:"json", //서버가 요청 URL을 통해서 응답하는 내용의 타입
			async:false
		}).responseJSON;

      	for(i of jsonData){
      		arrSales.push([i['sector'],'sector',0,0])
      	}
		
    	var jsonData2 = $.ajax({
    		type: "POST", //요청 메소드 방식
    		url:"getMapSnpJson.do",
    		dataType:"json", //서버가 요청 URL을 통해서 응답하는 내용의 타입
			async:false
    		}).responseJSON;
    	
      	for(i of jsonData2){
      		arrSales.push([i['name'],i['sector'],i['cap'],i['endprice']])
      	}
    	
    	
					console.log(arrSales)
        var data = google.visualization.arrayToDataTable(arrSales);
        var tree = new google.visualization.TreeMap(document.getElementById('terrmapsnpchart_div'));

        var options = { // For v49 or before
          highlightOnMouseOver: true,
          fontColor:'#FFFFF0',
          hintOpacity:0,
          maxDepth: 1,
          maxPostDepth: 2,
          minColorValue : -3,
          maxColorValue : 3,
          minHighlightColor: '#FF69B4',
          midHighlightColor: '#FF69B4',
          maxHighlightColor: '#FF69B4',
          minColor: '#0000CD',
          midColor: '#00BFFF',
          maxColor: '#FF0000',
          headerHeight: 25,
          headerColor:'#4B0082',
          showScale: true,
          height: 400,
          titleTextStyle:{ color: '#4B0082',
        	  fontName: 'Roman',
        	  bold: true,
        	  italic: true },
          useWeightedAverageForAggregation: true,
          showTooltips: true,
          generateTooltip: showFullTooltip
        };

        var optionsV50 = { // For v50+
          enableHighlight: true,
          maxDepth: 1,
          maxPostDepth: 2,
          minHighlightColor: '#FF69B4',
          midHighlightColor: '#FF69B4',
          maxHighlightColor: '#FF69B4',
          minColor: '#0000CD',
          midColor: '#00BFFF',
          maxColor: '#FF0000',
          headerHeight: 25,
          headerColor:'#4B0082',
          height: 400,
          useWeightedAverageForAggregation: true,
          // Use click to highlight and double-click to drill down.
          eventsConfig: {
            highlight: ['click'],
            unhighlight: ['mouseout'],
            rollup: ['contextmenu'],
            drilldown: ['dblclick'],
          }
        };

        tree.draw(data, options);
        
        function showFullTooltip(row, size, value) {
            return '<div style="background:#fd9; padding:10px; border-style:solid">' +
                   '<span style="font-family:Courier"><b>' + data.getValue(row, 0) +
                   '</b>, ' + data.getValue(row, 1) + ', ' + data.getValue(row, 2) +
                   ', ' + data.getValue(row, 3) + '</span><br>' +
                   'Datatable row: ' + row + '<br>' +
        	   data.getColumnLabel(2) +
                   ' (total value of this cell and its children): ' + size + '<br>' +
        	   data.getColumnLabel(3) + ': ' + value + ' </div>';
          }

      }
    </script>
    </script>

<!-- google mapchart-->    
    
    
<!-- move up -->     
<script>    
    $(function(){
  $('#back-to-top').on('click',function(e){
      e.preventDefault();
      $('html,body').animate({scrollTop:0},600);
  });
  
  $(window).scroll(function() {
    if ($(document).scrollTop() > 100) {
      $('#back-to-top').addClass('show');
    } else {
      $('#back-to-top').removeClass('show');
    }
  });
});
</script>

  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 550px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #f1f1f1;
      height: 100%;
    }
        
    /* On small screens, set height to 'auto' for the grid */
    @media screen and (max-width: 767px) {
      .row.content {height: auto;} 
    }
    .tdup{
    background-color:"#ff0000" !important;
    }
    .tddown{
    background-color:"#0000ff" !important;
    }
  </style>
</head>
<body id="page-top">
  <%
List<StBoardVO> StBoardList = (List)request.getAttribute("StBoardList");
List<StResultVO> StResultDayList = (List)request.getAttribute("StResultDayList");
List<StResultVO> StResultSelectList = (List)request.getAttribute("StResultSelectDayList");
List<StResultVO> StResultList = (List)request.getAttribute("StResultList");
ChartCountVO chartCount = (ChartCountVO)request.getAttribute("chartCount");
%>
<input type="hidden" id="d1" value="<%=chartCount.getDownone()%>">
<input type="hidden" id="d2" value="<%=chartCount.getDowntwo()%>">
<input type="hidden" id="d3" value="<%=chartCount.getDownthree()%>">
<input type="hidden" id="u1" value="<%=chartCount.getUpone()%>">
<input type="hidden" id="u2" value="<%=chartCount.getUptwo()%>">
<input type="hidden" id="u3" value="<%=chartCount.getUpthree()%>">
	<!-- Navigation-->
	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<a id="back-to-top"></a>
		<div class="container">
			<a class="navbar-brand" href="#page-top">META STOCK <i class="fas fa-poll"></i></a>
			<button
				class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				Menu
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="logout.do">M.S logout</a></li>
				</ul>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1"><span
						class="nav-link py-3 px-0 px-lg-3 rounded"><%=session.getAttribute("userName") %>님 환영합니다</span></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="logout.do">M.S
							logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

    <div class="col-sm-12">
        <div class="col-sm-8">
 			<img src="assets/img/portfolio/msnoter.png">
        </div>
                <div class="col-sm-4">
          <a href="getDisBoardList.do">
 			<img src="assets/img/portfolio/msdisc.png">
          </div>
          </a>
        </div>
      <div class="row">
        <div class="col-sm-8">
          <h2>Today Stock <i class="fas fa-chart-line"></i></h2>
<%--Past Result와 간격을 맞추기 위한 작업--%>                    
<span style = "line-height:250%"><br></span>  
  
  <table class="table table-striped">
    <thead>
      <tr>
        <th><i class="far fa-clone"></i> Symbol</th>
        <th><i class="far fa-edit"></i> Name</th>
        <th><i class="fab fa-usb"></i> Industry</th>
        <th><i class="fas fa-recycle"></i> StartPrice</th>
        <th><i class="fas fa-cogs"></i> TechnicInd</th>
        <th><i class="far fa-thumbs-up"></i> CorpPositive</th>
        <th><i class="fab fa-edge-legacy"></i> NaverStock</th>
      </tr>
    </thead>
<%for(StBoardVO board : StBoardList){%>
	<%
	String day = board.getDate();
	DecimalFormat decFormat = new DecimalFormat("###,###");
	%>
	<%if (day.equals("2022-01-17")){%>		
    <tbody>
      <tr style="cursor:pointer;color:#blue;" onClick="window.open('https://m.stock.naver.com/domestic/stock/<%=board.getSymbol() %>/total','','')">
        <td><mark><%=board.getSymbol() %></mark></td>
        <td><%=board.getName() %></td>
        <td><%=board.getIndustry() %></td>
        <td align="right"><%=decFormat.format(board.getSprice()) %></td>
        <td><code><span class="glyphicon glyphicon-random"></code> 이평선(아래부터)<%=board.getTechind() %></span></td>
        <td><%=board.getCorppos() %> [Sometrend수치]</td>
        <td><a href="#" class="btn btn-info btn-sm">
          <span class="glyphicon glyphicon-stats"></span> Naver </a>
        </td>
      </tr>
    </tbody>
    <%} %>
<%} %>

  </table>
        </div>
        <div class="col-sm-4">
          <h2>Past Results <i class="fas fa-chart-pie"></i></h2>
  
		  <div class="container">
		  <div class="dropdown">
		    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Daily Result</button>
		    <ul class="dropdown-menu">
		    <%for(StResultVO daylist : StResultDayList){ %>
		      <li><a href="getStBoardList.do?date=<%=daylist.getDate()%>"><%=daylist.getDate() %></a></li>
		    <%} %>
		    </ul>
		    
		  </div>
		</div>
 
  <table class="table table-striped">
    <thead>
      <tr>
        <th><i class="far fa-edit"></i> Name</th>
        <th><i class="fas fa-recycle"></i> StartPrice</th>
        <th><i class="fas fa-upload"></i> EndPrice</th>
        <th><i class="fas fa-angle-double-up"></i><i class="fas fa-angle-double-down"></i> Up&Down</th>
        <th><i class="fab fa-edge-legacy"></i> NaverStock</th>
      </tr>
    </thead>
<%if(StResultList != null){ %>
	<%for(StResultVO result : StResultList){
		DecimalFormat decFormat = new DecimalFormat("###,###");
		%>
	
	    <tbody>
	      <tr style="cursor:pointer;color:#blue;" onClick="window.open('https://m.stock.naver.com/domestic/stock/<%=result.getSymbol() %>/total','','')">
	        <td><mark><%=result.getName() %></mark></td>
	        <td align="right"><%=decFormat.format(result.getStartprice()) %></td>
	        <td align="right"><%=decFormat.format(result.getEndprice()) %></td>
	        
	        <%if(result.getFluctuate().equals("▲")){ %>
	        <td style="background-color:#FF0000"><center><font size="4"><i class="fas fa-chevron-circle-up"></i></font></center></td>
	        <%}else if(result.getFluctuate().equals("▼")){ %>
	        <td style="background-color:#09F8DB"><center><font size="4"><i class="fas fa-chevron-circle-down"></i></font></center></td>
			<%}else{ %>	        
	        <td><%=result.getFluctuate() %></td>
			<%} %>
	        
	        <td><a href="#" class="btn btn-info btn-sm">
	          <span class="glyphicon glyphicon-stats"></span> Naver </a>
	        </td>
	      </tr>
	      
	    </tbody>
	<%} %>
<%}else if(StResultSelectList !=null){ %>
	<%for(StResultVO resultDay : StResultSelectList){
		DecimalFormat decFormat = new DecimalFormat("###,###");
		%>
	
	    <tbody>
	      <tr style="cursor:pointer;color:#blue;" onClick="window.open('https://m.stock.naver.com/domestic/stock/<%=resultDay.getSymbol() %>/total','','')">
	        <td><mark><%=resultDay.getName() %></mark></td>
	        <td align="right"><%=decFormat.format(resultDay.getStartprice()) %></td>
	        <td align="right"><%=decFormat.format(resultDay.getEndprice()) %></td>
	        
	        <%if(resultDay.getFluctuate().equals("▲")){ %>
	        <td style="background-color:#FF0000"><center><font size="4"><i class="fas fa-chevron-circle-up"></i></font></center></td>
	        <%}else if(resultDay.getFluctuate().equals("▼")){ %>
	        <td style="background-color:#09F8DB"><center><font size="4"><i class="fas fa-chevron-circle-down"></i></font></center></td>
			<%}else{ %>	        
	        <td><%=resultDay.getFluctuate() %></td>
			<%} %>	    
			    
	        <td><a href="#" class="btn btn-info btn-sm">
	          <span class="glyphicon glyphicon-stats"></span> Naver </a>
	        </td>
	      </tr>
	      
	    </tbody>
	    <%} %>
	    <%} %>
  </table>
</div>

      </div>
      <h2>Lstm Graph <i class="fas fa-chart-bar"></i></h2>
      <div class="row">
        <div class="col-sm-4">
          <div class="well">
  <table class="table table-bordered">
  
  <%for(int i=0; i<5; i++){ 
  StBoardVO stResult = StBoardList.get(i);
  %>
  
    <thead>
      <tr>
        <th>Firstname</th>
        <th><%=stResult.getName() %></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>JohnLstm Graph</td>
        <td><img src="images/<%=stResult.getSymbol() %>.png" width="100%"></td>
      </tr>
      <tr>
        <td>Trend</td>
        <td><%=stResult.getCnt() %></td>
      </tr>
    </tbody>
    <%} %>
  </table>
  
          </div>
        </div>
        <div class="col-sm-4">
          <div class="well">
  <table class="table table-bordered">
  
  <%for(int i=5; i<10; i++){ 
  StBoardVO stResult = StBoardList.get(i);
  %>
    <thead>
      <tr>
        <th>Firstname</th>
        <th><%=stResult.getName() %></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Lstm Graph</td>
        <td><img src="images/<%=stResult.getSymbol() %>.png"width="100%"></td>
      </tr>
      <tr>
        <td>Trend</td>
        <td><%=stResult.getCnt() %></td>
      </tr>
    </tbody>
    <%} %>
    
    
  </table>
          </div>
        </div>
        <div class="col-sm-4">
          <div class="well">
        <h2>Weekly stock status <i class="fas fa-cloud-upload-alt"></i></h2>
            <div id="chart_div"></div> 
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-6">
        <h2>KOSDAQ MAP(Market capitalization)</h2>
          <div class="well" id="terrmapkorchart_div" style="width: 930px; height: 450px;">
          </div>
        </div>
      
        <div class="col-sm-6">
        <h2>SNP500 MAP(Market capitalization)</h2>
          <div class="well" id="terrmapsnpchart_div" style="width: 930px; height: 450px;">
          </div>
        </div>
      </div>
    </div>
</body>
</html>