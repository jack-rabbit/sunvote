<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="myelfun" uri="/WEB-INF/tld/elfun.tld"%>

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
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<link href="static/css/teach.css" rel="stylesheet">
</head>
<body class="no-skin">

	<!-- 检索  -->
	<form action="sclass/listcs.do" method="post" name="Form" id="Form">
		<div class="head_box">
			<div class="box_header">
				<div class="head_box_l">
					<p>
						<span class="right_b"></span>班级管理
					</p>
				</div>
				<div class="clearfix"></div>
			</div>
			<div style="background:#fff;">

				<table class="table table-striped">
					<col style="width: 10%" />
					<col style="width: 22%" />
					<col style="width: 22%" />
					<col style="width: 23%" />
					<col style="width: 23%" />
					<thead>
						<tr>
							<th><input type="checkbox" value="0" name='ids' id="ids" />序号</th>
							<th class="center">班级名称</th>
							<th class="center">班级类型</th>
							<th class="center">班级编码</th>
							<th class="center">班级基站</th>
						</tr>
					</thead>
				</table>
			</div>

			<div class="clearfix"></div>
			<!-- 检索  -->

		</div>
		<div class="table_box" style="padding:0px">
			<table class="table table-striped">
				<col style="width: 10%" />
				<col style="width: 22%" />
				<col style="width: 22%" />
				<col style="width: 23%" />
				<col style="width: 23%" />
				<tbody>
					<!-- 开始循环 -->
					<c:choose>
						<c:when test="${not empty varList}">
							<c:forEach items="${varList}" var="var" varStatus="vs">
								<tr>
									<td><input type="checkbox" name='ids' id="ids"
										value="${var.ID}" />${vs.index+1}</td>
									<td class='center'><a href="student/listcs.do?class_id=${var.ID }">${var.CLASS_NAME}</a></td>
									<td class='center'>${myelfun:findClassTypeName(var.CLASS_TYPE)}</td>
									<td class='center'>${var.CLASS_CODE}</td>
									<td class='center'>${myelfun:findBasestationName(var.BASESTATION_ID)}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr class="main_info">
								<td colspan="100" class="center">没有相关数据</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div class="footer" style="width:auto">
				<div class="creat">
					<!-- <input type="button" onclick="add();" value="添加学生" /> -->
				</div>
				<div class="creat">
					<!-- <input type="button" onclick="upload();" value="批量导入" /> -->
				</div>
				
				<div class="page_box">
					<div class="pagination"
						style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div>
				</div>
			</div> 
		</div>
	</form>
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
	<script type="text/javascript">
		$(document).ready(function() {
			window.top.loading.remove();
			$(".table_box").css("padding-top",$(".head_box").height());
		});
	</script>


</body>
</html>