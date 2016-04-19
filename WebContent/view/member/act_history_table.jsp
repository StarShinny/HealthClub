<%@page import="model.User"%>
<%@page import="model.Participation" %>
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
	        	您暂时没有参加任何活动。
	</div>
	<%List<Participation> participations = (List<Participation>)session.getAttribute("participations");%>
	<script type="text/javascript">
		window.onload = function(){
			var Util = window.util;
	        var Table = Util.table;
	        
	        <%if(participations == null || participations.size() == 0){%>
	        	document.getElementById('isAny').style.display = 'inline';
	        <%}else{%>
	        		var part_table = Table.new_one('part_table',
						 {
						header : ['活动名','场次','时间','参加的人数']
					 });
	        	<%for(Participation participation:participations){
		        	int act_id = participation.getAct_id();
					int session_id = participation.getSession_id();
					String time = participation.getTime();
					String card_id = participation.getCard_id();
					String act_name = participation.getCard_id();
					int part_count = participation.getPart_count();%>
		        	
					part_table.className = 'table table-bordered';
		        	
		        	var part_<%=act_id%> = Table.new_record(['<div style="width:50px"><%=act_name%></div>', 
		       	                                         '<div><%=session_id%></div>',
		       	                                         '<div><%=time%></div>',
		       	                                   		 '<div><%=part_count%></div>'
		       	                                         ]);
		        	part_<%=act_id%>.set({
			            "class" : 'success',    
			        });
		        	
		        	part_table.add(part_<%=act_id%>);
	        	<%}%>
	        	document.body.appendChild(part_table);
	        <%}%>
		};
		
	</script>
</body>
</html>