<%@page import="model.User"%>
<%@page import="model.Activity"%>
<%@page import="model.ActSession"%>
<%@page import="java.util.List" %>
<%@page import="java.util.Hashtable" %>
<%@page import="java.util.Iterator" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>

<jsp:include flush="true" page="/view/member/head.jsp"></jsp:include>

			<!-- 主界面内容 -->
			<div class="g-main">
				<div class="g-postlist" id="post_content">
					<%Hashtable<Activity, List<ActSession>> actHash = (Hashtable<Activity, List<ActSession>>)session.getAttribute("activities"); %>
					<%for(Iterator<Activity> itr=actHash.keySet().iterator();itr.hasNext();){
			        	Activity activity = itr.next();
			        	int act_id = activity.getAct_id();
			        	String act_name = activity.getAct_name();
			        	String act_desc = activity.getAct_desc();
			        	int session_count = activity.getSession_count();
	        		%>
	        			<div class="m-post m-post-photo">
						<div class="content">
							<div class="wrap">
								<div class="img">
									<a href="#"><img
										src="<%=request.getContextPath()+"/view/picture/yoga.jpg"%>"></a>
								</div>
							</div>
							<div class="text">
								<p reblogfrom="reblogfrom">
									<a href="<%=request.getContextPath()+"/view/showActDetail?act_id=" + act_id %>"><%=act_name %></a>
								</p>
								<blockquote>
									<p><%=act_desc %></p>
								</blockquote>
							</div>
						</div>
						<div class="timearea">
							<a href="#"
								class="time">2014-03-10</a>
						</div>
					</div>
	        		<%} %>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/view/member/foot.jsp" flush="true"></jsp:include>
</body>
</html>