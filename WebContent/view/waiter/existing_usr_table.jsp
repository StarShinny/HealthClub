<%@page import="model.User"%>
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
	<%List<User> users = (List<User>)session.getAttribute("users"); %>
	<script type="text/javascript">
		window.onload = function(){
			var Util = window.util;
	        var Table = Util.table;
	        
	        <!--用户表-->
	        var usr_table = Table.new_one('usr_table', 
	        		{
	        			header:['用户名', '年龄','性别','居住地','卡号']
	        		});
	        <%
	        	for(User user:users){
	        		String name = user.getName();
	        		int age = user.getAge();
	        		String gender = user.getGender();
	        		String residence = user.getResidence();
	        		String card_id = user.getCard_id();
	        		int id = user.getId();
	        %>	        
	        usr_table.className = 'table table-bordered';
	        var usr_<%=id%> = Table.new_record(['<%=name%>',
	                                         '<%=age%>',
	                                         '<%=gender%>',
	                                         '<%=residence%>',
	                                         '<%=card_id%>'
	                                         ]);
	        usr_<%=id%>.set({
	        	"class":'error'
	        });
	        usr_table.add(usr_<%=id%>);
	        <%}%>
	        
	        <!--管理行-->
	        var manage = Table.new_record(['',
	        	                                       '<input type="button" value="修改用户信息" class="btn btn-lg" style="height: 35px;margin-left:10px" onclick="edit_usr()">'+
	        	                                       '<input id="save_btn" type="button" value="保存" class="btn btn-lg btn-primary" style="height: 35px;width:80px;margin-left:10px;display:none" onclick="saveTable()">'
	        	                                       ]);
	        usr_table.add(manage);
	        document.body.appendChild(usr_table);
	        
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
		
		function saveTable(){
			document.getElementById('save_btn').style.display = 'none';
			
			var usr_table = document.getElementById('usr_table');
			usr_table = window.tableUtil.decorate(usr_table);
			usr_table.forEachChild(window.tableUtil.subsitute_content);
		}
		
		function deleteTable(act_table_id,session_table_id){
			 var Table = Util.table;
			 Table.remove(act_table_id);
			 Table.remove(session_table_id);
		}
		
		function edit_usr(){
			//显示保存按钮
			document.getElementById('save_btn').style.display = 'inline';
			
			//将表格相应部分变为可编辑
			var usr_num = document.getElementById('usr_table').tBodies[0].children.length;
			
			for(var i=0;i<usr_num-1;i++){
				
				for(var j=0;j<5;j++){
					var  usr=  document.getElementById('usr_table').tBodies[0].children[i].children[j];
					usr.innerHTML = '<input type="text" value="' + usr.innerHTML + '"  style="width:50px" />';
				}
				
			}
		}
	</script>
</body>
</html>