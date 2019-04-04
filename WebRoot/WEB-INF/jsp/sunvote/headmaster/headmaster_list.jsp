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
<title>中天电子-教育管理系统</title>
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
	<form action="headmaster/list.do" method="post" name="Form" id="Form">
		<input type="hidden" name="SCHOOL_ID" id="SCHOOL_ID" value="${pd.SCHOOL_ID}"/>
		<input type="hidden" name="GRADE_ID" id="GRADE_ID" value="${pd.GRADE_ID}"/>
		<div class="head_box">
			<div class="box_header">
				<div class="head_box_l">
					<p>
						<span class="right_b"></span>班长管理
					</p>
				</div>
				<div class="clearfix"></div>
			</div>
			<div style="background:#fff;padding:0 5%;" >

				<table class="table table-striped" >
					<col style="width: 10%" />
					<col style="width: 10%" />
					<col style="width: 10%" />
					<col style="width: 10%" />					
					<col style="width: 20%" />
					<col style="width: 20%" />
					<thead>
						<tr>
							<th><input type="checkbox" value="0" name='ids' id="ids" />序号</th>
							<th class="center">姓名</th>
							<th class="center">用户名</th>
							<th class="center">密码</th>
							<th class="center">联系电话</th>
							<th class="center">操作</th>
						</tr>
						
					</thead>
				</table>
			</div>

			<div class="clearfix"></div>
			<!-- 检索  -->

		</div>
		<div class="table_box" >
			<table class="table table-striped" >
				<col style="width: 10%" />
				<col style="width: 10%" />
				<col style="width: 10%" />
				<col style="width: 10%" />				
				<col style="width: 20%" />
				<col style="width: 20%" />
				<tbody>
					<!-- 开始循环 -->
				<c:choose>
					<c:when test="${not empty varList}">
						<c:forEach items="${varList}" var="var" varStatus="vs">
							<tr>		
								<td><input type="checkbox" name='ids' id="ids"
										value="${var.ID}" />${vs.index+1}</td>
								<td class='center'>${var.NAME}</td>
								<td class='center'>${var.USERNAME}</td>
								<td class='center'>${var.PASSWORD}</td>								
								<td class='center'>${var.PHONE}</td>
								<td><a onclick="edit('${var.HEADMASTER_ID}');" style="margin-right:10px;"><img src="static/images/eidtor.png" /></a><a href="#" onclick="del('${var.HEADMASTER_ID}');"><img src="static/images/remove.png" /></a></td>								
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
	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>

	<script type="text/javascript">
		window.top.loading.remove();
		//检索
		function tosearch(){
			$("#Form").submit();
		}
		//修改
		function edit(Id){
			window.top.modal.init({
			'title':'修改信息',
			'url':'<%=basePath%>headmaster/goEdit.do?HEADMASTER_ID='+Id,
			func:function() {
				tosearch();
			}
			});
			window.top.modal.show();
		}
		function add(){
			window.top.modal.init({
			'title':'添加班长',
			'url':'<%=basePath%>headmaster/goAdd.do?school_id=${pd.SCHOOL_ID}&grade_id=${pd.GRADE_ID}',
			func:function() {
				tosearch();
			}
			});
			window.top.modal.show();
		}
		$(function() {

		
		
		
		})

	</script>


</body>
</html>