<%@page import="model.User"%>
<%@page import="java.util.List" %>>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="user" type="model.User" scope="session"></jsp:useBean>
<jsp:useBean id="card" type="model.Card" scope="session"></jsp:useBean>

<html>
<head>
    <meta charset="UTF-8">
    <title>健康俱乐部</title>
    <link href="<%=request.getContextPath()+"/view/css/bootstrap.min.css"%>" rel="stylesheet" media="screen">
    <script src="http://code.jquery.com/jquery.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()+"/view/js/tool.js"%>" type="text/javascript"></script>
    <script src="<%=request.getContextPath()+"/view/js/table.js"%>" type="text/javascript"></script>
</head>
<body style="">
    <input type="button" id="edit_btn" class="btn btn-lg" style="align:right;height: 40px" onclick="edit_info()" value="修改注册信息" />
    <%
    String show="";
    if(user.getCard_type()==1){
    	show = "none";	
    }else{ 
    	show = "inline";
    }
    
    %>
    
    <input type="button" id="add_btn1" class="btn btn-lg" style="margin-left: 10px;height: 40px;display:<%=show %>" onclick="addMateTable()" value="添加伴侣信息" />
    <input type="button" id="add_btn2" class="btn btn-lg" style="margin-left: 10px;height: 40px;display:<%=show %>" onclick="addChildTable()" value="添加子女信息">
    <input type="button" id="save_edit" class="btn btn-lg btn-primary" style="margin-left: 10px;height: 40px;display:none" onclick="saveTable()" value="保存修改">
	<br>
	<br>
<script type="text/javascript">
    window.onload = function(){
        //个人信息表
        var self_table = new XTable({
            id:'self_table',
            caption:'个人信息',
            fields:['用户名','性别','年龄','居住地']
        });

        self_table.table_element.set({
            'class':'table table-bordered'
        });

        var self = self_table.new_record({
            '用户名':'<div><%=user.getName()%></div>',
            '性别':'<div><%=user.getGender()%></div>',
            '年龄':'<div><%=user.getAge()%></div>',
            '居住地':'<div><%=user.getResidence()%></div>'
        });

        self_table.insert_record(0,self);
        document.body.appendChild(self_table.table_element);

        <%
        if(session.getAttribute("families")!= null){
        	List<User> list = (List<User>)session.getAttribute("families");%>
        	var family_table = new XTable({
        		id: "family_table",
        		caption:"家属信息",
        		fields:['用户名','性别','年龄','居住地']
        	});
        	family_table.table_element.set({
                'class':'table table-bordered'
            });
        	
        	<%
        	for (User family_member : list) {%>
        	
        		var <%="fm" + family_member.getName() %> = family_table.new_record({
                    '用户名':'<div><%=family_member.getName()%></div>',
                    '性别':'<div><%=family_member.getGender()%></div>',
                    '年龄':'<div><%=family_member.getAge()%></div>',
                    '居住地':'<div><%=family_member.getResidence()%></div>'
                }); 
        		family_table.insert_record(0,<%="fm" + family_member.getName() %>);
        	<%}%>
        	
        	document.body.appendChild(family_table.table_element);
        	<%
        }%>
    };

    function edit_info(){
    	document.getElementById('save_edit').style.display = "inline";
        var index = 0;
        var self_table = XTableRosters['self_table'];
        var fam_table = XTableRosters['family_table'];

        if ( self_table ) {
        	self_table.foreach_cell_at_row(index,
                    function(cell) {

                        if ( cell.firstChild && cell.firstChild.tagName ) {
                            ReverseXHandler[cell.firstChild.tagName](cell.firstChild, function(child) {
                                if ( child.type == 'button' ) {
                                    child.parentNode.removeChild(child);
                                    return true;
                                }
                            });
                        }
                    }
            );
        }
        if ( fam_table ) {
        	<%
        	if(session.getAttribute("families")!= null){
            	List<User> list = (List<User>)session.getAttribute("families");%>
            		index = <%=list.size()%>;
        	<%}%>
        	for (var i = 0;i < index;i++){
        	fam_table.foreach_cell_at_row(i,
                    function(cell) {
                        if ( cell.firstChild && cell.firstChild.tagName ) {
                            ReverseXHandler[cell.firstChild.tagName](cell.firstChild, function(child) {
                                if ( child.type == 'button' ) {
                                    child.parentNode.removeChild(child);
                                    return true;
                                }
                            });
                        }
                    }
            );}
        }
    }

    function addMateTable(){
        var mate_table = new XTable({
            id:'mate_table',
            caption:'伴侣信息',
            fields:['用户名','性别','年龄','居住地','']
        });

        mate_table.table_element.set({
            'class':'table table-bordered'
        });

        var btn_onclick_def = "saveRow('" + "mate_table" + "',this)";
        var mate = mate_table.new_record({
            '用户名':'<input name="user.name" type="text" value=""  style="width:80px;height:35px" />',
            '性别':'<input name="user.gender" type="text" value=""  style="width:80px;height:35px" />',
            '年龄':'<input name="user.age" type="number" min = 1  value="20"  style="width:80px;height:35px" />',
            '居住地':'<input name="user.residence" type="text" value=""  style="width:80px;height:35px" />',
            '':'<input type="button" value="保存" class="btn btn-lg btn-primary" style="height: 35px;width:60px;margin-left:10px;" onclick="' + btn_onclick_def + '" >'
        });

        mate_table.insert_record(0,mate);
        document.body.appendChild(mate_table.table_element);
    }

    function addChildTable(){
        var child_table = new XTable({
            id:'child_table',
            caption:'子女信息',
            fields:['用户名','性别','年龄','居住地','']
        });

        child_table.table_element.set({
            'class':'table table-bordered'
        });

        var btn_onclick_def = "saveRow('" + "child_table" + "',this)";
        var child = child_table.new_record({
            '用户名':'<input type="text" value=""  style="width:80px;height:35px" />',
            '性别':'<input type="text" value=""  style="width:80px;height:35px" />',
            '年龄':'<input type="number" min = 1  value="10"  style="width:80px;height:35px" />',
            '居住地':'<input type="text" value=""  style="width:80px;height:35px" />',
            '':'<input type="button" value="保存" class="btn btn-lg btn-primary" style="height: 35px;width:60px;margin-left:10px;" onclick="' + btn_onclick_def + '" >'
        });
        child_table.insert_record(0,child);
        document.body.appendChild(child_table.table_element);
    }

    function addRow(session_table_id,session_num){
        var table = window.XTableRosters[session_table_id];
        var btn_onclick_def = "saveRow('" + session_table_id + "',this)";

        table.insert_latest(table.new_record({
            '场次':session_num,
            '卡号':'<input type="text" value="' + '"  style="width:150px" />',
            '人数':'<input type="text" value="' + '"  style="width:150px" />',
            '':'<input type="button" value="保存" class="btn btn-lg btn-primary" style="height: 35px;width:80px;margin-left:10px;" onclick="' + btn_onclick_def + '" >'
        }));
    }

    function saveRow(table_id ,row){
        var index = row.parentNode.parentNode.rowIndex - 1;
        var table = XTableRosters[table_id];

        if ( table ) {
            table.foreach_cell_at_row(index,
                    function(cell) {
                        if ( cell.firstChild && cell.firstChild.tagName ) {
                            XHandlers[cell.firstChild.tagName](cell.firstChild, function(child) {
                                if ( child.type == 'button' ) {
                                	var this_row = child.parentNode.parentNode;
                                	var data     = {};
                                	var field_names = [ "user.name", "user.gender", "user.age", "user.residence" ];
                                	
                                	for (var i in this_row.childNodes) {
 	                               		if ( this_row.childNodes[i].tagName ) {
 	                               			var input = this_row.childNodes[i]; 
    										data[field_names[i]] = input.firstChild.innerHTML;	
                                		}
                                	}
                                	console.log(data);
                                	// for ajax method
                                	$.post("/HealthClub/view/addFamily.action", data, function(result){});
                                    child.parentNode.removeChild(child);
                                    return true;
                                }
                            });
                        }
                    }
            );
            return true;
        }
        else {
            return false;
        }
    }
    
    function post_to(url, data) {
    	$.post(url, data, function(result){});
    	
    }
    
    function saveTable(){
    	document.getElementById('save_edit').style.display = "none";
    	
        var self_table = XTableRosters['self_table'];
        var fam_table = XTableRosters['family_table'];

        if ( self_table ) {
        	var field_names = [ "user.name", "user.gender", "user.age", "user.residence"];
        	var self_data     = {};
        	var i = 0;
        	
        	self_table.foreach_cell_at_row(0,
                    function(cell) {
                        if ( cell.firstChild && cell.firstChild.tagName ) {
                            XHandlers[cell.firstChild.tagName](cell.firstChild, function(child) {                           	
                                	self_data[field_names[i]] =child.value;
                                	i++;
                            });
                        }
                    }
            );
        	
        	self_data["user.id"] = "<%=user.getId()%>";
        	self_data["user.password"] = "<%=user.getPassword()%>";
        	console.log(self_data);
        	// for ajax method
        	post_to("/HealthClub/view/updateUser.action", self_data);
        }
        
        
        
        
        
        
        if ( fam_table ) {
        	var field_names = [ "user.name", "user.gender", "user.age", "user.residence" ];
        	var data     = {};
        	var f_ids = {};
        	
        <%
        	if(session.getAttribute("families")!= null){
            	List<User> list = (List<User>)session.getAttribute("families");
        %>
            	var index = <%=list.size()%>;
            	
            	var tmp = 0;
        <%
        		for(User u:list){%>
        			f_ids[tmp] = "<%=u.getId()%>";
        			tmp++;
        		<%}
        	}%>
        	
        	for (var j = 0;j < index;j++){
        		console.log(j);
        		var i = 0;
        		
	        	fam_table.foreach_cell_at_row(j,
		            function(cell) {
		        		if ( cell.firstChild && cell.firstChild.tagName ) {
	                        XHandlers[cell.firstChild.tagName](cell.firstChild, function(child) {                           	
	                            	data[field_names[i]] =child.value;
	                            	i++;
	                        });
		        		}
		        	}
	        	);
	        	data["user.id"] = f_ids[j];
	        	data["user.relationship"] = "family";
	        	console.log(data);
	        	// for ajax method
				post_to("/HealthClub/view/updateUser.action", data);
	            
	        }
        }
        return true;
    }
</script>
</body>
</html>