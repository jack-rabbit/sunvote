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
					
					<form action="networkstatistics/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="NETWORKSTATISTICS_ID" id="NETWORKSTATISTICS_ID" value="${pd.NETWORKSTATISTICS_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">客户端ID:</td>
								<td><input type="text" name="CLIENT_ID" id="CLIENT_ID" value="${pd.CLIENT_ID}" maxlength="255" placeholder="这里输入客户端ID" title="客户端ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">客户端IP:</td>
								<td><input type="text" name="CLIENT_IP" id="CLIENT_IP" value="${pd.CLIENT_IP}" maxlength="255" placeholder="这里输入客户端IP" title="客户端IP" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">成功次数:</td>
								<td><input type="text" name="SUCCESS_COUNT" id="SUCCESS_COUNT" value="${pd.SUCCESS_COUNT}" maxlength="255" placeholder="这里输入成功次数" title="成功次数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">失败次数:</td>
								<td><input type="text" name="FAIL_COUNT" id="FAIL_COUNT" value="${pd.FAIL_COUNT}" maxlength="255" placeholder="这里输入失败次数" title="失败次数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">会话:</td>
								<td><input type="text" name="SESSION_ID" id="SESSION_ID" value="${pd.SESSION_ID}" maxlength="255" placeholder="这里输入会话" title="会话" style="width:98%;"/></td>
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
			if($("#CLIENT_ID").val()==""){
				$("#CLIENT_ID").tips({
					side:3,
		            msg:'请输入客户端ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CLIENT_ID").focus();
			return false;
			}
			if($("#CLIENT_IP").val()==""){
				$("#CLIENT_IP").tips({
					side:3,
		            msg:'请输入客户端IP',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CLIENT_IP").focus();
			return false;
			}
			if($("#SUCCESS_COUNT").val()==""){
				$("#SUCCESS_COUNT").tips({
					side:3,
		            msg:'请输入成功次数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUCCESS_COUNT").focus();
			return false;
			}
			if($("#FAIL_COUNT").val()==""){
				$("#FAIL_COUNT").tips({
					side:3,
		            msg:'请输入失败次数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FAIL_COUNT").focus();
			return false;
			}
			if($("#SESSION_ID").val()==""){
				$("#SESSION_ID").tips({
					side:3,
		            msg:'请输入会话',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SESSION_ID").focus();
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