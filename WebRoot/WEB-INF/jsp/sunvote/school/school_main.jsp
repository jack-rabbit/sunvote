<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">

	<table style="width:100%;height:100%" border="1px solid red" >
		<tr>
			<td style="width:20%; font-size:12px; margin-right: 20px" valign="top" bgcolor="#F5F5F5">
				 <div id="tree"></div>
			</td>
			<td style="width:80%;" valign="top" >
				<div style="background-color:#F0F0F0;width:100%" border="1px" ></div>
				<iframe name="treeFrame" id="treeFrame" frameborder="0" src="" style="margin:0 auto;width:100%;height:100%"></iframe>
			</td>
		</tr>
	</table>

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	
	<script src="static/treeview/bootstrap-treeview.js"></script>
	
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
	
	
	</script>


</body>
</html>