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
	
	
	<link rel="stylesheet" href="static/css/edit.css" />
	<style>
		.subject_body_tabel{border-collapse: separate;border-spacing:0 10px;}
		.subject_body_tabel td{border:1px solid #000;}
		.subject_body_tabel .first{border-right:0;}
		.subject_body_tabel .middle{border-left:0;border-right:0;}
		.subject_body_tabel .last{border-left:0;}
		
	</style>
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
						<table id="table_report" class="table">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">练习标题</td>
								<td><input type="text" name="CODE" id="CODE" value="${pd.CODE}" maxlength="255" placeholder="输入练习标题，不超过20个汉字" title="作业代码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">练习说明</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="255" placeholder="输入题目说明，如教材第12页1-5题，教辅第5页1-3题，尽量精简，不超过100个汉字" title="作业名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">指定班级完成时间</td>
								<td>
									<div class="classBox">
										<ul>
											<li><input type="radio" name="className" value="1" checked="true" /> 1班 <input class="date-picker" type="text" placeholder="完成日期" name="lastStart" id="lastStart" data-date-format="yyyy-mm-dd" readonly="readonly" value=""/></li>
											<li><input type="radio" name="className" value="1" /> 2班 <input class="date-picker" type="text" placeholder="完成日期" name="lastStart" id="lastStart" data-date-format="yyyy-mm-dd" readonly="readonly" value=""/></li>
											<li><input type="radio" name="className" value="1" /> 3班 <input class="date-picker" type="text" placeholder="完成日期" name="lastStart" id="lastStart" data-date-format="yyyy-mm-dd" readonly="readonly" value=""/></li>
										</ul>
									</div>
								
								</td>
							</tr>
							
						</table>
						</div>
						<hr />
						<div class="subject">
							<table  width="100%">
								<col width="50%"/>
								<col width="20%"/>
								<col width="20%"/>
								<col width="10%"/>
								<thead>
									<tr>
										<th><span>题目数量</span><input type="number" value="1"/></th>
										<th><span>选项个数</span><input type="number" value="1"/></th>
										<th><span>分值</span><input type="number" value="1"/></th>
										<th></th>
									</tr>
								</thead>
							</table>
							<table width="100%" border="0"  class="subject_body_tabel">
								<col width="10%"/>
								<col width="40%"/>
								<col width="20%"/>
								<col width="20%"/>
								<col width="10%"/>
								<tbody>									
									<tr>
										<td class="first">1</td>
										<td class="middle">1</td>
										<td class="middle"><span>选项个数</span><input type="number" value="1"/></td>
										<td class="middle"><span>分值</span><input type="number" value="1"/></td>
										<td class="last"><input type="button" value="删除"/></td>
									</tr>
									<tr>
										<td class="first">1</td>
										<td class="middle">1</td>
										<td class="middle"><span>选项个数</span><input type="number" value="1"/></td>
										<td class="middle"><span>分值</span><input type="number" value="1"/></td>
										<td class="last"><input type="button" value="删除"/></td>
									</tr>
								</tbody>
							</table>
						</div>
						<hr />
						<div>
							<div style="text-align: center;" colspan="10">
								<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
								<a class="btn btn-mini btn-danger" onclick="window.top.modal.remove();">取消</a>
							</div>
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
			$('.date-picker').datepicker({
				autoclose: true,
				todayHighlight: true
			});
		});
		</script>
</body>
</html>