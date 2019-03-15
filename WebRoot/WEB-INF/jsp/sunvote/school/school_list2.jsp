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
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<link href="static/css/teach.css" rel="stylesheet">
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">
<!-- 检索  -->
	<form action="school/listcs.do" method="post" name="Form"
		id="Form" style="background:#fff;">
		<input type="hidden" name="SCHOOL_ID" id="PAPER_ID" value="${pd.SCHOOL_ID}"/>
		<div class="head_box">
			<div class="box_header">
				<div class="head_box_l">
					<p>
						<span class="right_b"></span>学校管理
					</p>
				</div>
				<div class="head_box_r">
					
				</div>
				<div class="clear"></div>
			</div>
			<div style="padding:0 5%;background:#fff;">
				<table class="table table-striped">
					<col style="width: 10%" />
					<col style="width: 15%" />
					<col style="width: 15%" />
					<col style="width: 15%" />
					<col style="width: 15%" />
					<col style="width: 15%" />
					<col style="width: 15%" />
					<thead>
						<tr>
							<th><input type="checkbox" name='ids' id="ids" />序号</th>
							<th class="center">学校名称</th>
							<th class="center">学校地址</th>
							<th class="center">校长</th>
							<th class="center">联系电话</th>
							<th class="center">备注</th>
							<th class="center">操作</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
		<div class="table_box" >
			<table class="table table-striped">
				<col style="width: 10%" />
				<col style="width: 15%" />
				<col style="width: 15%" />
				<col style="width: 15%" />
				<col style="width: 15%" />
				<col style="width: 15%" />
				<col style="width: 15%" />
				<tbody>
				<c:choose>
					<c:when test="${not empty varList}">
						<c:forEach items="${varList}" var="var" varStatus="vs">
							<tr>
								<td><input type="checkbox" name='ids' id="ids" value="${var.PAPER_ID}"/>${vs.index+1}</td>
								<td class='center'>${var.NAME}</td>
								<td class='center'>${var.ADDRESS}</td>
								<td class='center'>${var.PRESIDENT}</td>
								<td class='center'>${var.PHONE}</td>
								<td class='center'>${var.REMARK}</td>
								<td><a onclick="edit('${var.ID}');" style="margin-right:10px;"><img src="static/images/eidtor.png" /></a></td>
							</tr>
						
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr class="main_info">
							<td colspan="100" class="center" >没有相关数据</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
			<div class="footer">
				
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
		
	$(document).ready(function(){
		window.top.loading.remove();	
	});
	
	//编辑
	function edit(Id){
		window.top.modal.init({
		'title':'修改信息',
		'url':'<%=basePath%>school/goEdit2.do?ID='+Id,
		func:function() {
			tosearch();
		}
		});
		window.top.modal.show();
	}
		
	</script>


</body>
</html>