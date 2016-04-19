<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>

<jsp:include flush="true" page="/view/manager/head.jsp"></jsp:include>

			<!-- 主界面内容 -->
			<div class="g-main">
				<div class="g-postlist" id="post_content">
					<div class="m-post m-post-photo">
						<div class="content">
							<div class="wrap">
								<div class="img">
									<a href="#"><img src="<%=request.getContextPath()+"/view/picture/health.jpg"%>"></a>
								</div>
							</div>
						</div>
					</div>
					<iframe id="statics_frame" style="width:550px;scrolling:no;display:none;" src="<%=request.getContextPath()+"/view/manager/statics.jsp"%>">
					</iframe>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
      window.init_statics = function() {
          var table_frame = $('#statics_frame')[0];
          console.log(table_frame);

          table_frame.style.height = "1500px";
          table_frame.style.display = "inline";
          return;
      };
    	window.onload = function() {
    		$('#side-bar')[0].style.display = "inline";
            window.init_statics();
    	};
    </script>

	<jsp:include page="/view/manager/foot.jsp" flush="true"></jsp:include>
</body>
</html>