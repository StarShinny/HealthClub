<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>

<jsp:include flush="true" page="/view/member/head.jsp"></jsp:include>
			
			<!-- 主界面内容 -->
			<div class="g-main">
				<div class="g-postlist" id="post_content">
					<div class="m-post m-post-photo">
							<div class="wrap">
								<div class="img">
									<a href="#"><img src="<%=request.getContextPath()+"/view/picture/reserve.jpg"%>"></a>
								</div>
							</div>
					</div>
					<iframe id="reserve_table_frame" style="width:550px;scrolling:no;display:none;" src="<%=request.getContextPath()+"/view/member/reserve_table.jsp"%>">
					</iframe>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
      window.init_reserve_table = function() {
          var table_frame = $('#reserve_table_frame')[0];
          console.log(table_frame);
          var sub_window = window.frames['reserve_table_frame'];
          var allTrs = sub_window.document.getElementsByTagName('tr');
          var trCount = allTrs.length;
          var HEIGHT_PER_TR = 60;
          var totalHeight = trCount * HEIGHT_PER_TR + 50;
          table_frame.style.height = totalHeight + "px";
          table_frame.style.display = "inline";
          return;
      };
    	window.onload = function() {
          $('#side-bar')[0].style.display = "inline";
          window.init_reserve_table();
    	};
    </script>
	<jsp:include page="/view/member/foot.jsp" flush="true"></jsp:include>
</body>
</html>