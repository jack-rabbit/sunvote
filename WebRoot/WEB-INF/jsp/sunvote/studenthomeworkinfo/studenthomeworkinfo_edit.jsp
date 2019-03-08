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
					
					<form action="studenthomeworkinfo/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="STUDENTHOMEWORKINFO_ID" id="STUDENTHOMEWORKINFO_ID" value="${pd.STUDENTHOMEWORKINFO_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">试题ID:</td>
								<td><input type="text" name="HOMEWORK_PROBLEM_ID" id="HOMEWORK_PROBLEM_ID" value="${pd.HOMEWORK_PROBLEM_ID}" maxlength="255" placeholder="这里输入试题ID" title="试题ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">排序号:</td>
								<td><input type="text" name="RANK" id="RANK" value="${pd.RANK}" maxlength="255" placeholder="这里输入排序号" title="排序号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">作业编号:</td>
								<td><input type="text" name="CODE" id="CODE" value="${pd.CODE}" maxlength="255" placeholder="这里输入作业编号" title="作业编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">学生ID:</td>
								<td><input type="text" name="STUDENT_ID" id="STUDENT_ID" value="${pd.STUDENT_ID}" maxlength="255" placeholder="这里输入学生ID" title="学生ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">班级ID:</td>
								<td><input type="text" name="CLASS_ID" id="CLASS_ID" value="${pd.CLASS_ID}" maxlength="255" placeholder="这里输入班级ID" title="班级ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">答案:</td>
								<td><input type="text" name="ANSWER" id="ANSWER" value="${pd.ANSWER}" maxlength="255" placeholder="这里输入答案" title="答案" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否正确:</td>
								<td><input type="number" name="RIGHT" id="RIGHT" value="${pd.RIGHT}" maxlength="32" placeholder="这里输入是否正确" title="是否正确" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">作业ID:</td>
								<td><input type="text" name="HOMEWORK_ID" id="HOMEWORK_ID" value="${pd.HOMEWORK_ID}" maxlength="255" placeholder="这里输入作业ID" title="作业ID" style="width:98%;"/></td>
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
			if($("#HOMEWORK_PROBLEM_ID").val()==""){
				$("#HOMEWORK_PROBLEM_ID").tips({
					side:3,
		            msg:'请输入试题ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#HOMEWORK_PROBLEM_ID").focus();
			return false;
			}
			if($("#RANK").val()==""){
				$("#RANK").tips({
					side:3,
		            msg:'请输入排序号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RANK").focus();
			return false;
			}
			if($("#CODE").val()==""){
				$("#CODE").tips({
					side:3,
		            msg:'请输入作业编号',
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
			if($("#ANSWER").val()==""){
				$("#ANSWER").tips({
					side:3,
		            msg:'请输入答案',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ANSWER").focus();
			return false;
			}
			if($("#RIGHT").val()==""){
				$("#RIGHT").tips({
					side:3,
		            msg:'请输入是否正确',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RIGHT").focus();
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