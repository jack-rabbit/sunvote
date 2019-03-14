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
					
					<form action="coursemanagement/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">老师:</td>
								<td>
								<select class="chosen-select form-control" name="TEACHER_ID" id="TEACHER_ID" data-placeholder="这里输入">
									<c:forEach var="item" items="${teachers}">
										<option value="${item.ID}"  <c:if test="${pd.TEACHER_ID==item.ID}">selected="true"</c:if>>${item.NAME}</option>
									</c:forEach>
								</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">班级:</td>
								<td>
								<%-- <input type="number" name="CLASS_ID" id="CLASS_ID" value="${pd.CLASS_ID}" maxlength="32" placeholder="这里输入班级ID" title="班级ID" style="width:98%;"/></td> --%>
								<select class="chosen-select form-control" name="CLASS_ID" id="CLASS_ID" data-placeholder="这里输入班级类型">
									<c:forEach var="item" items="${classs}">
										<option value="${item.ID}"  <c:if test="${pd.CLASS_ID==item.ID}">selected="true"</c:if>>${item.CLASS_NAME}</option>
									</c:forEach>
								</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">年级:</td>
								<td>
								<select class="chosen-select form-control" name="GRADE_ID" id="GRADE_ID" data-placeholder="这里输入班级类型">
									<c:forEach var="item" items="${grades}">
										<option value="${item.ID}"  <c:if test="${pd.GRADE_ID==item.ID}">selected="true"</c:if>>${item.NAME}</option>
									</c:forEach>
								</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">科目:</td>
								<td>
								<%-- <input type="number" name="SUBJECT_ID" id="SUBJECT_ID" value="${pd.SUBJECT_ID}" maxlength="32" placeholder="这里输入科目" title="科目" style="width:98%;"/></td> --%>
								<select class="chosen-select form-control" name="SUBJECT_ID" id="SUBJECT_ID" data-placeholder="这里输入班级类型">
									<c:forEach var="item" items="${subjects}">
										<option value="${item.ID}"  <c:if test="${pd.SUBJECT_ID==item.ID}">selected="true"</c:if>>${item.CNAME}</option>
									</c:forEach>
								</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">学期:</td>
								<td>
								<select class="chosen-select form-control" name="TERM_ID" id="TERM_ID" data-placeholder="学期">
									<c:forEach var="item" items="${terms}">
										<option value="${item.TERM_ID}"  <c:if test="${pd.TERM_ID==item.TERM_ID}">selected="true"</c:if>>${item.NAME}</option>
									</c:forEach>
								</select>
								</td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
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
			if($("#TEACHER_ID").val()==""){
				$("#TEACHER_ID").tips({
					side:3,
		            msg:'请输入老师',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TEACHER_ID").focus();
			return false;
			}
			if($("#CLASS_ID").val()==""){
				$("#CLASS_ID").tips({
					side:3,
		            msg:'请输入班级ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CLASS_ID").focus();
			return false;
			}
			if($("#SUBJECT_ID").val()==""){
				$("#SUBJECT_ID").tips({
					side:3,
		            msg:'请输入科目',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUBJECT_ID").focus();
			return false;
			}
			if($("#START_DATE").val()==""){
				$("#START_DATE").tips({
					side:3,
		            msg:'请输入开始时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#START_DATE").focus();
			return false;
			}
			if($("#END_DATE").val()==""){
				$("#END_DATE").tips({
					side:3,
		            msg:'请输入结束时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#END_DATE").focus();
			return false;
			}
			if($("#REMARK").val()==""){
				$("#REMARK").tips({
					side:3,
		            msg:'请输入备注',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REMARK").focus();
			return false;
			}
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