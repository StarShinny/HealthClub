<%@page import="model.Participation"%>
<%@page import="model.User"%>
<%@page import="model.Activity"%>
<%@page import="model.ActSession"%>
<%@page import="java.util.List" %>
<%@page import="java.util.Hashtable" %>
<%@page import="java.util.Iterator" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<html>
<head>
    <meta charset="UTF-8">
    <title>健康俱乐部</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="../css/editor.css" rel="stylesheet" />
    <script src="http://code.jquery.com/jquery.js" type="text/javascript"></script>
    <script src="../js/tool.js" type="text/javascript"></script>
    <script src="../js/table.js" type="text/javascript"></script>
</head>
<body>
<%
	Hashtable<Activity, List<ActSession>> actHash = (Hashtable<Activity, List<ActSession>>)session.getAttribute("activities");
	List<Participation> parts = (List<Participation>)session.getAttribute("parts");
%>

<script type="text/javascript">
    window.onload = function(){
    	<%=actHash.values().size() %>
        <%for(Iterator<Activity> itr=actHash.keySet().iterator();itr.hasNext();){
        	Activity activity = itr.next();
        	int act_id = activity.getAct_id();
        	String act_name = activity.getAct_name();
        	String act_desc = activity.getAct_desc();
        	int session_count = activity.getSession_count();
        %>
        //活动简介表
        var act_table_<%=act_id%> = new XTable({
            id:'act_table_<%=act_id%>',
            fields:['活动名','活动简介']
        });

        act_table_<%=act_id%>.table_element.set({
            'class':'table table-bordered'
        });

        var act_desc_<%=act_id%> = act_table_<%=act_id%>.new_record({
            '活动名':'<div style="width:50px"><%=act_name%></div>',
            '活动简介':'<div><%=act_desc%></div>'
        });


        act_table_<%=act_id%>.insert_record(0,act_desc_<%=act_id%>);
        document.body.appendChild(act_table_<%=act_id%>.table_element);

        //场次表
        var session_table_<%=act_id%> = new XTable({
            id:'session_table_<%=act_id%>',
            fields:['场次','时间','地点','教练','添加参与人员']
        });
      	//各场次参与人员表
        var part_table_<%=act_id%> = new XTable({
            id:'part_table_<%=act_id%>',
            fields:['场次','卡号','人数','']
        });
      
        <%List<ActSession> actSessions=actHash.get(activity);
    	for(ActSession actSession:actSessions){
    		int session_id = actSession.getSession_id();
    		String site = actSession.getSite();
    		String coach_name = actSession.getCoach_name();
    		String time = actSession.getTime();
    	%>	
        
        session_table_<%=act_id%>.table_element.set({
            'class':'table table-bordered'
        });

        var session_<%=session_id%> = session_table_<%=act_id%>.new_record({
            '场次':'<%=session_id%>',
            '时间':'<%=time%>',
            '地点':'<%=site%>',
            '教练':'<%=coach_name%>',
            '添加参与人员':'<input type="button" value="添加" class="btn btn-lg btn-primary" style="height: 35px;width:80px;margin-left:10px;" onclick="addRow(\'part_table_<%=act_id%>\',\'1\')">'
        });

        session_table_<%=act_id%>.insert_record(0,session_<%=session_id%>);
        
		<%}%>
		document.body.appendChild(session_table_<%=act_id%>.table_element);
		
		
		part_table_<%=act_id%>.table_element.set({
            'class':'table table-bordered'
        });
		<%
	if(parts!=null){
		for(Participation part:parts){
			if(part.getAct_id() == act_id){
				int session_id = part.getSession_id();
				String card_id = part.getCard_id();
				int count = part.getPart_count();
				int id = part.getId();
				%>
		        var part_session_<%=id%> = part_table_<%=act_id%>.new_record({
		            '场次':'<%=session_id%>',
		            '卡号':'<%=card_id%>',
		            '人数':'<%=count%>',
		            '':''
		        });
		        part_table_<%=act_id%>.insert_record(0,part_session_<%=act_id%>);
		     <%}%>
        <%}%>
        document.body.appendChild(part_table_<%=act_id%>.table_element);
        <%}}%>
    };

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
</script>
</body>
</html>