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
					
					<form action="basestation/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="BASESTATION_ID" id="BASESTATION_ID" value="${pd.BASESTATION_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">基站名称:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="255" placeholder="这里输入基站名称" title="基站名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">基站编号:</td>
								<td><input type="text" name="NO" id="NO" value="${pd.NO}" maxlength="255" placeholder="这里输入基站编号" title="基站编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">配对码:</td>
								<td><input type="text" name="MATCH_CODE" id="MATCH_CODE" value="${pd.MATCH_CODE}" maxlength="255" placeholder="这里输入配对码" title="配对码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">键盘模式:</td>
								<td><input type="text" name="KEYPAD_MODE" id="KEYPAD_MODE" value="${pd.KEYPAD_MODE}" maxlength="255" placeholder="这里输入键盘模式" title="键盘模式" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">工作模式:</td>
								<td><input type="text" name="WORK_MODE" id="WORK_MODE" value="${pd.WORK_MODE}" maxlength="255" placeholder="这里输入工作模式" title="工作模式" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">生产时间:</td>
								<td><input type="text" name="PRODUCTION_TIME" id="PRODUCTION_TIME" value="${pd.PRODUCTION_TIME}" maxlength="255" placeholder="这里输入生产时间" title="生产时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否正常:</td>
								<td><input type="number" name="IS_OK" id="IS_OK" value="${pd.IS_OK}" maxlength="32" placeholder="这里输入是否正常" title="是否正常" style="width:98%;"/></td>
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
		            msg:'请输入基站名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}
			if($("#NO").val()==""){
				$("#NO").tips({
					side:3,
		            msg:'请输入基站编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NO").focus();
			return false;
			}
			if($("#MATCH_CODE").val()==""){
				$("#MATCH_CODE").tips({
					side:3,
		            msg:'请输入配对码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MATCH_CODE").focus();
			return false;
			}
			if($("#KEYPAD_MODE").val()==""){
				$("#KEYPAD_MODE").tips({
					side:3,
		            msg:'请输入键盘模式',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#KEYPAD_MODE").focus();
			return false;
			}
			if($("#WORK_MODE").val()==""){
				$("#WORK_MODE").tips({
					side:3,
		            msg:'请输入工作模式',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#WORK_MODE").focus();
			return false;
			}
			if($("#PRODUCTION_TIME").val()==""){
				$("#PRODUCTION_TIME").tips({
					side:3,
		            msg:'请输入生产时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PRODUCTION_TIME").focus();
			return false;
			}
			if($("#IS_OK").val()==""){
				$("#IS_OK").tips({
					side:3,
		            msg:'请输入是否正常',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IS_OK").focus();
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