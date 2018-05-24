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
					
					<form action="testpaperinfo/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="TESTPAPERINFO_ID" id="TESTPAPERINFO_ID" value="${pd.TESTPAPERINFO_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">试卷:</td>
								<td><input type="text" name="PAPER_ID" id="PAPER_ID" value="${pd.PAPER_ID}" maxlength="255" placeholder="这里输入试卷" title="试卷" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">学生:</td>
								<td><input type="text" name="STUDENT_ID" id="STUDENT_ID" value="${pd.STUDENT_ID}" maxlength="255" placeholder="这里输入学生" title="学生" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">测验:</td>
								<td><input type="text" name="TEST_ID" id="TEST_ID" value="${pd.TEST_ID}" maxlength="255" placeholder="这里输入测验" title="测验" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">题目:</td>
								<td><input type="text" name="QUESTION_ID" id="QUESTION_ID" value="${pd.QUESTION_ID}" maxlength="255" placeholder="这里输入题目" title="题目" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">学生答案:</td>
								<td><input type="text" name="ANSWER" id="ANSWER" value="${pd.ANSWER}" maxlength="255" placeholder="这里输入学生答案" title="学生答案" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否正确:</td>
								<td><input type="number" name="RIGHT" id="RIGHT" value="${pd.RIGHT}" maxlength="32" placeholder="这里输入是否正确" title="是否正确" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">得分:</td>
								<td><input type="number" name="SCORE" id="SCORE" value="${pd.SCORE}" maxlength="32" placeholder="这里输入得分" title="得分" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否点赞:</td>
								<td><input type="number" name="LIKES" id="LIKES" value="${pd.LIKES}" maxlength="32" placeholder="这里输入是否点赞" title="是否点赞" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">答题类型:</td>
								<td><input type="text" name="ANSWER_TYPE" id="ANSWER_TYPE" value="${pd.ANSWER_TYPE}" maxlength="255" placeholder="这里输入答题类型" title="答题类型" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">按键时间:</td>
								<td><input type="text" name="PRESS_TIME" id="PRESS_TIME" value="${pd.PRESS_TIME}" maxlength="255" placeholder="这里输入按键时间" title="按键时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">接收时间:</td>
								<td><input class="span10 date-picker" name="RECEIVER_DATE" id="RECEIVER_DATE" value="${pd.RECEIVER_DATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="接收时间" title="接收时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否主观题:</td>
								<td><input type="number" name="SUBJECTIVE" id="SUBJECTIVE" value="${pd.SUBJECTIVE}" maxlength="32" placeholder="这里输入是否主观题" title="是否主观题" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">笔记:</td>
								<td><input type="text" name="NOTE" id="NOTE" value="${pd.NOTE}" maxlength="255" placeholder="这里输入笔记" title="笔记" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">标记等级:</td>
								<td><input type="text" name="MARK_NO" id="MARK_NO" value="${pd.MARK_NO}" maxlength="1" placeholder="这里输入标记等级" title="标记等级" style="width:98%;"/></td>
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
			if($("#PAPER_ID").val()==""){
				$("#PAPER_ID").tips({
					side:3,
		            msg:'请输入试卷',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PAPER_ID").focus();
			return false;
			}
			if($("#STUDENT_ID").val()==""){
				$("#STUDENT_ID").tips({
					side:3,
		            msg:'请输入学生',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STUDENT_ID").focus();
			return false;
			}
			if($("#TEST_ID").val()==""){
				$("#TEST_ID").tips({
					side:3,
		            msg:'请输入测验',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TEST_ID").focus();
			return false;
			}
			if($("#QUESTION_ID").val()==""){
				$("#QUESTION_ID").tips({
					side:3,
		            msg:'请输入题目',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#QUESTION_ID").focus();
			return false;
			}
			if($("#ANSWER").val()==""){
				$("#ANSWER").tips({
					side:3,
		            msg:'请输入学生答案',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ANSWER").focus();
			return false;
			}
			if($("#RIGHT").val()==""){
				$("#RIGHT").tips({
					side:3,
		            msg:'请输入是否正确',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RIGHT").focus();
			return false;
			}
			if($("#SCORE").val()==""){
				$("#SCORE").tips({
					side:3,
		            msg:'请输入得分',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SCORE").focus();
			return false;
			}
			if($("#LIKES").val()==""){
				$("#LIKES").tips({
					side:3,
		            msg:'请输入是否点赞',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LIKES").focus();
			return false;
			}
			if($("#ANSWER_TYPE").val()==""){
				$("#ANSWER_TYPE").tips({
					side:3,
		            msg:'请输入答题类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ANSWER_TYPE").focus();
			return false;
			}
			if($("#PRESS_TIME").val()==""){
				$("#PRESS_TIME").tips({
					side:3,
		            msg:'请输入按键时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PRESS_TIME").focus();
			return false;
			}
			if($("#RECEIVER_DATE").val()==""){
				$("#RECEIVER_DATE").tips({
					side:3,
		            msg:'请输入接收时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RECEIVER_DATE").focus();
			return false;
			}
			if($("#SUBJECTIVE").val()==""){
				$("#SUBJECTIVE").tips({
					side:3,
		            msg:'请输入是否主观题',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUBJECTIVE").focus();
			return false;
			}
			if($("#NOTE").val()==""){
				$("#NOTE").tips({
					side:3,
		            msg:'请输入笔记',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NOTE").focus();
			return false;
			}
			if($("#MARK_NO").val()==""){
				$("#MARK_NO").tips({
					side:3,
		            msg:'请输入标记等级',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MARK_NO").focus();
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