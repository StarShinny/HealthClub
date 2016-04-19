<%@page import="model.User"%>
<%@page import="model.ChargeHistory"%>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>

<jsp:include flush="true" page="/view/member/head.jsp"></jsp:include>
<jsp:useBean id="card" type="model.Card" scope="session"></jsp:useBean>
<jsp:useBean id="user" type="model.User" scope="session"></jsp:useBean>

			<!-- 主界面内容 -->
			<div class="g-main">
				<div class="g-postlist" id="post_content">
					<div class="m-post m-post-photo">
						<div class="content">
							<div class="wrap">
								<div class="img">
									<a href="#"><img src="<%=request.getContextPath()+"/view/picture/payment.jpg"%>"></a>
								</div>
							</div>
						</div>
					</div>
					<iframe id="pay_frame" style="width:550px;scrolling:no;display:none;" src="<%=request.getContextPath()+"/view/member/pay_frame.jsp"%>">
					</iframe>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
       window.init_pay_frame = function() {
           var table_frame = $('#pay_frame')[0];
           var sub_window = window.frames['pay_frame'];
           var allTrs = sub_window.document.getElementsByTagName('tr');
           var trCount = allTrs.length;
           var HEIGHT_PER_TR = 60;
           var totalHeight = 600;
           table_frame.style.height = totalHeight + "px";
           table_frame.style.display = "inline";
           return;
       };
     	window.onload = function() {
           $('#side-bar')[0].style.display = "inline";
           window.init_pay_frame();
     	};
     </script>
	 <jsp:include page="/view/member/foot.jsp" flush="true"></jsp:include>
</body>
</html>