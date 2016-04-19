<%@page import="model.User"%>
<%@page import="model.Card"%>
<%@page import="model.Activity"%>
<%@page import="model.ActSession"%>
<%@page import="model.Reservation"%>
<%@page import="java.util.List" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<%List<ActSession> actSessions = (List<ActSession>)session.getAttribute("actSessions");%>
	<%Activity activity = (Activity)session.getAttribute("activity");%>
	<%Card card = (Card)session.getAttribute("card");%>
	<script type="text/javascript">
		window.onload = function(){
			var Util = window.util;
	        var Table = Util.table;
			
	        //创建场次表
	        var session_table = Table.new_one('session_table', 
	        		{
	        			header:['场次', '时间','地点','教练','<div style="margin-left:10%">'+'预订'+'</div>']
	        		});
	        <%
	        	for(ActSession actSession:actSessions){
	        		int session_id = actSession.getSession_id();
	        		String site = actSession.getSite();
	        		String coach_name = actSession.getCoach_name();
	        		String time = actSession.getTime();
	        %>	        
	        session_table.className = 'table table-bordered';

	        var session_<%=session_id%> = Table.new_record(['<%=session_id%>',
	                                         '<%=time%>',
	                                         '<%=site%>',
	                                         '<%=coach_name%>',
	                                         '<div style="margin-left:10%">'+
	                                         '<td><input id="session_<%=session_id%>" type="button" value="预订" class="btn btn-lg" style="height: 35px;" onclick="reserve(\'<%=session_id%>\',\'<%=time%>\')"></td>'+
	                                         '</div>'
	                                         ]);
	        session_<%=session_id%>.set({
	        	"class":'error'
	        });
	        session_table.add(session_<%=session_id%>);
	        <%}%>
	        document.body.appendChild(session_table);

		};
		
		function reserve(session_id,time){
			var data = {};
	        var field_names = [ "reservation.session_id", 
	                            "reservation.time",
	                            "reservation.act_id",
	                            "reservation.card_id",
	                            "reservation.act_name",
	                            "reservation.part_count"
										];
	        data[field_names[0]] =  session_id;
	        data[field_names[1]] =  time;
	        data[field_names[2]] =  '<%=activity.getAct_id()%>';
	        data[field_names[3]] =  '<%=card.getCard_id()%>';
	        data[field_names[4]] =  "<%=activity.getAct_name()%>";
	        data[field_names[5]] =  "1";
	                                	
			console.log(data);
			// for ajax method
			$.post("/HealthClub/view/reserveActivity.action", data, function(result){});
			alert("添加成功");
			return true;
	    };
		
	</script>
</body>
</html>