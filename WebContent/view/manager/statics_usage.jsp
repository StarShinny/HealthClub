<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.UsageStatic" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript">
$(function () {
    $('#container1').highcharts({
        chart: {
            type: 'line',
            marginRight: 130,
            marginBottom: 25
        },
        title: {
            text: '场地使用情况折线图',
            x: -20 //center
        },
    subtitle: {
            text: '健康俱乐部-2014年',
	x: -20
        },
        xAxis: {
            categories: ['阳光房','乒乓球室','羽毛球室','游泳池']
        },
        yAxis: {
            title: {
                text: '所占百分比（%）'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: '%'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'top',
            x: -10,
            y: 50,
            borderWidth: 0
        },
        series: [{
            name: '百分比',
            data: [20,40,20,20]
        }]
    });
});


</script>
</head>

<body>
	<script src="../js/highcharts.js"></script>
	<script src="../js/modules/exporting.js"></script>
	<p>  
		<center>
	    	<font size="+3">
	                 场地使用情况折线图
	         </font>
	    </center>
	</p>
	
	<div id="container1" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
</body>
</html>