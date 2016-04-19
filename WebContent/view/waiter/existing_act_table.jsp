<%@page import="model.User"%>
<%@page import="model.Activity"%>
<%@page import="model.ActSession"%>
<%@page import="java.util.List" %>
<%@page import="java.util.Hashtable" %>
<%@page import="java.util.Iterator" %>
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
	<%Hashtable<Activity, List<ActSession>> actHash = (Hashtable<Activity, List<ActSession>>)session.getAttribute("activities"); %>
	<script type="text/javascript">
		window.onload = function(){
			var Util = window.util;
	        var Table = Util.table;
	        <%=actHash.values().size() %>
	        <%for(Iterator<Activity> itr=actHash.keySet().iterator();itr.hasNext();){
	        	Activity activity = itr.next();
	        	int act_id = activity.getAct_id();
	        	String act_name = activity.getAct_name();
	        	String act_desc = activity.getAct_desc();
	        	int session_count = activity.getSession_count();
	        %>
	        
	        var act_table_<%=act_id%> = Table.new_one('act_table_<%=act_id%>',
	                                            {
	                                                header : ['活动名','活动简介']
	                                            });
	        act_table_<%=act_id%>.className = 'table table-bordered';
	        var act1 = Table.new_record(['<div style="width:50px"><%=act_name%></div>', 
	                                         '<div><%=act_desc%></div>' 
	                                         ]);
	        act1.set({
	            "class" : 'success',    
	        });
	        
	        act_table_<%=act_id%>.add(act1);
	        
	        var manage_<%=act_id%> = Table.new_record(['',
	                                       '<input id="session1" type="button" value="删除本活动" class="btn btn-lg" style="height: 35px;" onclick="deleteTable(\'act_table_<%=act_id%>\',\'session_table_<%=act_id%>\')">'+
	                                       '<input type="button" value="修改本活动" class="btn btn-lg" style="height: 35px;margin-left:10px" onclick="edit_act(\'act_table_<%=act_id%>\',\'session_table_<%=act_id%>\')">'+
	                                       '<input type="button" value="保存" class="btn btn-lg btn-primary" style="height: 35px;width:80px;margin-left:10px;display:none" onclick="saveTable(\'act_table_<%=act_id%>\',\'session_table_<%=act_id%>\')">'
	                                       ]);
	        act_table_<%=act_id%>.add(manage_<%=act_id%>);
	        document.body.appendChild(act_table_<%=act_id%>);
	        
	        
	        var session_table_<%=act_id%> = Table.new_one('session_table_<%=act_id%>', 
	        		{
	        			header:['场次', '时间','地点','教练','<div style="margin-left:10%">'+'场次管理'+'</div>']
	        		});
	        <%List<ActSession> actSessions=actHash.get(activity);
	        	for(ActSession actSession:actSessions){
	        		int session_id = actSession.getSession_id();
	        		String site = actSession.getSite();
	        		String coach_name = actSession.getCoach_name();
	        		String time = actSession.getTime();
	        %>	        
	        session_table_<%=act_id%>.className = 'table table-bordered';
	        var session_<%=session_id%> = Table.new_record(['<%=session_id%>',
	                                         '<%=time%>',
	                                         '<%=site%>',
	                                         '<%=coach_name%>',
	                                         '<div style="margin-left:10%">'+
	                                         '<td><input id="session_<%=session_id%>" type="button" value="删除" class="btn btn-lg" style="height: 35px;" onclick="deleteRow(session_<%=session_id%>,this.parentNode.parentNode.parentNode.rowIndex)"></td>'+
	                                         '</div>'
	                                         ]);
	        session_<%=session_id%>.set({
	        	"class":'error'
	        });
	        session_table_<%=act_id%>.add(session_<%=session_id%>);
	        <%}%>
	        document.body.appendChild(session_table_<%=act_id%>);
	        
	        <%}%>
		};
		
		function deleteRow(id,i){
			document.getElementById(id).deleteRow(i);
		}
		
		function insertRow(session_table_id){
			return function() {
				var session_num = document.getElementById(session_table_id).tBodies[0].children.length;
				var session = document.getElementById(session_table_id).insertRow( session_num + 1 );
				
			    var cell1 = session.insertCell(0);
			    var cell2 = session.insertCell(1);
			    var cell3 = session.insertCell(2);
			    var cell4 = session.insertCell(3);
			    var cell5 = session.insertCell(4);
			    
			    cell1.innerHTML="" + (session_num + 1);
			    cell2.innerHTML='<input type="text" value="' + '"  style="width:150px" />';	
			    cell3.innerHTML='<input type="text" value="' + '"  style="width:50px" />';
			    cell4.innerHTML='<input type="text" value="' + '"  style="width:50px" />';
			    
			    document.getElementById(session_table_id).tBodies[0].children[session_num-1].children[4].children[0].children[0].display = 'none';
			};

		}
		
		function saveTable(act_table_id,session_table_id){
			document.getElementById(act_table_id).tBodies[0].children[1].children[1].children[2].style.display = 'none';
			
			var act_table = document.getElementById(act_table_id);
			act_table = window.tableUtil.decorate(act_table);
			act_table.forEachChild(window.tableUtil.subsitute_content);
			
			var session_table = document.getElementById(session_table_id);
			session_table = window.tableUtil.decorate(session_table);
			session_table.forEachChild(window.tableUtil.subsitute_content);
		}
		
		function deleteTable(act_table_id,session_table_id){
			 var Table = Util.table;
			 Table.remove(act_table_id);
			 Table.remove(session_table_id);
		}
		
		function edit_act(act_table_id,session_table_id){
			//显示保存按钮
			document.getElementById(act_table_id).tBodies[0].children[1].children[1].children[2].style.display = 'inline';
			
			//将表格相应部分变为可编辑
			var name_obj = document.getElementById(act_table_id).tBodies[0].children[0].children[0];
			name_obj.innerHTML = '<input type="text"  id="act_name" value="' + name_obj.children[0].innerHTML + '"  style="width:50px" />';
			
			var desc_obj = document.getElementById(act_table_id).tBodies[0].children[0].children[1];
			desc_obj.innerHTML = '<textarea style="width:400px;height:100px;overflow-y:hidden;resize:none;">' + desc_obj.children[0].innerHTML + '</textarea>';
			
			var session_num = document.getElementById(session_table_id).tBodies[0].children.length;
			
			for(var i=0;i<session_num;i++){
				var date =  document.getElementById(session_table_id).tBodies[0].children[i].children[1];
				date.innerHTML = '<input type="text" value="' + date.innerHTML + '"  style="width:150px" />';
				
				for(var j=2;j<4;j++){
					var session =  document.getElementById(session_table_id).tBodies[0].children[i].children[j];
					session.innerHTML = '<input type="text" value="' + session.innerHTML + '"  style="width:50px" />';
				}
				
				var manage_btn =  document.getElementById(session_table_id).tBodies[0].children[i].children[4].children[0].children[0];
				if(i == (session_num-1)){
					manage_btn.value = '添加场次';
					manage_btn.onclick = insertRow(session_table_id);
				}else{
					manage_btn.display = 'none';
				}
			}
		}
	</script>
</body>
</html>