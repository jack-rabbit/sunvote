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
					
					<form action="firm/${msg }.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
						<input type="hidden" name="FIRM_ID" id="FIRM_ID" value="${pd.FIRM_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">产品名称:</td>
								<td>
								<select class="chosen-select form-control" name="PRODUCT_NAME" id="PRODUCT_NAME" data-placeholder="产品名称">
									<c:forEach var="item" items="${productList}">
										<option value="${item.PRODUCT_NAME}"  <c:if test="${pd.PRODUCT_NAME==item.PRODUCT_NAME}">selected="true"</c:if>>${item.PRODUCT_NAME}</option>
									</c:forEach>
								</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">固件版本:</td>
								<td><input type="text" name="FIRM_VERSION" id="FIRM_VERSION" value="${pd.FIRM_VERSION}" maxlength="255" placeholder="这里输入固件版本" title="固件版本" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">固件版本号:</td>
								<td><input type="number" name="FRIM_CODE" id="FRIM_CODE" value="${pd.FRIM_CODE}" maxlength="32" placeholder="这里输入固件版本号" title="固件版本号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">固件路径:</td>
								<td><input type="file" name="FIRM_PATH"   style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">固件描述:</td>
								<td><input type="text" name="FIRM_DESC" id="FIRM_DESC" value="${pd.FIRM_DESC}" maxlength="255" placeholder="这里输入固件描述" title="固件描述" style="width:98%;"/></td>
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
			if($("#PRODUCT_NAME").val()==""){
				$("#PRODUCT_NAME").tips({
					side:3,
		            msg:'请输入产品名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PRODUCT_NAME").focus();
			return false;
			}
			if($("#FIRM_VERSION").val()==""){
				$("#FIRM_VERSION").tips({
					side:3,
		            msg:'请输入固件版本',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FIRM_VERSION").focus();
			return false;
			}
			if($("#FRIM_CODE").val()==""){
				$("#FRIM_CODE").tips({
					side:3,
		            msg:'请输入固件版本号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FRIM_CODE").focus();
			return false;
			}
			if($("#FIRM_PATH").val()==""){
				$("#FIRM_PATH").tips({
					side:3,
		            msg:'请输入固件路径',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FIRM_PATH").focus();
			return false;
			}
			if($("#FIRM_DESC").val()==""){
				$("#FIRM_DESC").tips({
					side:3,
		            msg:'请输入固件描述',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FIRM_DESC").focus();
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