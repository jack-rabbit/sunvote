<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="../static/css/teach.css" rel="stylesheet">
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<link href="static/css/teach.css" rel="stylesheet">
</head>
<body class="no-skin">
	<form action="grade/listcs.do" method="post" name="Form" id="Form">
		<div class="head_box">
			<div class="box_header">
				<div class="head_box_l">
					<p>
						<span class="right_b"></span>年级管理
					</p>
				</div>
				<div class="head_box_r"></div>
				<div class="clear"></div>
			</div>
			<div style="padding:0 5%;background:#fff;">
				<table class="table table-striped">
					<col style="width: 10%" />
					<col style="width: 45%" />
					<col style="width: 45%" />
					<thead>
						<tr>
							<th><input type="checkbox" name='ids' id="ids" />序号</th>
							<th class="center">年级名称</th>
							<th class="center">年级描述</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
		<div class="table_box">
			<table class="table table-striped">
				<col style="width: 10%" />
				<col style="width: 30%" />
				<col style="width: 30%" />
				<col style="width: 30%" />

				<tbody>
					<c:choose>
						<c:when test="${not empty varList}">
							<c:forEach items="${varList}" var="var" varStatus="vs">
								<tr>
									<td><input type="checkbox" name='ids' id="ids"
										value="${var.ID}" />${vs.index+1}</td>
									<td class='center'>${var.NAME}</td>
									<td class='center'>${var.DESC}</td>
									<td class='center'></td>

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
					<input type="button"  onclick="add()" value="添加年级" />
				</div>
				<div class="removeAll">
					<input type="button" onclick="del()" value="移除年级" />
				</div>
				<div class="page_box">

					<div class="pagination"
						style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div>
				</div>
			</div>
		</div>
	</form>

	<!-- /.main-container -->

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
		
		function add(){
			window.top.modal.init({
			'title':'添加班级',
			'url':'<%=basePath%>grade/goAdd2.do',
			func:function() {
				tosearch();
			}
			});
			window.top.modal.show();
		}
		
		$('#ids').on('click', function(){
			var th_checked = $("#ids").prop('checked');//checkbox inside "TH" table header
			
			$(".table_box .table").find('tbody > tr').each(function(){
				var row = this;
				if(th_checked) $(row).find('input[type=checkbox]').eq(0).prop('checked', true);
				else $(row).find('input[type=checkbox]').eq(0).prop('checked', false);
			});
	});
		
		function del(Id){
			window.top.remove.init({"title":"删除","func":function(success){
				if(success){
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++){
					  if(document.getElementsByName('ids')[i].checked){
					  	if(str=='') str += document.getElementsByName('ids')[i].value;
					  	else str += ',' + document.getElementsByName('ids')[i].value;
					  }
					}
					if(str==''){
						
					}else{
						$.ajax({
								type: "POST",
								url: '<%=basePath%>grade/deleteAll.do?tm='+new Date().getTime(),
						    	data: {DATA_IDS:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									tosearch();
								}
							});
					}
				}
				else{
					console.log("false");
				}
			}});
			window.top.remove.show();
		}

	</script>


</body>
</html>