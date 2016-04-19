<%@page import="model.User"%>
<%@page import="model.Activity"%>
<%@page import="model.ActSession"%>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>

<jsp:include flush="true" page="/view/member/head.jsp"></jsp:include>

	<!-- 主界面内容 -->
	<%Activity activity = (Activity)session.getAttribute("activity");%>
			<div class="g-main">
				<%
		        	int act_id = activity.getAct_id();
		        	String act_name = activity.getAct_name();
		        	String act_desc = activity.getAct_desc();
		        	int session_count = activity.getSession_count();
		        %>
				<div class="g-postlist" id="post_content">
					<h4>活动名：<%=act_name %></h4>
					<br>
					<div class="m-post m-post-photo">
						<div class="content">
							<div class="wrap">
								<div class="img">
									<a href="#"><img src="<%=request.getContextPath()+"/view/picture/yoga.jpg"%>"></a>
								</div>
							</div>
						</div>
					</div>
					<h4>活动简介：</h4>
					<p><%=act_desc %><br></p>
					<br>
					<iframe id="act_detail_table_frame" style="width:550px;scrolling:no;display:none;" src="<%=request.getContextPath()+"/view/member/act_detail_table.jsp"%>">
					</iframe>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
       window.init_act_detail_table = function() {
           var table_frame = $('#act_detail_table_frame')[0];
           var sub_window = window.frames['act_detail_table_frame'];
           var allTrs = sub_window.document.getElementsByTagName('tr');
           var trCount = allTrs.length;
           var HEIGHT_PER_TR = 60;
           var totalHeight = trCount * HEIGHT_PER_TR;
           table_frame.style.height = totalHeight + "px";
           table_frame.style.display = "inline";
           return;
       };
     	window.onload = function() {
           $('#side-bar')[0].style.display = "inline";
           window.init_act_detail_table();
     	};
     </script>
	 <jsp:include page="/view/member/foot.jsp" flush="true"></jsp:include>
</body>
</html>