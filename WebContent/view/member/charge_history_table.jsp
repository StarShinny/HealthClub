<%@page import="model.User"%>
<%@page import="model.ChargeHistory" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	<div id="isAny" style="display:none">
	        	您暂时没有任何缴费记录。
	</div>
	<%List<ChargeHistory> chargeHistories = (List<ChargeHistory>)session.getAttribute("chargeHistories");%>
	<script type="text/javascript">
		window.onload = function(){
			var Util = window.util;
	        var Table = Util.table;
	        
	        <%if(chargeHistories == null || chargeHistories.size() == 0){%>
	        	document.getElementById('isAny').style.display = 'inline';
	        <%}else{%>
	        		var charge_table = Table.new_one('charge_table',
						 {
						header : ['卡号','缴费时间','银行账户','金额']
					 });
	        	<%for(ChargeHistory chargeHistory:chargeHistories){
		        	String card_id = chargeHistory.getCard_id();
					String charge_time = chargeHistory.getCharge_time();
					double payment = chargeHistory.getPayment();
					String account = chargeHistory.getAccount();%>
		        	
					charge_table.className = 'table table-bordered';
		        	
		        	var charge_<%=charge_time%> = Table.new_record(['<div style="width:50px"><%=card_id%></div>', 
		       	                                         '<div><%=charge_time%></div>',
		       	                                         '<div><%=account%></div>',
		       	                                   		 '<div><%=payment%></div>'
		       	                                         ]);
		        	charge_<%=charge_time%>.set({
			            "class" : 'success',    
			        });
		        	
		        	charge_table.add(charge_<%=charge_time%>);
	        	<%}%>
	        	document.body.appendChild(charge_table);
	        <%}%>
		};
		
	</script>
</body>
</html>