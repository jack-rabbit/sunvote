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
					
					<form action="feedback/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">学校地址省:</td>
								<td><input type="text" name="SCHOOL_ADDRESS1" id="SCHOOL_ADDRESS1" value="${pd.SCHOOL_ADDRESS1}" maxlength="255" placeholder="这里输入学校地址省" title="学校地址省" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">学校地址市:</td>
								<td><input type="text" name="SCHOOL_ADDRESS2" id="SCHOOL_ADDRESS2" value="${pd.SCHOOL_ADDRESS2}" maxlength="255" placeholder="这里输入学校地址市" title="学校地址市" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系人:</td>
								<td><input type="text" name="CONTACT_PHONE" id="CONTACT_PHONE" value="${pd.CONTACT_PHONE}" maxlength="255" placeholder="这里输入联系人" title="联系人" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系电话:</td>
								<td><input type="text" name="PHONE_CONTACT" id="PHONE_CONTACT" value="${pd.PHONE_CONTACT}" maxlength="255" placeholder="这里输入联系电话" title="联系电话" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">产品序列号:</td>
								<td><input type="text" name="PRODUCT_SEQ" id="PRODUCT_SEQ" value="${pd.PRODUCT_SEQ}" maxlength="255" placeholder="这里输入产品序列号" title="产品序列号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">问题现象:</td>
								<td><input type="text" name="QUESTION_NAME" id="QUESTION_NAME" value="${pd.QUESTION_NAME}" maxlength="255" placeholder="这里输入问题现象" title="问题现象" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">操作系统:</td>
								<td><input type="text" name="OS" id="OS" value="${pd.OS}" maxlength="255" placeholder="这里输入操作系统" title="操作系统" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">软件版本:</td>
								<td><input type="text" name="SOFTWARE_VERSION" id="SOFTWARE_VERSION" value="${pd.SOFTWARE_VERSION}" maxlength="255" placeholder="这里输入软件版本" title="软件版本" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">软件名称:</td>
								<td><input type="text" name="SOFTWARE_NAME" id="SOFTWARE_NAME" value="${pd.SOFTWARE_NAME}" maxlength="255" placeholder="这里输入软件名称" title="软件名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">异常数量:</td>
								<td><input type="text" name="EXCEPTION_NUM" id="EXCEPTION_NUM" value="${pd.EXCEPTION_NUM}" maxlength="255" placeholder="这里输入异常数量" title="异常数量" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">详细描述:</td>
								<td><input type="text" name="DESCRIPTION" id="DESCRIPTION" value="${pd.DESCRIPTION}" maxlength="255" placeholder="这里输入详细描述" title="详细描述" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">问题图片:</td>
								<td><input type="text" name="PROBLEM_PATH" id="PROBLEM_PATH" value="${pd.PROBLEM_PATH}" maxlength="255" placeholder="这里输入问题图片" title="问题图片" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">客户编码:</td>
								<td><input type="text" name="CUSTOMER_CODE" id="CUSTOMER_CODE" value="${pd.CUSTOMER_CODE}" maxlength="255" placeholder="这里输入客户编码" title="客户编码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">处理人:</td>
								<td><input type="text" name="PERSON_LIABLE" id="PERSON_LIABLE" value="${pd.PERSON_LIABLE}" maxlength="255" placeholder="这里输入处理人" title="处理人" style="width:98%;"/></td>
							</tr>
							<tr style="display:none">
								<td style="width:75px;text-align: right;padding-top: 13px;">报告日期:</td>
								<td><input class="span10 date-picker" name="CREATE_DATE" id="CREATE_DATE" value="${pd.CREATE_DATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="报告日期" title="报告日期" style="width:98%;"/></td>
							</tr>
							<tr style="display:none">
								<td style="width:75px;text-align: right;padding-top: 13px;">处理时间:</td>
								<td><input class="span10 date-picker" name="PROCESSING_DATE" id="PROCESSING_DATE" value="${pd.PROCESSING_DATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="处理时间" title="处理时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">产品类型:</td>
								<td><input type="text" name="PRODUCT_TYPE" id="PRODUCT_TYPE" value="${pd.PRODUCT_TYPE}" maxlength="255" placeholder="这里输入产品类型" title="产品类型" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">产品型号:</td>
								<td><input type="text" name="PRODUCT_MODEL" id="PRODUCT_MODEL" value="${pd.PRODUCT_MODEL}" maxlength="255" placeholder="这里输入产品型号" title="产品型号" style="width:98%;"/></td>
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