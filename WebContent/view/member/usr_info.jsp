<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>

<jsp:include flush="true" page="/view/member/head.jsp"></jsp:include>

			<!-- 主界面内容 -->
			<div class="g-main">
				<div class="g-postlist" id="post_content">
					<div class="m-post m-post-photo">
						<div class="content">
							<div class="wrap">
								<div class="img">
									<a href="#"><img src="<%=request.getContextPath()+"/view/picture/usr_info.jpg"%>"></a>
								</div>
							</div>
						</div>
					</div>
					<iframe id="usr_table_frame" style="width:550px;scrolling:no;display:none;" src="<%=request.getContextPath()+"/view/member/usr_table.jsp"%>">
					</iframe>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
        window.init_usr_table = function() {
            var table_frame = $('#usr_table_frame')[0];
           
           
           
            table_frame.style.height = 1000 + "px";
            table_frame.style.display = "inline";
            return;
        };
      	window.onload = function() {
            $('#side-bar')[0].style.display = "inline";
            window.init_usr_table();
      	};
    </script>
	<jsp:include page="/view/member/foot.jsp" flush="true"></jsp:include>
</body>
</html>