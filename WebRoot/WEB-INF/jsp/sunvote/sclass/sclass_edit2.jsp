<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	<!-- 编辑页样式覆盖 -->
	<link rel="stylesheet" href="static/css/edit.css" />
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
					
					<form action="sclass/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">所属学校:</td>
								<td>
								<%-- <input type="text" name="SCHOOL_ID" id="SCHOOL_ID" value="${pd.SCHOOL_ID}" maxlength="255" placeholder="这里输入所属学校" title="所属学校" style="width:98%;"/> --%>
								
								<select class="chosen-select form-control" name="SCHOOL_ID" id="SCHOOL_ID" disabled="disabled" data-placeholder="这里输入所属学校">
									<c:forEach var="item" items="${schools}">
										<option value="${item.ID}"  <c:if test="${pd.SCHOOL_ID==item.ID}">selected="true"</c:if>>${item.NAME}</option>
									</c:forEach>
								</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">所属年级:</td>
								<td>
								<%-- <input type="text" name="GRADE_ID" id="GRADE_ID" value="${pd.GRADE_ID}" maxlength="255" placeholder="这里输入所属年级" title="所属年级" style="width:98%;"/></td> --%>
								<select class="chosen-select form-control" name="GRADE_ID" disabled="disabled" id="GRADE_ID" data-placeholder="这里输入所属年级" >
									<c:forEach var="item" items="${grades}">
										<option value="${item.ID}"  <c:if test="${pd.GRADE_ID==item.ID}">selected="true"</c:if>>${item.NAME}</option>
									</c:forEach>
								</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">班级类型:</td>
								<td>
								<%-- <input type="text" name="CLASS_TYPE" id="CLASS_TYPE" value="${pd.CLASS_TYPE}" maxlength="255" placeholder="这里输入班级类型" title="班级类型" style="width:98%;"/></td> --%>
								<select class="chosen-select form-control" name="CLASS_TYPE" id="CLASS_TYPE" data-placeholder="这里输入班级类型">
									<c:forEach var="item" items="${classTypes}">
										<option value="${item.ID}"  <c:if test="${pd.CLASS_TYPE==item.ID}">selected="true"</c:if>>${item.NAME}</option>
									</c:forEach>
								</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">班级名称:</td>
								<td><input type="text" name="CLASS_NAME" id="CLASS_NAME" value="${pd.CLASS_NAME}" maxlength="255" placeholder="这里输入班级名称" title="班级名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">班级编码:</td>
								<td><input type="text" name="CLASS_CODE" id="CLASS_CODE" value="${pd.CLASS_CODE}" maxlength="255" placeholder="这里输入班级编码" title="班级编码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">班级基站:</td>
								<td>
								<%-- <input type="text" name="BASESTATION_ID" id="BASESTATION_ID" value="${pd.BASESTATION_ID}" maxlength="255" placeholder="这里输入班级基站" title="班级基站" style="width:98%;"/></td> --%>
								<select class="chosen-select form-control" name="BASESTATION_ID" id="BASESTATION_ID" data-placeholder="这里输入班级基站">
									<c:forEach var="item" items="${basestations}">
										<option value="${item.ID}"  <c:if test="${pd.BASESTATION_ID==item.ID}">selected="true"</c:if>>${item.NAME}</option>
									</c:forEach>
								</select>
								</td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="window.top.modal.remove();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#SCHOOL_ID").val()==""){
				$("#SCHOOL_ID").tips({
					side:3,
		            msg:'请输入所属学校',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SCHOOL_ID").focus();
			return false;
			}
			if($("#GRADE_ID").val()==""){
				$("#GRADE_ID").tips({
					side:3,
		            msg:'请输入所属年级',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GRADE_ID").focus();
			return false;
			}
			if($("#CLASS_TYPE").val()==""){
				$("#CLASS_TYPE").tips({
					side:3,
		            msg:'请输入班级类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CLASS_TYPE").focus();
			return false;
			}
			if($("#CLASS_NAME").val()==""){
				$("#CLASS_NAME").tips({
					side:3,
		            msg:'请输入班级名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CLASS_NAME").focus();
			return false;
			}
			if($("#CLASS_CODE").val()==""){
				$("#CLASS_CODE").tips({
					side:3,
		            msg:'请输入班级编码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CLASS_CODE").focus();
			return false;
			}
			if($("#BASESTATION_ID").val()==""){
				$("#BASESTATION_ID").tips({
					side:3,
		            msg:'请输入班级基站',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BASESTATION_ID").focus();
			return false;
			}
			$("#SCHOOL_ID").removeAttr("disabled"); 
			$("#GRADE_ID").removeAttr("disabled"); 
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>