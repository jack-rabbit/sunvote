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
					
					<form action="studenthomework/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="STUDENTHOMEWORK_ID" id="STUDENTHOMEWORK_ID" value="${pd.STUDENTHOMEWORK_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">学生代码:</td>
								<td><input type="text" name="CODE" id="CODE" value="${pd.CODE}" maxlength="255" placeholder="这里输入学生代码" title="学生代码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">学生ID:</td>
								<td><input type="text" name="STUDENT_ID" id="STUDENT_ID" value="${pd.STUDENT_ID}" maxlength="255" placeholder="这里输入学生ID" title="学生ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">学生姓名:</td>
								<td><input type="text" name="STUDENT_NAME" id="STUDENT_NAME" value="${pd.STUDENT_NAME}" maxlength="255" placeholder="这里输入学生姓名" title="学生姓名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">作业ID:</td>
								<td><input type="text" name="HOMEWORK_ID" id="HOMEWORK_ID" value="${pd.HOMEWORK_ID}" maxlength="255" placeholder="这里输入作业ID" title="作业ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">作业名称:</td>
								<td><input type="text" name="HOMEWORK_NAME" id="HOMEWORK_NAME" value="${pd.HOMEWORK_NAME}" maxlength="255" placeholder="这里输入作业名称" title="作业名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">科目ID:</td>
								<td><input type="text" name="SUBJECT_ID" id="SUBJECT_ID" value="${pd.SUBJECT_ID}" maxlength="255" placeholder="这里输入科目ID" title="科目ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">班级ID:</td>
								<td><input type="text" name="CLASS_ID" id="CLASS_ID" value="${pd.CLASS_ID}" maxlength="255" placeholder="这里输入班级ID" title="班级ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">教师ID:</td>
								<td><input type="text" name="TEACHER_ID" id="TEACHER_ID" value="${pd.TEACHER_ID}" maxlength="255" placeholder="这里输入教师ID" title="教师ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">教师姓名:</td>
								<td><input type="text" name="TEACHER_NAME" id="TEACHER_NAME" value="${pd.TEACHER_NAME}" maxlength="255" placeholder="这里输入教师姓名" title="教师姓名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">得分:</td>
								<td><input type="number" name="SCORE" id="SCORE" value="${pd.SCORE}" maxlength="32" placeholder="这里输入得分" title="得分" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">创建时间:</td>
								<td><input type="text" name="CREATE_DATE" id="CREATE_DATE" value="${pd.CREATE_DATE}" maxlength="255" placeholder="这里输入创建时间" title="创建时间" style="width:98%;"/></td>
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
			if($("#CODE").val()==""){
				$("#CODE").tips({
					side:3,
		            msg:'请输入学生代码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CODE").focus();
			return false;
			}
			if($("#STUDENT_ID").val()==""){
				$("#STUDENT_ID").tips({
					side:3,
		            msg:'请输入学生ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STUDENT_ID").focus();
			return false;
			}
			if($("#STUDENT_NAME").val()==""){
				$("#STUDENT_NAME").tips({
					side:3,
		            msg:'请输入学生姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STUDENT_NAME").focus();
			return false;
			}
			if($("#HOMEWORK_ID").val()==""){
				$("#HOMEWORK_ID").tips({
					side:3,
		            msg:'请输入作业ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#HOMEWORK_ID").focus();
			return false;
			}
			if($("#HOMEWORK_NAME").val()==""){
				$("#HOMEWORK_NAME").tips({
					side:3,
		            msg:'请输入作业名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#HOMEWORK_NAME").focus();
			return false;
			}
			if($("#SUBJECT_ID").val()==""){
				$("#SUBJECT_ID").tips({
					side:3,
		            msg:'请输入科目ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUBJECT_ID").focus();
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
			if($("#TEACHER_ID").val()==""){
				$("#TEACHER_ID").tips({
					side:3,
		            msg:'请输入教师ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TEACHER_ID").focus();
			return false;
			}
			if($("#TEACHER_NAME").val()==""){
				$("#TEACHER_NAME").tips({
					side:3,
		            msg:'请输入教师姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TEACHER_NAME").focus();
			return false;
			}
			if($("#SCORE").val()==""){
				$("#SCORE").tips({
					side:3,
		            msg:'请输入得分',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SCORE").focus();
			return false;
			}
			if($("#CREATE_DATE").val()==""){
				$("#CREATE_DATE").tips({
					side:3,
		            msg:'请输入创建时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATE_DATE").focus();
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