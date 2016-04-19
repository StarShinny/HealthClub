<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include flush="true" page="/view/waiter/head.jsp"></jsp:include>

			<!-- 主界面内容 -->
			<div class="g-main">
				<div class="g-postlist" id="post_content">
					<div class="m-post m-post-photo">
						<div class="content">
							<div class="wrap">
								<div class="img">
									<a href="#"><img src="../view/picture/health.jpg"></a>
								</div>
							</div>
						</div>
					</div>
					<iframe id="add_part_table_frame" style="width:550px;scrolling:no;display:none;" src="<%=request.getContextPath()+"/view/waiter/add_part_table.jsp"%>">
					</iframe>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
      window.init_add_part_table = function() {
          var table_frame = $('#add_part_table_frame')[0];
          console.log(table_frame);
          var sub_window = window.frames['add_part_table_frame'];
          var allTrs = sub_window.document.getElementsByTagName('tr');
          var trCount = allTrs.length;
          var HEIGHT_PER_TR = 200;
          var totalHeight = trCount * HEIGHT_PER_TR;
          table_frame.style.height = totalHeight + "px";
          table_frame.style.display = "inline";
          return;
      };
    	window.onload = function() {
    		$('#side-bar')[0].style.display = "inline";
            window.init_add_part_table();
    	};
    </script>
    <jsp:include page="/view/waiter/foot.jsp" flush="true"></jsp:include>
</body>
</html>