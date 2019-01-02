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

	<form action="teacher/listcs.do" method="post" name="Form" id="Form">
		<div class="head_box">
			<div class="box_header">
				<div class="head_box_l">
					<p>
						<span class="right_b"></span>教师管理
					</p>
				</div>
				<div class="head_box_r"></div>
				<div class="clear"></div>
			</div>
			<div style="padding:0 5%;background:#fff;">
				<table class="table table-striped">
					<col style="width: 10%" />
					<col style="width: 10%" />
					<col style="width: 10%" />
					<col style="width: 10%" />
					<col style="width: 15%" />
					<col style="width: 15%" />
					<col style="width: 15%" />
					<col style="width: 15%" />
					<thead>
						<tr>
							<th><input type="checkbox" value="0" name='ids' id="ids" />序号</th>
							<th class="center">姓名</th>
							<th class="center">电话</th>
							<th class="center">座机电话</th>
							<th class="center">证件号</th>
							<th class="center">账号</th>
							<th class="center">性别</th>
							<th class="center">教师卡编号</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
		<div class="table_box">
					<table class="table table-striped">
						<col style="width: 10%" />
						<col style="width: 10%" />
						<col style="width: 10%" />
						<col style="width: 10%" />
						<col style="width: 15%" />
						<col style="width: 15%" />
						<col style="width: 15%" />
						<col style="width: 15%" />
						<tbody>
							<!-- 开始循环 -->
							<c:choose>
								<c:when test="${not empty varList}">
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>
											<td><input type="checkbox" name='ids' id="ids" value="${var.ID}" />${vs.index+1}</td>
											<td class='center'>${var.NAME}</td>
											<td class='center'>${var.PHONE}</td>
											<td class='center'>${var.SEAT_PHONE}</td>
											<td class='center'>${var.CARD_NO}</td>
											<td class='center'>${var.ACCOUT}</td>
											<td class='center'>${var.SEX == 1? "男":"女"}</td>
											<td class='center'>${var.KEYPAD_ID}</td>
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
					<input type="button"  onclick="parent.$('.title_time').modal('show');" value="添加老师" />
				</div>
				<div class="removeAll">
					<input type="button" onclick="deleteAll()" value="删除" />
				</div>
				<div class="page_box">
					<div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div>
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
		});
	</script>


</body>
</html>