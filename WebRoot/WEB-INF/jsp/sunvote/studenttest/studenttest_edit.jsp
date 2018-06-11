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
					
					<form action="studenttest/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="STUDENTTEST_ID" id="STUDENTTEST_ID" value="${pd.STUDENTTEST_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">学生ID:</td>
								<td><input type="text" name="STUDENT_ID" id="STUDENT_ID" value="${pd.STUDENT_ID}" maxlength="32" placeholder="这里输入学生ID" title="学生ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">测验ID:</td>
								<td><input type="text" name="TEST_ID" id="TEST_ID" value="${pd.TEST_ID}" maxlength="32" placeholder="这里输入测验ID" title="测验ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">试卷ID:</td>
								<td><input type="text" name="PAPER_ID" id="PAPER_ID" value="${pd.PAPER_ID}" maxlength="32" placeholder="这里输入试卷ID" title="试卷ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">得分:</td>
								<td><input type="text" name="SCORE" id="SCORE" value="${pd.SCORE}" maxlength="10" placeholder="这里输入得分" title="得分" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">班级ID:</td>
								<td><input type="text" name="CLASS_ID" id="CLASS_ID" value="${pd.CLASS_ID}" maxlength="255" placeholder="这里输入班级ID" title="班级ID" style="width:98%;"/></td>
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
			if($("#TEST_ID").val()==""){
				$("#TEST_ID").tips({
					side:3,
		            msg:'请输入测验ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TEST_ID").focus();
			return false;
			}
			if($("#PAPER_ID").val()==""){
				$("#PAPER_ID").tips({
					side:3,
		            msg:'请输入试卷ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PAPER_ID").focus();
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