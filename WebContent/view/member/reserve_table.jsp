<%@page import="model.User"%>
<%@page import="model.Reservation" %>
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
	        	您暂时没有预订。
	</div>
	<%List<Reservation> reservations = (List<Reservation>)session.getAttribute("reservations");%>
	<script type="text/javascript">
		window.onload = function(){
			var Util = window.util;
	        var Table = Util.table;
	        
	        <%if(reservations == null || reservations.size() == 0){%>
	        	document.getElementById('isAny').style.display = 'inline';
	        <%}else{%>
	        		var reserve_table = Table.new_one('reserve_table',
						 {
						header : ['活动名','场次','时间','预订参加人数']
					 });
	        	<%for(Reservation reservation:reservations){
		        	int act_id = reservation.getAct_id();
		        	int session_id = reservation.getSession_id();
		        	String time = reservation.getTime();
		        	String card_id = reservation.getCard_id();
		        	String act_name = reservation.getAct_name();
		        	int part_count = reservation.getPart_count();%>
		        	
		        	reserve_table.className = 'table table-bordered';
		        	
		        	var res_<%=act_id%> = Table.new_record(['<div style="width:50px"><%=act_name%></div>', 
		       	                                         '<div><%=session_id%></div>',
		       	                                         '<div><%=time%></div>',
		       	                                   		 '<div><%=part_count%></div>'
		       	                                         ]);
		        	res_<%=act_id%>.set({
			            "class" : 'success',    
			        });
		        	
		        	reserve_table.add(res_<%=act_id%>);
	        	<%}%>
	        	document.body.appendChild(reserve_table);
	        <%}%>
		};
		
	</script>
</body>
</html>