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
					
					<form action="question/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="QUESTION_ID" id="QUESTION_ID" value="${pd.QUESTION_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">父ID:</td>
								<td><input type="text" name="P_ID" id="P_ID" value="${pd.P_ID}" maxlength="255" placeholder="这里输入父ID" title="父ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">所属科目:</td>
								<td><input type="text" name="SUBJECT_ID" id="SUBJECT_ID" value="${pd.SUBJECT_ID}" maxlength="255" placeholder="这里输入所属科目" title="所属科目" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">所属章节:</td>
								<td><input type="text" name="CHAPTER_ID" id="CHAPTER_ID" value="${pd.CHAPTER_ID}" maxlength="255" placeholder="这里输入所属章节" title="所属章节" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">题目类型:</td>
								<td><input type="text" name="PROBLEM_TYPE_ID" id="PROBLEM_TYPE_ID" value="${pd.PROBLEM_TYPE_ID}" maxlength="255" placeholder="这里输入题目类型" title="题目类型" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">出题老师:</td>
								<td><input type="text" name="TEACHER_ID" id="TEACHER_ID" value="${pd.TEACHER_ID}" maxlength="255" placeholder="这里输入出题老师" title="出题老师" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">所属学校:</td>
								<td><input type="text" name="SCHOOL_ID" id="SCHOOL_ID" value="${pd.SCHOOL_ID}" maxlength="255" placeholder="这里输入所属学校" title="所属学校" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">知识点:</td>
								<td><input type="text" name="KNOWLEDGE_ID" id="KNOWLEDGE_ID" value="${pd.KNOWLEDGE_ID}" maxlength="255" placeholder="这里输入知识点" title="知识点" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">题目内容:</td>
								<td><input type="text" name="CONTENT" id="CONTENT" value="${pd.CONTENT}" maxlength="255" placeholder="这里输入题目内容" title="题目内容" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">选项个数:</td>
								<td><input type="number" name="OPTION_NUM" id="OPTION_NUM" value="${pd.OPTION_NUM}" maxlength="32" placeholder="这里输入选项个数" title="选项个数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">选项内容:</td>
								<td><input type="text" name="OPTION_CONTENT" id="OPTION_CONTENT" value="${pd.OPTION_CONTENT}" maxlength="255" placeholder="这里输入选项内容" title="选项内容" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">标准答案:</td>
								<td><input type="text" name="ANSWER" id="ANSWER" value="${pd.ANSWER}" maxlength="255" placeholder="这里输入标准答案" title="标准答案" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">难度系数:</td>
								<td><input type="text" name="DIFFICULTY" id="DIFFICULTY" value="${pd.DIFFICULTY}" maxlength="10" placeholder="这里输入难度系数" title="难度系数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">题目解析:</td>
								<td><input type="text" name="ANALYSIS" id="ANALYSIS" value="${pd.ANALYSIS}" maxlength="255" placeholder="这里输入题目解析" title="题目解析" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">题目来源:</td>
								<td><input type="text" name="QUESTION_FROM" id="QUESTION_FROM" value="${pd.QUESTION_FROM}" maxlength="255" placeholder="这里输入题目来源" title="题目来源" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">建议试题总分:</td>
								<td><input type="text" name="SUG_SCORE" id="SUG_SCORE" value="${pd.SUG_SCORE}" maxlength="255" placeholder="这里输入建议试题总分" title="建议试题总分" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">建议部分分:</td>
								<td><input type="text" name="SUG_PART_SCORE" id="SUG_PART_SCORE" value="${pd.SUG_PART_SCORE}" maxlength="255" placeholder="这里输入建议部分分" title="建议部分分" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户ID:</td>
								<td><input type="text" name="USER_ID" id="USER_ID" value="${pd.USER_ID}" maxlength="255" placeholder="这里输入用户ID" title="用户ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">创建时间:</td>
								<td><input type="text" name="CREATE_DATE" id="CREATE_DATE" value="${pd.CREATE_DATE}" maxlength="255" placeholder="这里输入创建时间" title="创建时间" style="width:98%;"/></td>
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
			if($("#P_ID").val()==""){
				$("#P_ID").tips({
					side:3,
		            msg:'请输入父ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#P_ID").focus();
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
			if($("#CHAPTER_ID").val()==""){
				$("#CHAPTER_ID").tips({
					side:3,
		            msg:'请输入所属章节',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CHAPTER_ID").focus();
			return false;
			}
			if($("#PROBLEM_TYPE_ID").val()==""){
				$("#PROBLEM_TYPE_ID").tips({
					side:3,
		            msg:'请输入题目类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PROBLEM_TYPE_ID").focus();
			return false;
			}
			if($("#TEACHER_ID").val()==""){
				$("#TEACHER_ID").tips({
					side:3,
		            msg:'请输入出题老师',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TEACHER_ID").focus();
			return false;
			}
			if($("#SCHOOL_ID").val()==""){
				$("#SCHOOL_ID").tips({
					side:3,
		            msg:'请输入所属学校',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SCHOOL_ID").focus();
			return false;
			}
			if($("#KNOWLEDGE_ID").val()==""){
				$("#KNOWLEDGE_ID").tips({
					side:3,
		            msg:'请输入知识点',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#KNOWLEDGE_ID").focus();
			return false;
			}
			if($("#CONTENT").val()==""){
				$("#CONTENT").tips({
					side:3,
		            msg:'请输入题目内容',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CONTENT").focus();
			return false;
			}
			if($("#OPTION_NUM").val()==""){
				$("#OPTION_NUM").tips({
					side:3,
		            msg:'请输入选项个数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OPTION_NUM").focus();
			return false;
			}
			if($("#OPTION_CONTENT").val()==""){
				$("#OPTION_CONTENT").tips({
					side:3,
		            msg:'请输入选项内容',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OPTION_CONTENT").focus();
			return false;
			}
			if($("#ANSWER").val()==""){
				$("#ANSWER").tips({
					side:3,
		            msg:'请输入标准答案',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ANSWER").focus();
			return false;
			}
			if($("#DIFFICULTY").val()==""){
				$("#DIFFICULTY").tips({
					side:3,
		            msg:'请输入难度系数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DIFFICULTY").focus();
			return false;
			}
			if($("#ANALYSIS").val()==""){
				$("#ANALYSIS").tips({
					side:3,
		            msg:'请输入题目解析',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ANALYSIS").focus();
			return false;
			}
			if($("#QUESTION_FROM").val()==""){
				$("#QUESTION_FROM").tips({
					side:3,
		            msg:'请输入题目来源',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#QUESTION_FROM").focus();
			return false;
			}
			if($("#SUG_SCORE").val()==""){
				$("#SUG_SCORE").tips({
					side:3,
		            msg:'请输入建议试题总分',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUG_SCORE").focus();
			return false;
			}
			if($("#SUG_PART_SCORE").val()==""){
				$("#SUG_PART_SCORE").tips({
					side:3,
		            msg:'请输入建议部分分',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUG_PART_SCORE").focus();
			return false;
			}
			if($("#USER_ID").val()==""){
				$("#USER_ID").tips({
					side:3,
		            msg:'请输入用户ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USER_ID").focus();
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