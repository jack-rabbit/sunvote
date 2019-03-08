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
					
					<form action="homeworkproblem/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="HOMEWORKPROBLEM_ID" id="HOMEWORKPROBLEM_ID" value="${pd.HOMEWORKPROBLEM_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">作业编号:</td>
								<td><input type="text" name="CODE" id="CODE" value="${pd.CODE}" maxlength="255" placeholder="这里输入作业编号" title="作业编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">排序号:</td>
								<td><input type="number" name="RANK" id="RANK" value="${pd.RANK}" maxlength="32" placeholder="这里输入排序号" title="排序号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">父题ID:</td>
								<td><input type="text" name="P_HOMEWORK_PROBLEM_ID" id="P_HOMEWORK_PROBLEM_ID" value="${pd.P_HOMEWORK_PROBLEM_ID}" maxlength="255" placeholder="这里输入父题ID" title="父题ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">题目名称:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="255" placeholder="这里输入题目名称" title="题目名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">题目类型:</td>
								<td><input type="number" name="TYPE" id="TYPE" value="${pd.TYPE}" maxlength="32" placeholder="这里输入题目类型" title="题目类型" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">答案个数:</td>
								<td><input type="number" name="OPTION_NUM" id="OPTION_NUM" value="${pd.OPTION_NUM}" maxlength="32" placeholder="这里输入答案个数" title="答案个数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">标准答案:</td>
								<td><input type="text" name="RIGHT_ANSWER" id="RIGHT_ANSWER" value="${pd.RIGHT_ANSWER}" maxlength="255" placeholder="这里输入标准答案" title="标准答案" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">分数:</td>
								<td><input type="number" name="SCORE" id="SCORE" value="${pd.SCORE}" maxlength="32" placeholder="这里输入分数" title="分数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">部分分:</td>
								<td><input type="number" name="PART_SCORE" id="PART_SCORE" value="${pd.PART_SCORE}" maxlength="32" placeholder="这里输入部分分" title="部分分" style="width:98%;"/></td>
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
		            msg:'请输入作业编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CODE").focus();
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
			if($("#P_HOMEWORK_PROBLEM_ID").val()==""){
				$("#P_HOMEWORK_PROBLEM_ID").tips({
					side:3,
		            msg:'请输入父题ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#P_HOMEWORK_PROBLEM_ID").focus();
			return false;
			}
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入题目名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}
			if($("#TYPE").val()==""){
				$("#TYPE").tips({
					side:3,
		            msg:'请输入题目类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TYPE").focus();
			return false;
			}
			if($("#OPTION_NUM").val()==""){
				$("#OPTION_NUM").tips({
					side:3,
		            msg:'请输入答案个数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OPTION_NUM").focus();
			return false;
			}
			if($("#RIGHT_ANSWER").val()==""){
				$("#RIGHT_ANSWER").tips({
					side:3,
		            msg:'请输入标准答案',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RIGHT_ANSWER").focus();
			return false;
			}
			if($("#SCORE").val()==""){
				$("#SCORE").tips({
					side:3,
		            msg:'请输入分数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SCORE").focus();
			return false;
			}
			if($("#PART_SCORE").val()==""){
				$("#PART_SCORE").tips({
					side:3,
		            msg:'请输入部分分',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PART_SCORE").focus();
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