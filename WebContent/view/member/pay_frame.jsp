<%@page import="model.User"%>
<%@page import="model.ChargeHistory"%>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="card" type="model.Card" scope="session"></jsp:useBean>
<jsp:useBean id="user" type="model.User" scope="session"></jsp:useBean>
<html>
<head>
<meta charset="UTF-8">
<title>健康俱乐部</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="../css/editor.css" rel="stylesheet" />
    <script src="http://code.jquery.com/jquery.js" type="text/javascript"></script>
    <script src="../js/tool.js" type="text/javascript"></script>
</head>
<body>
	<table class="table">
		<tr>
			<td>卡号：</td>
			<td><%=card.getCard_id() %></td>
		</tr>
		<tr>
			<td>当前状态：</td>
			<td>
				<%if(card.getCard_state() == 1){ %>
					未激活
				<%}else if(card.getCard_state() == 2){ %>
					暂停
				<%}else if(card.getCard_state() == 3){ %>
					停止
				<%}else{ %>
					已激活
				<%} %>
			</td>
		</tr>
		<tr>
			<td>本月收费金额：</td>
			<td>
				<%
					if(user.getCard_type() == 1){
				%>
					40
				<%}else{ %>
					100
				<%} %>
			</td>
		</tr>
	</table>
	<div class="container-fluid">
		<div class="row-fluid" style="align:center">
			<div class="span12">
				<%if(card.getCard_state() == 1){ %>
					<form action="/HealthClub/view/cardActive.action" method="post">
						<div>请输入银行卡号:</div>
						<div><input type="text" name="account" value="" class="form-control" style="height:40px"></div>
						<input type="hidden" name="card.card_id" value="<%=card.getCard_id()%>"/>
						<input type="hidden" name="card.active_charge" value="<%=card.getActive_charge()%>"/>
						<input type="submit" class="btn btn-lg btn-primary" style="height: 25px"  value="激活">
					</form>
				<%}else{%>
					<form action="/HealthClub/view/pay.action" method="post">
						<div>请输入银行卡号:</div>
						<div><input type="text" name="chargeHistory.account" value="" class="form-control" style="height:40px"></div>
						<div>请输入转入金额:</div>
						<div><input type="text" name="chargeHistory.payment" value="" class="form-control" style="height:40px"></div>
					
						<input type="hidden" name="chargeHistory.card_id" value="<%=card.getCard_id()%>"/>
						<input class="btn btn-lg btn-primary" style="height: 25px" type="submit" value="支付">
					</form>
					<form action="/HealthClub/view/cardCancel.action" method="post">
						<input type="hidden" name="card.card_id" value="<%=card.getCard_id()%>"/>
						<input class="btn btn-lg" style="height: 30px" type="button" onclick="cancelCard()" value="取消卡">
					</form>
				<%} %>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
        function activeCard(){
        	alert("激活成功");
        };
        function pay(){
        	alert("付费成功");
        };
        function cancelCard(){
        	alert("取消卡成功");
        }
    </script>
</body>
</html>