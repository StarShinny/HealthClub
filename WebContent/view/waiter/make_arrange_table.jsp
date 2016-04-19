<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.Activity"%>
<%@page import="model.ActSession"%>
<html>
<head>
<meta charset="UTF-8">
<title>健康俱乐部</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="../css/editor.css" rel="stylesheet" />
    <link rel="stylesheet" href="../css/jquery.fileupload.css">
    <link rel="stylesheet" href="../css/jquery.fileupload-ui.css">
</head>
<body>

<form action="/HealthClub/view/addActivity.action" method="post">
	<table class="table">
		<thead>
			<tr>
				<th>填写新活动信息</th>
			</tr>
		</thead>
		<tbody>
			<tr class="success">
				<td style="width: 30%;height:30px;">活动名：</td>
				<td style="width: 70%;height:30px;"><input type="text" class="form-control"
					placeholder="请输入活动名" value="" name="activity.act_name" /></td>
			</tr>
			<tr class="error">
				<td>活动简介：</td>
				<td><input type="text" class="form-control"
					placeholder="请输入活动简介" value="" name="activity.act_desc" style="height:30px;"/></td>
			</tr>
			<tr class="warning">
				<td>场次数目：</td>
				<td><input type="number" class="form-control" value="1" min="1"
					step="1" name="activity.session_count" style="height:30px;">场</td>
			</tr>
		
			<tr class="info">
				<td>地点制定：</td>
				<td><input type="text" class="form-control" placeholder="请输入地点" value="" name="actSession.site" style="height:30px;"/>
				</td>
			</tr>
			<tr class="success">
				<td>教练制定：</td>
				<td><input type="text" class="form-control"
					placeholder="请输入教练名" value="" name="actSession.coach_name" style="height:30px;"/></td>
			</tr>
			<tr class="error">
				<td>日期制定：</td>
				<td><input type="date" value="" name="date" style="height:30px;"></td>
			</tr>
			<tr>
				<td>场次选择：</td>
				<td><input type="checkbox" name="session1" value="-08:00-10:00">早一场:08:00-10:00
					<input type="checkbox" name="session2" value="-09:00-11:00">早二场:09:00-11:00
					<br> <input type="checkbox" name="session3" value="-14:00-16:00">午一场:14:00-16:00
					<input type="checkbox" name="session4" value="-15:00-17:00">午二场:15:00-17:00
					<br> <input type="checkbox" name="session5" value="-19:00-21:00">晚一场:19:00-21:00
					<input type="checkbox" name="session6" value="-20:00-22:00">晚一场:20:00-22:00
				</td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" class="btn btn-lg btn-primary" value="保存"/></td>
			</tr>
		</tbody>
	</table>
</form>
</body>
</html>