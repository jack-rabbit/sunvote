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
					
					<form action="teachingmaterial/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">教材名称:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="255" placeholder="这里输入教材名称" title="教材名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">所属科目:</td>
								<td><input type="text" name="SUBJECT_ID" id="SUBJECT_ID" value="${pd.SUBJECT_ID}" maxlength="255" placeholder="这里输入所属科目" title="所属科目" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">所属年级:</td>
								<td><input type="text" name="GRADE_ID" id="GRADE_ID" value="${pd.GRADE_ID}" maxlength="255" placeholder="这里输入所属年级" title="所属年级" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">教材版本号:</td>
								<td><input type="text" name="VERSION_CODE" id="VERSION_CODE" value="${pd.VERSION_CODE}" maxlength="255" placeholder="这里输入教材版本号" title="教材版本号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">教材版本名称:</td>
								<td><input type="text" name="VERSION_NAME" id="VERSION_NAME" value="${pd.VERSION_NAME}" maxlength="255" placeholder="这里输入教材版本名称" title="教材版本名称" style="width:98%;"/></td>
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
		            msg:'请输入教材名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}
			if($("#SUBJECT_ID").val()==""){
				$("#SUBJECT_ID").tips({
					side:3,
		            msg:'请输入所属科目',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUBJECT_ID").focus();
			return false;
			}
			if($("#GRADE_ID").val()==""){
				$("#GRADE_ID").tips({
					side:3,
		            msg:'请输入所属年级',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GRADE_ID").focus();
			return false;
			}
			if($("#VERSION_CODE").val()==""){
				$("#VERSION_CODE").tips({
					side:3,
		            msg:'请输入教材版本号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#VERSION_CODE").focus();
			return false;
			}
			if($("#VERSION_NAME").val()==""){
				$("#VERSION_NAME").tips({
					side:3,
		            msg:'请输入教材版本名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#VERSION_NAME").focus();
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