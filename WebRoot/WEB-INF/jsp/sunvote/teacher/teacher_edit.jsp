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
					
					<form action="teacher/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">所在学校:</td>
								<td>
								<select class="chosen-select form-control" name="SCHOOL_ID" id="SCHOOL_ID" data-placeholder="这里输入所属学校">
									<c:forEach var="item" items="${schools}">
										<option value="${item.ID}"  <c:if test="${pd.SCHOOL_ID==item.ID}">selected="true"</c:if>>${item.NAME}</option>
									</c:forEach>
								</select>
								</td>
								<%-- <input type="number" name="SCHOOL_ID" id="SCHOOL_ID" value="${pd.SCHOOL_ID}" maxlength="32" placeholder="这里输入所在学校" title="所在学校" style="width:98%;"/></td> --%>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">姓名:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="255" placeholder="这里输入姓名" title="姓名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">电话:</td>
								<td><input type="text" name="PHONE" id="PHONE" value="${pd.PHONE}" maxlength="255" placeholder="这里输入电话" title="电话" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">座机电话:</td>
								<td><input type="text" name="SEAT_PHONE" id="SEAT_PHONE" value="${pd.SEAT_PHONE}" maxlength="255" placeholder="这里输入座机电话" title="座机电话" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">证件号:</td>
								<td><input type="text" name="CARD_NO" id="CARD_NO" value="${pd.CARD_NO}" maxlength="255" placeholder="这里输入证件号" title="证件号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">账号:</td>
								<td><input type="text" name="ACCOUT" id="ACCOUT" value="${pd.ACCOUT}" maxlength="255" placeholder="这里输入账号" title="账号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">密码:</td>
								<td><input type="password" name="PASSWORD" id="PASSWORD" value="${pd.PASSWORD}" maxlength="255" placeholder="这里输入密码" title="密码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">性别:</td>
								<td>
								<select class="chosen-select form-control" name="SEX" id="SEX" data-placeholder="选择性别">
										<option value="1"  <c:if test="${pd.SEX==1}">selected="true"</c:if>>男</option>
										<option value="2"  <c:if test="${pd.SEX==2}">selected="true"</c:if>>女</option>
								</select>
								</td>
								<%-- <input type="number" name="SEX" id="SEX" value="${pd.SEX}" maxlength="32" placeholder="这里输入性别" title="性别" style="width:98%;"/></td> --%>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">科目列表:</td>
								<td><input type="text" name="SUBJECT_IDS" id="SUBJECT_IDS" value="${pd.SUBJECT_IDS}" maxlength="255" placeholder="这里输入科目列表" title="科目列表" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">教师卡编号:</td>
								<td><input type="text" name="KEYPAD_ID" id="KEYPAD_ID" value="${pd.KEYPAD_ID}" maxlength="255" placeholder="这里输入教师卡编号" title="教师卡编号" style="width:98%;"/></td>
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
		            msg:'请输入所在学校',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SCHOOL_ID").focus();
			return false;
			}
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}
			if($("#PHONE").val()==""){
				$("#PHONE").tips({
					side:3,
		            msg:'请输入电话',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PHONE").focus();
			return false;
			}
			if($("#SEAT_PHONE").val()==""){
				$("#SEAT_PHONE").tips({
					side:3,
		            msg:'请输入座机电话',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SEAT_PHONE").focus();
			return false;
			}
			if($("#CARD_NO").val()==""){
				$("#CARD_NO").tips({
					side:3,
		            msg:'请输入证件号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CARD_NO").focus();
			return false;
			}
			if($("#ACCOUT").val()==""){
				$("#ACCOUT").tips({
					side:3,
		            msg:'请输入账号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ACCOUT").focus();
			return false;
			}
			if($("#PASSWORD").val()==""){
				$("#PASSWORD").tips({
					side:3,
		            msg:'请输入密码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PASSWORD").focus();
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
			if($("#SUBJECT_IDS").val()==""){
				$("#SUBJECT_IDS").tips({
					side:3,
		            msg:'请输入科目列表',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUBJECT_IDS").focus();
			return false;
			}
			if($("#KEYPAD_ID").val()==""){
				$("#KEYPAD_ID").tips({
					side:3,
		            msg:'请输入教师卡编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#KEYPAD_ID").focus();
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