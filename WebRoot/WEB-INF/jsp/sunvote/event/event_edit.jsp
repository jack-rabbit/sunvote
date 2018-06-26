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
					
					<form action="event/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="EVENT_ID" id="EVENT_ID" value="${pd.EVENT_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">时间名称:</td>
								<td><input type="text" name="EVENT_NAME" id="EVENT_NAME" value="${pd.EVENT_NAME}" maxlength="255" placeholder="这里输入时间名称" title="时间名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">事件人:</td>
								<td><input type="text" name="EVENT_USER" id="EVENT_USER" value="${pd.EVENT_USER}" maxlength="255" placeholder="这里输入事件人" title="事件人" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">事件类型:</td>
								<td><input type="text" name="EVENT_TYPE" id="EVENT_TYPE" value="${pd.EVENT_TYPE}" maxlength="255" placeholder="这里输入事件类型" title="事件类型" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">事件起始时间:</td>
								<td><input type="text" name="EVENT_START_TIME" id="EVENT_START_TIME" value="${pd.EVENT_START_TIME}" maxlength="255" placeholder="这里输入事件起始时间" title="事件起始时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">事件结束时间:</td>
								<td><input type="text" name="EVENT_STOP_TIME" id="EVENT_STOP_TIME" value="${pd.EVENT_STOP_TIME}" maxlength="255" placeholder="这里输入事件结束时间" title="事件结束时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">客户ID:</td>
								<td><input type="text" name="CLIENT_ID" id="CLIENT_ID" value="${pd.CLIENT_ID}" maxlength="255" placeholder="这里输入客户ID" title="客户ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">IP:</td>
								<td><input type="text" name="EVENT_IP" id="EVENT_IP" value="${pd.EVENT_IP}" maxlength="255" placeholder="这里输入IP" title="IP" style="width:98%;"/></td>
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
			if($("#EVENT_NAME").val()==""){
				$("#EVENT_NAME").tips({
					side:3,
		            msg:'请输入时间名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EVENT_NAME").focus();
			return false;
			}
			if($("#EVENT_USER").val()==""){
				$("#EVENT_USER").tips({
					side:3,
		            msg:'请输入事件人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EVENT_USER").focus();
			return false;
			}
			if($("#EVENT_TYPE").val()==""){
				$("#EVENT_TYPE").tips({
					side:3,
		            msg:'请输入事件类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EVENT_TYPE").focus();
			return false;
			}
			if($("#EVENT_START_TIME").val()==""){
				$("#EVENT_START_TIME").tips({
					side:3,
		            msg:'请输入事件起始时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EVENT_START_TIME").focus();
			return false;
			}
			if($("#EVENT_STOP_TIME").val()==""){
				$("#EVENT_STOP_TIME").tips({
					side:3,
		            msg:'请输入事件结束时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EVENT_STOP_TIME").focus();
			return false;
			}
			if($("#CLIENT_ID").val()==""){
				$("#CLIENT_ID").tips({
					side:3,
		            msg:'请输入客户ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CLIENT_ID").focus();
			return false;
			}
			if($("#EVENT_IP").val()==""){
				$("#EVENT_IP").tips({
					side:3,
		            msg:'请输入IP',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EVENT_IP").focus();
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