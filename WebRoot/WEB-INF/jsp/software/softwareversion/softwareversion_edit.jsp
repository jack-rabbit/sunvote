<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="myelfun" uri="/WEB-INF/tld/elfun.tld"%>
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
					
					<form action="softwareversion/${msg }.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
						<input type="hidden" name="SOFTWAREVERSION_ID" id="SOFTWAREVERSION_ID" value="${pd.SOFTWAREVERSION_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">软件名称:</td>
								<td>
									<select class="chosen-select form-control" name="SOFTWARE_ID" id="SOFTWARE_ID" data-placeholder="软件">
										<c:forEach var="item" items="${softwares}">
											<option value="${item.SOFTWARE_ID}"  <c:if test="${pd.SOFTWARE_ID==item.SOFTWARE_ID}">selected="true"</c:if>>${item.NAME}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">版本名称:</td>
								<td><input type="text" name="VERSION_NAME" id="VERSION_NAME" value="${pd.VERSION_NAME}" maxlength="255" placeholder="输入版本信息，用作版本显示的标志" title="版本名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">版本代号:</td>
								<td><input type="text" name="VERSION_CODE" id="VERSION_CODE" value="${pd.VERSION_CODE}" maxlength="255" placeholder="输入版本代码，用作版本更新的依据" title="版本代号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">文件:</td>
								<td><input type="file" name="VERSION_PATH"   style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">版本描述:</td>
								<td><input type="text" name="VERSION_DESC" id="VERSION_DESC" value="${pd.VERSION_DESC}" maxlength="255" placeholder="该版本更新的功能，用作选择是否更新的依据" title="更新描述" style="width:98%;"/></td>
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
			if($("#SOFTWARE_ID").val()==""){
				$("#SOFTWARE_ID").tips({
					side:3,
		            msg:'请输入软件名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SOFTWARE_ID").focus();
			return false;
			}
			if($("#VERSION_NAME").val()==""){
				$("#VERSION_NAME").tips({
					side:3,
		            msg:'请输入版本名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#VERSION_NAME").focus();
			return false;
			}
			if($("#VERSION_CODE").val()==""){
				$("#VERSION_CODE").tips({
					side:3,
		            msg:'请输入版本代号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#VERSION_CODE").focus();
			return false;
			}
			/* if($("#VERSION_PATH").val()==""){
				$("#VERSION_PATH").tips({
					side:3,
		            msg:'请输入版本存放路径',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#VERSION_PATH").focus();
			return false;
			} */
			if($("#VERSION_DESC").val()==""){
				$("#VERSION_DESC").tips({
					side:3,
		            msg:'请输入更新描述',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#VERSION_DESC").focus();
			return false;
			}
			var action = document.Form.action;
			action += "?SOFTWARE_ID=" + $("#SOFTWARE_ID").val() + "&VERSION_NAME=" + $("#VERSION_NAME").val() +  "&VERSION_CODE=" + $("#VERSION_CODE").val()+  "&VERSION_DESC=" + $("#VERSION_DESC").val();
			document.Form.action = action;
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