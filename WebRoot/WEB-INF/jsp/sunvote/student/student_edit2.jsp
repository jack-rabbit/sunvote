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
					
					<form action="student/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">学生姓名:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="255" placeholder="这里输入学生姓名" title="学生姓名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">学籍号:</td>
								<td><input type="text" name="SNO" id="SNO" value="${pd.SNO}" maxlength="255" placeholder="这里输入学籍号" title="学籍号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">学号:</td>
								<td><input type="text" name="NUMBER" id="NUMBER" value="${pd.NUMBER}" maxlength="255" placeholder="这里输入学号" title="学号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">性别:</td>
								<td>
								<%-- <input type="number" name="SEX" id="SEX" value="${pd.SEX}" maxlength="32" placeholder="这里输入性别" title="性别" style="width:98%;"/></td> --%>
								<select class="chosen-select form-control" name="SEX" id="SEX" data-placeholder="这里输入班级类型">
										<option value="1"  <c:if test="${pd.SEX==1}">selected="true"</c:if>>男</option>
										<option value="0"  <c:if test="${pd.SEX==0}">selected="true"</c:if>>女</option>
								</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">组号:</td>
								<td><input type="text" name="GROUPID" id="GROUPID" value="${pd.GROUPID}" maxlength="255" placeholder="这里输入组号" title="组号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">签到码:</td>
								<td><input type="text" name="SIGN_NO" id="SIGN_NO" value="${pd.SIGN_NO}" maxlength="255" placeholder="这里输入签到码" title="签到码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">家长姓名:</td>
								<td><input type="text" name="PARENT_NAME" id="PARENT_NAME" value="${pd.PARENT_NAME}" maxlength="255" placeholder="这里输入家长姓名" title="家长姓名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">家长手机号:</td>
								<td><input type="text" name="PARENT_PHONE" id="PARENT_PHONE" value="${pd.PARENT_PHONE}" maxlength="255" placeholder="这里输入家长手机号" title="家长手机号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">键盘ID:</td>
								<td><input type="text" name="KEYPAD_ID" id="KEYPAD_ID" value="${pd.KEYPAD_ID}" maxlength="255" placeholder="这里输入键盘ID" title="键盘ID" style="width:98%;"/></td>
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
		            msg:'请输入学生姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}
			if($("#SNO").val()==""){
				$("#SNO").tips({
					side:3,
		            msg:'请输入学籍号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SNO").focus();
			return false;
			}
			if($("#NUMBER").val()==""){
				$("#NUMBER").tips({
					side:3,
		            msg:'请输入学号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NUMBER").focus();
			return false;
			}
			if($("#SEX").val()==""){
				$("#SEX").tips({
					side:3,
		            msg:'请输入性别',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SEX").focus();
			return false;
			}
			if($("#GROUPID").val()==""){
				$("#GROUPID").tips({
					side:3,
		            msg:'请输入组号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GROUPID").focus();
			return false;
			}
			if($("#SIGN_NO").val()==""){
				$("#SIGN_NO").tips({
					side:3,
		            msg:'请输入签到码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SIGN_NO").focus();
			return false;
			}
			if($("#PARENT_NAME").val()==""){
				$("#PARENT_NAME").tips({
					side:3,
		            msg:'请输入家长姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PARENT_NAME").focus();
			return false;
			}
			if($("#PARENT_PHONE").val()==""){
				$("#PARENT_PHONE").tips({
					side:3,
		            msg:'请输入家长手机号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PARENT_PHONE").focus();
			return false;
			}
			if($("#KEYPAD_ID").val()==""){
				$("#KEYPAD_ID").tips({
					side:3,
		            msg:'请输入键盘ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#KEYPAD_ID").focus();
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