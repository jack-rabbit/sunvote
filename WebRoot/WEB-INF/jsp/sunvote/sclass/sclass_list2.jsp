<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="myelfun" uri="/WEB-INF/tld/elfun.tld"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->

<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/teach.css" rel="stylesheet">
</head>
<body class="no-skin">

	<!-- 检索  -->
	<form action="sclass/listcs.do" method="post" name="Form" id="Form">
		<input type="hidden" name="SCHOOL_ID" id="SCHOOL_ID" value="${pd.SCHOOL_ID}"/>
		<input type="hidden" name="GRADE_ID" id="GRADE_ID" value="${pd.GRADE_ID}"/>
		<div class="head_box">
			<div class="box_header">
				<div class="head_box_l">
					<p>
						<span class="right_b"></span>班级管理
					</p>
				</div>
				<div class="clearfix"></div>
			</div>
			<div style="background:#fff;padding:0 5%;" >

				<table class="table table-striped" >
					<col style="width: 10%" />
					<col style="width: 18%" />
					<col style="width: 18%" />
					<col style="width: 18%" />
					<col style="width: 18%" />
					<col style="width: 18%" />
					<thead>
						<tr>
							<th><input type="checkbox" value="0" name='ids' id="ids" />序号</th>
							<th class="center">班级名称</th>
							<th class="center">班级类型</th>
							<th class="center">班级编码</th>
							<th class="center">班级基站</th>
							<th class="center">操作</th>
						</tr>
					</thead>
				</table>
			</div>

			<div class="clearfix"></div>
			<!-- 检索  -->

		</div>
		<div class="table_box" style="padding:0px 5%">
			<table class="table table-striped" >
				<col style="width: 10%" />
				<col style="width: 18%" />
				<col style="width: 18%" />
				<col style="width: 18%" />
				<col style="width: 18%" />
				<col style="width: 18%" />
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
									
									<td><a onclick="edit('${var.ID}');" style="margin-right:10px;"><img src="static/images/eidtor.png" /></a><a href="#" onclick="del('${var.ID}');"><img src="static/images/remove.png" /></a></td>
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
			<div class="footer" style="width:auto;margin: 0px 5%;">
				<div class="creat">
					<input type="button" onclick="add();" value="添加班级" />
				</div>
				 <div class="removeAll">
					<input type="button" onclick="del();" value="删除" />
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
			$(".table_box").css("padding-top",$(".head_box").height());
		});
		
		function tosearch(){
			$("#Form").submit();
		}
		
		$('#ids').on('click', function(){
				var th_checked = $("#ids").prop('checked');//checkbox inside "TH" table header
				
				$(".table_box .table").find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
		});
		function edit(Id){
			window.top.modal.init({
			'title':'修改信息',
			'url':'<%=basePath%>sclass/goEdit2.do?ID='+Id,
			func:function() {
				tosearch();
			}
			});
			window.top.modal.show();
		}
		
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
								url: '<%=basePath%>sclass/deleteAll.do?tm='+new Date().getTime(),
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
		
		function add(){
			window.top.modal.init({
			'title':'添加班级',
			'url':'<%=basePath%>sclass/goAdd2.do?school_id=${pd.SCHOOL_ID}&grade_id=${pd.GRADE_ID}',
			func:function() {
				tosearch();
			}
			});
			window.top.modal.show();
		}
	</script>


</body>
</html>