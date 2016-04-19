<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.UserGenderStatic" %>
<%@page import="model.UserPeriodStatic" %>
<%@page import="model.CardStateStatic" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript">
$(
	function() {
		$('#container1')
				.highcharts(
						{
							chart : {
								plotBackgroundColor : null,
								plotBorderWidth : null,
								plotShadow : false
							},
							title : {
								text : '健康俱乐部各年龄段分布图'
							},
							subtitle : {
								text : '健康俱乐部-2014年'
							},
							tooltip : {
								pointFormat : '{series.name}: <b>{point.percentage}%</b>',
								percentageDecimals : 1
							},
							plotOptions : {
								pie : {
									allowPointSelect : true,
									cursor : 'pointer',
									dataLabels : {
										enabled : true,
										color : '#000000',
										connectorColor : '#000000',
										formatter : function() {
											return '<b>' + this.point.name
													+ '</b>: '
													+ this.percentage + ' %';
										}
									}
								}
							},
							series : [ {
								type : 'pie',
								name : '比重：',
								data : [ {
									name : '18-25岁',
									y : 20,
									sliced : true,
									selected : true
								}, {
									name : '26-40岁',
									y : 40,
									sliced : true,
									selected : true
								}, {
									name : '41-59岁',
									y : 30,
									sliced : true,
									selected : true
								}, {
									name : '>60岁',
									y : 10,
									sliced : true,
									selected : true
								}, ]
							} ]
						});
	});
$(
		function() {
			$('#container2')
					.highcharts(
							{
								chart : {
									plotBackgroundColor : null,
									plotBorderWidth : null,
									plotShadow : false
								},
								title : {
									text : '健康俱乐部会员性别分布图'
								},
								subtitle : {
									text : '健康俱乐部-2014年'
								},
								tooltip : {
									pointFormat : '{series.name}: <b>{point.percentage}%</b>',
									percentageDecimals : 1
								},
								plotOptions : {
									pie : {
										allowPointSelect : true,
										cursor : 'pointer',
										dataLabels : {
											enabled : true,
											color : '#000000',
											connectorColor : '#000000',
											formatter : function() {
												return '<b>' + this.point.name
														+ '</b>: '
														+ this.percentage + ' %';
											}
										}
									}
								},
								series : [ {
									type : 'pie',
									name : '比重：',
									data : [ 
									    ['男',60],
									    ['女',40]
									]
								} ]
							});
		});
$(
		function() {
			$('#container3')
					.highcharts(
							{
								chart : {
									plotBackgroundColor : null,
									plotBorderWidth : null,
									plotShadow : false
								},
								title : {
									text : '当前卡状态分布图'
								},
								subtitle : {
									text : '健康俱乐部-2014年'
								},
								tooltip : {
									pointFormat : '{series.name}: <b>{point.percentage}%</b>',
									percentageDecimals : 1
								},
								plotOptions : {
									pie : {
										allowPointSelect : true,
										cursor : 'pointer',
										dataLabels : {
											enabled : true,
											color : '#000000',
											connectorColor : '#000000',
											formatter : function() {
												return '<b>' + this.point.name
														+ '</b>: '
														+ this.percentage + ' %';
											}
										}
									}
								},
								series : [ {
									type : 'pie',
									name : '比重：',
									data : [ {
										name : '有效',
										y : 80,
										sliced : true,
										selected : true
									}, {
										name : '停止',
										y : 9,
										sliced : true,
										selected : true
									}, {
										name : '暂停',
										y : 10,
										sliced : true,
										selected : true
									}, {
										name : '取消',
										y : 1,
										sliced : true,
										selected : true
									}, ]
								} ]
							});
		});
</script>
</head>

<body>
	<script src="../js/highcharts.js"></script>
	<script src="../js/modules/exporting.js"></script>
	<p>  
		<%ArrayList<UserPeriodStatic> statics = (ArrayList<UserPeriodStatic>) session
				.getAttribute("period_static");
		%>
		<center>
	    	<font size="+3">
	                 会员年龄段分布
	         </font>
	    </center>
	</p>
	
	<div id="container1" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
	
	<p>  
		<center>
	    	<font size="+3">
	                 会员性别分布
	         </font>
	    </center>
	</p>
	
	<div id="container2" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
	
	<p>  
		<center>
	    	<font size="+3">
	                 会员卡状态分布
	         </font>
	    </center>
	</p>
	
	<div id="container3" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
</body>
</html>
		