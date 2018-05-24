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
					
					<form action="paperquestion/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="PAPERQUESTION_ID" id="PAPERQUESTION_ID" value="${pd.PAPERQUESTION_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">试卷:</td>
								<td><input type="text" name="PAPER_ID" id="PAPER_ID" value="${pd.PAPER_ID}" maxlength="255" placeholder="这里输入试卷" title="试卷" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">题目:</td>
								<td><input type="text" name="QUESTION_ID" id="QUESTION_ID" value="${pd.QUESTION_ID}" maxlength="255" placeholder="这里输入题目" title="题目" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">分值:</td>
								<td><input type="number" name="SCORE" id="SCORE" value="${pd.SCORE}" maxlength="32" placeholder="这里输入分值" title="分值" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">部分分:</td>
								<td><input type="text" name="PART_SCORE" id="PART_SCORE" value="${pd.PART_SCORE}" maxlength="255" placeholder="这里输入部分分" title="部分分" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">排序编号:</td>
								<td><input type="text" name="RANK" id="RANK" value="${pd.RANK}" maxlength="255" placeholder="这里输入排序编号" title="排序编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">题号:</td>
								<td><input type="text" name="NO_NAME" id="NO_NAME" value="${pd.NO_NAME}" maxlength="255" placeholder="这里输入题号" title="题号" style="width:98%;"/></td>
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
			if($("#PAPER_ID").val()==""){
				$("#PAPER_ID").tips({
					side:3,
		            msg:'请输入试卷',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PAPER_ID").focus();
			return false;
			}
			if($("#QUESTION_ID").val()==""){
				$("#QUESTION_ID").tips({
					side:3,
		            msg:'请输入题目',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#QUESTION_ID").focus();
			return false;
			}
			if($("#SCORE").val()==""){
				$("#SCORE").tips({
					side:3,
		            msg:'请输入分值',
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
			if($("#RANK").val()==""){
				$("#RANK").tips({
					side:3,
		            msg:'请输入排序编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RANK").focus();
			return false;
			}
			if($("#NO_NAME").val()==""){
				$("#NO_NAME").tips({
					side:3,
		            msg:'请输入题号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NO_NAME").focus();
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