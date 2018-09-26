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
					
					<form action="schooladmin/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="SCHOOLADMIN_ID" id="SCHOOLADMIN_ID" value="${pd.SCHOOLADMIN_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">学校:</td>
								<td>
									<select class="chosen-select form-control" name="SCHOOL_ID" id="SCHOOL_ID" data-placeholder="这里输入所属学校">
									<c:forEach var="item" items="${schools}">
										<option value="${item.ID}"  <c:if test="${pd.SCHOOL_ID==item.ID}">selected="true"</c:if>>${item.NAME}</option>
									</c:forEach>
								</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">管理员账号:</td>
								<td><input type="text" name="ACCOUT" id="ACCOUT" value="${pd.ACCOUT}" maxlength="255" placeholder="这里输入管理员账号" title="管理员账号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">管理员密码:</td>
								<td><input type="text" name="PASSWORD" id="PASSWORD" value="" maxlength="255" placeholder="这里输入管理员密码" title="管理员密码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">管理员姓名:</td>
								<td><input type="text" name="ROLE" id="ROLE" value="${pd.ROLE}" maxlength="255" placeholder="这里输入管理员角色" title="管理员角色" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">管理员备注:</td>
								<td><input type="text" name="REMARK" id="REMARK" value="${pd.REMARK}" maxlength="255" placeholder="这里输入管理员备注" title="管理员备注" style="width:98%;"/></td>
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
			if($("#SCHOOL_ID").val()==""){
				$("#SCHOOL_ID").tips({
					side:3,
		            msg:'请输入学校ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SCHOOL_ID").focus();
			return false;
			}
			if($("#ACCOUT").val()==""){
				$("#ACCOUT").tips({
					side:3,
		            msg:'请输入管理员账号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ACCOUT").focus();
			return false;
			}
			if($("#PASSWORD").val()==""){
				$("#PASSWORD").tips({
					side:3,
		            msg:'请输入管理员密码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PASSWORD").focus();
			return false;
			}
			if($("#ROLE").val()==""){
				$("#ROLE").tips({
					side:3,
		            msg:'请输入管理员角色',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ROLE").focus();
			return false;
			}
			if($("#REMARK").val()==""){
				$("#REMARK").tips({
					side:3,
		            msg:'请输入管理员备注',
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