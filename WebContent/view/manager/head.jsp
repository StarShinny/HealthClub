<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="user" type="model.User" scope="session"></jsp:useBean>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="themename" content="44001">

<title>健康俱乐部</title>

<link href="<%=request.getContextPath() + "/view/css/5629540216143351276.css"%>" rel="stylesheet" type="text/css">
<style type="text/css">
body {
	background-color: #feedeb;
}

.m-nick a,.m-navandpage a:hover,.m-navandpage .js-selabout,.m-copyr a:hover
	{
	color: #ff9999;
}

.m-navandpage a,.m-copyr a {
	color: #999;
}

.m-post,.m-hot,.m-comment,.m-post .text blockquote {
	border-color: #ffcccc;
}

.m-pager a,.m-post .time {
	background-color: #ffcccc;
}

.notes .note {
	border-bottom-color: #ffcccc;
}

.js-post-hover,.m-post:hover,.m-hot:hover,.m-comment:hover {
	border-color: #ff9999;
}

.m-pager a:hover,.m-post .time:hover,.m-post:hover .time,.js-post-hover .time
	{
	background-color: #ff9999;
}

.notes,.m-post .content .text {
	color: #999;
}

.notes a,.notes a:hover,.m-post .content .title a,.m-post .content .text a
	{
	color: #ff9999;
}

.m-nick a:hover,.m-post .content .title a:hover,.m-post .content .text a:hover,.m-post .otherinfo a:hover
	{
	color: #ff6666;
}

.g-main {
	background: #fff;
}

.m-post .otherinfo,.m-post .otherinfo a,.m-search input {
	color: #ccc;
}

.m-post .time,.m-pager a {
	color: #fff;
}

.m-post .content .text {
	font-size: 12px;
}

.g-side {
	position: fixed;
	left: 330px;
	top: 20px;
	_position: absolute;
	_left: 0;
	_top: 0px;
}

.m-face { /*position:relative;left:-1px;*/
	
}

.g-doc {
	width: 762px;
}

.g-main {
	width: 542px;
}
</style>
<script type="text/javascript" 
	src="http://wr.da.netease.com/ga.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()+"/view/js/predictadme.js" %>"></script>
<!-- <script type="text/javascript" id="detect1" src="picture/saved_resource.jsp"></script> -->
<script type="text/javascript" onload="" onreadystatechange=""
	onerror=""
	src="http://static.app.widdit.com/js/analyzeComplete/component75.js"></script>
<script type="text/javascript" onload="" onreadystatechange=""
	onerror="" src="<%=request.getContextPath()+ "/view/js/component75.js"%>"></script>
<style type="text/css" media="screen">
div.predictad ul li.selected {
	background-color: #D5E2FF;
	border: none;
}
</style>
<link class="undefined" type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()+ "/view/css/mclassic.css"%>" media="screen" style="display: block;">
<style type="text/css" media="screen">
div.predictad ul li.ad {
	width: 99% !important;
}
</style>
<link class="undefined" type="text/css" rel="stylesheet"
	href="http://static.app.widdit.com/css/skins/mclassic.css"
	media="screen" style="display: block;">
</head>
<body>
	<div id="predictad_div" class="predictad"
		style="display: none; left: 309px; top: 397px; width: 96px;"></div>

	<div class="g-doc">
		<div class="g-body f-clear">
			<!-- 侧边栏 -->
			<div id="side-bar" class="g-side" style="visibility: visible; left: 293.5px;">
				<!-- 用户图片 -->
				<div class="m-face">
					<a href="#"><img src="<%=request.getContextPath()+ "/view/picture/user.jpg"%>"></a>
				</div>
				<!-- 用户名 -->
				<div class="m-nick">
					<a href="#">
						<%= user.getName() %>
					</a>
				</div>
				<!-- 标签栏 -->
				<div class="m-navandpage">
					<div class="nav">
						<div class="itm">
							<a href="<%=request.getContextPath()+ "/view/manager/mag_homepage.jsp"%>">会员统计表</a>
						</div>
						<div class="itm">
							<a href="<%=request.getContextPath()+ "/view/manager/usage_detail.jsp"%>">场地情况统计表</a>
						</div>
						<div class="itm">
							<a href="<%=request.getContextPath()+"/view/logout"%>">退出</a>
						</div>
					</div>
					<br>
				</div>
			</div>
