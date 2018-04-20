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
					
					<form action="keypad/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">编号:</td>
								<td><input type="text" name="NO" id="NO" value="${pd.NO}" maxlength="255" placeholder="这里输入编号" title="编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">SN号:</td>
								<td><input type="text" name="SN" id="SN" value="${pd.SN}" maxlength="255" placeholder="这里输入SN号" title="SN号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否正常:</td>
								<td><input type="number" name="IS_OK" id="IS_OK" value="${pd.IS_OK}" maxlength="32" placeholder="这里输入是否正常" title="是否正常" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">工作模式:</td>
								<td><input type="number" name="WORK_MODE" id="WORK_MODE" value="${pd.WORK_MODE}" maxlength="32" placeholder="这里输入工作模式" title="工作模式" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">生产时间:</td>
								<td><input class="span10 date-picker" name="PRODUCT_DATE" id="PRODUCT_DATE" value="${pd.PRODUCT_DATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="生产时间" title="生产时间" style="width:98%;"/></td>
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
			if($("#NO").val()==""){
				$("#NO").tips({
					side:3,
		            msg:'请输入编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NO").focus();
			return false;
			}
			if($("#SN").val()==""){
				$("#SN").tips({
					side:3,
		            msg:'请输入SN号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SN").focus();
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
			if($("#PRODUCT_DATE").val()==""){
				$("#PRODUCT_DATE").tips({
					side:3,
		            msg:'请输入生产时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PRODUCT_DATE").focus();
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