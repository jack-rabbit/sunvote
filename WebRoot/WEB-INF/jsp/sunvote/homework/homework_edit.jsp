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
					
					<form action="homework/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="HOMEWORK_ID" id="HOMEWORK_ID" value="${pd.HOMEWORK_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">作业代码:</td>
								<td><input type="text" name="CODE" id="CODE" value="${pd.CODE}" maxlength="255" placeholder="这里输入作业代码" title="作业代码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">作业名称:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="255" placeholder="这里输入作业名称" title="作业名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">科目ID:</td>
								<td><input type="text" name="SUBJECT_ID" id="SUBJECT_ID" value="${pd.SUBJECT_ID}" maxlength="100" placeholder="这里输入科目ID" title="科目ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">班级ID:</td>
								<td><input type="text" name="CLASS_ID" id="CLASS_ID" value="${pd.CLASS_ID}" maxlength="100" placeholder="这里输入班级ID" title="班级ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">年级ID:</td>
								<td><input type="text" name="GRADE_ID" id="GRADE_ID" value="${pd.GRADE_ID}" maxlength="100" placeholder="这里输入年级ID" title="年级ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">学校ID:</td>
								<td><input type="text" name="SCHOOL_ID" id="SCHOOL_ID" value="${pd.SCHOOL_ID}" maxlength="100" placeholder="这里输入学校ID" title="学校ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">需要完成时间:</td>
								<td><input class="span10 date-picker" name="COMPLETE_DATE" id="COMPLETE_DATE" value="${pd.COMPLETE_DATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="需要完成时间" title="需要完成时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">创建时间:</td>
								<td><input class="span10 date-picker" name="CREATE_DATE" id="CREATE_DATE" value="${pd.CREATE_DATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="创建时间" title="创建时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">修改时间:</td>
								<td><input class="span10 date-picker" name="MODIFY_DATE" id="MODIFY_DATE" value="${pd.MODIFY_DATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="修改时间" title="修改时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">完成次数:</td>
								<td><input type="number" name="COMPLETE_COUNT" id="COMPLETE_COUNT" value="${pd.COMPLETE_COUNT}" maxlength="32" placeholder="这里输入完成次数" title="完成次数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">总分:</td>
								<td><input type="number" name="ALL_SCORE" id="ALL_SCORE" value="${pd.ALL_SCORE}" maxlength="32" placeholder="这里输入总分" title="总分" style="width:98%;"/></td>
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
			if($("#CODE").val()==""){
				$("#CODE").tips({
					side:3,
		            msg:'请输入作业代码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CODE").focus();
			return false;
			}
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入作业名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}
			if($("#SUBJECT_ID").val()==""){
				$("#SUBJECT_ID").tips({
					side:3,
		            msg:'请输入科目ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUBJECT_ID").focus();
			return false;
			}
			if($("#CLASS_ID").val()==""){
				$("#CLASS_ID").tips({
					side:3,
		            msg:'请输入班级ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CLASS_ID").focus();
			return false;
			}
			if($("#GRADE_ID").val()==""){
				$("#GRADE_ID").tips({
					side:3,
		            msg:'请输入年级ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GRADE_ID").focus();
			return false;
			}
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
			if($("#COMPLETE_DATE").val()==""){
				$("#COMPLETE_DATE").tips({
					side:3,
		            msg:'请输入需要完成时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#COMPLETE_DATE").focus();
			return false;
			}
			if($("#CREATE_DATE").val()==""){
				$("#CREATE_DATE").tips({
					side:3,
		            msg:'请输入创建时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATE_DATE").focus();
			return false;
			}
			if($("#MODIFY_DATE").val()==""){
				$("#MODIFY_DATE").tips({
					side:3,
		            msg:'请输入修改时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MODIFY_DATE").focus();
			return false;
			}
			if($("#COMPLETE_COUNT").val()==""){
				$("#COMPLETE_COUNT").tips({
					side:3,
		            msg:'请输入完成次数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#COMPLETE_COUNT").focus();
			return false;
			}
			if($("#ALL_SCORE").val()==""){
				$("#ALL_SCORE").tips({
					side:3,
		            msg:'请输入总分',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ALL_SCORE").focus();
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