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
					
					<form action="testpaper/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="TESTPAPER_ID" id="TESTPAPER_ID" value="${pd.TESTPAPER_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">测验名称:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="255" placeholder="这里输入测验名称" title="测验名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">试卷:</td>
								<td><input type="text" name="PAPER_ID" id="PAPER_ID" value="${pd.PAPER_ID}" maxlength="255" placeholder="这里输入试卷" title="试卷" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">班级:</td>
								<td><input type="text" name="SCLASS_ID" id="SCLASS_ID" value="${pd.SCLASS_ID}" maxlength="255" placeholder="这里输入班级" title="班级" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">老师:</td>
								<td><input type="text" name="TEACHER_ID" id="TEACHER_ID" value="${pd.TEACHER_ID}" maxlength="255" placeholder="这里输入老师" title="老师" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">开始时间:</td>
								<td><input class="span10 date-picker" name="START_DATE" id="START_DATE" value="${pd.START_DATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="开始时间" title="开始时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">结束时间:</td>
								<td><input class="span10 date-picker" name="END_DATE" id="END_DATE" value="${pd.END_DATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="结束时间" title="结束时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">创建时间:</td>
								<td><input class="span10 date-picker" name="CREATE_DATE" id="CREATE_DATE" value="${pd.CREATE_DATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="创建时间" title="创建时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">主观题分值:</td>
								<td><input type="number" name="OTHER_SCORE" id="OTHER_SCORE" value="${pd.OTHER_SCORE}" maxlength="32" placeholder="这里输入主观题分值" title="主观题分值" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">测验最高分:</td>
								<td><input type="number" name="HIGHT_SCORE" id="HIGHT_SCORE" value="${pd.HIGHT_SCORE}" maxlength="32" placeholder="这里输入测验最高分" title="测验最高分" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">最低分:</td>
								<td><input type="number" name="LOW_SCORE" id="LOW_SCORE" value="${pd.LOW_SCORE}" maxlength="32" placeholder="这里输入最低分" title="最低分" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">平均分:</td>
								<td><input type="number" name="AVG_SCORE" id="AVG_SCORE" value="${pd.AVG_SCORE}" maxlength="32" placeholder="这里输入平均分" title="平均分" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注:</td>
								<td><input type="text" name="REMARK" id="REMARK" value="${pd.REMARK}" maxlength="255" placeholder="这里输入备注" title="备注" style="width:98%;"/></td>
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
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入测验名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}
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
			if($("#SCLASS_ID").val()==""){
				$("#SCLASS_ID").tips({
					side:3,
		            msg:'请输入班级',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SCLASS_ID").focus();
			return false;
			}
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
			if($("#OTHER_SCORE").val()==""){
				$("#OTHER_SCORE").tips({
					side:3,
		            msg:'请输入主观题分值',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OTHER_SCORE").focus();
			return false;
			}
			if($("#HIGHT_SCORE").val()==""){
				$("#HIGHT_SCORE").tips({
					side:3,
		            msg:'请输入测验最高分',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#HIGHT_SCORE").focus();
			return false;
			}
			if($("#LOW_SCORE").val()==""){
				$("#LOW_SCORE").tips({
					side:3,
		            msg:'请输入最低分',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LOW_SCORE").focus();
			return false;
			}
			if($("#AVG_SCORE").val()==""){
				$("#AVG_SCORE").tips({
					side:3,
		            msg:'请输入平均分',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#AVG_SCORE").focus();
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