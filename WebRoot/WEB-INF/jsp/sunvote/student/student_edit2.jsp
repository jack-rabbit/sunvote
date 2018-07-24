<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 日期框 -->
<link rel="stylesheet" href="../static/ace/css/datepicker.css" />
<style type="text/css">
li {
	list-style: none;
	margin-top: 10px;
	clear: right;
	clear: both;
}

li p {
	width: 5em;
	text-align: right;
	margin: 0;
	margin-right: 0.5em;
	float: left;
	line-height: 30px;
}

li .li_r {
	margin-left: 6em;
	margin-right: 1em;
	clear: right;
}

li .li_r select {
	height: 30px;
	line-height: 30px;
	background: #f5f5f5;
	border: 1px solid #ccc;
	outline-style: none;
	width: 100%;
}

li input {
	height: 30px;
	line-height: 30px;
	background: #f5f5f5;
	border: 1px solid #ccc;
	outline-style: none;
	width: 100%;
}



.btn {
	width: 80%;
	height: 40px;
	margin: 0 auto;
	background: #3bc2d6;
	margin-top: 5%;
}

.btn a {
	display: block;
	width: 100%;
	height: 100%;
	color: #fff;
	text-decoration: none;
	text-align: center;
	line-height: 40px;
	font-size: 20px;
}

input[type="text"],select {
	padding-left: 6px;
}
</style>

</head>
<body>
	<form action="../student/${msg }.do" name="Form" id="Form"
		method="post">
		<input type="hidden" name="ID" id="ID" value="${pd.ID}" /> <input
			type="hidden" name="CLASS_ID" id="CLASS_ID" value="${pd.CLASS_ID}" />
		<input type="hidden" name="TERM_ID" id="TERM_ID" value="${pd.TERM_ID}" />
		<div id="zhongxin">
			<li>
				<p><span style="color:#f00">*</span>学生姓名:</p>
				<div class="li_r">
					<input type="text" name="NAME" id="NAME" value="${pd.NAME}"
						maxlength="255" placeholder="这里输入学生姓名" title="学生姓名" />
				</div>
			</li>
			<li>
				<p><span style="color:#f00">*</span>学号:</p>
				<div class="li_r">
					<input type="text" name="NUMBER" id="NUMBER" value="${pd.NUMBER}"
						maxlength="255" placeholder="这里输入学号" title="学号" />
				</div>
			</li>
			<li>
				<p><span style="color:#f00">*</span>键盘ID:</p>
				<div class="li_r">
					<input type="text" name="KEYPAD_ID" id="KEYPAD_ID"
						value="${pd.KEYPAD_ID}" maxlength="10" placeholder="这里输入键盘ID"
						title="键盘ID" />
				</div>
			</li>
			
			<li>
				<p>性别:</p>
				<div class="li_r">
					<select class="chosen-select form-control" name="SEX" id="SEX"
						data-placeholder="这里输入班级类型">
						<option value="1" <c:if test="${pd.SEX==1}">selected="true"</c:if>>男</option>
						<option value="0" <c:if test="${pd.SEX==0}">selected="true"</c:if>>女</option>
					</select>
				</div>
			</li>
			

			<div class="btn">
				<a onclick="save();">保存</a>
			</div>
		</div>
		<div id="zhongxin2" class="center" style="display:none">

			<img src="../static/images/jiazai.gif" /><br />
			<h4 class="lighter block green">提交中...</h4>
		</div>
	</form>



	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot2.jsp"%>
	<!-- 下拉框 -->
	<script src="../static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="../static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="../static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		//保存
		function save() {
			if ($("#NAME").val() == "") {
				$("#NAME").tips({
					side : 3,
					msg : '请输入学生姓名',
					bg : '#AE81FF',
					time : 2
				});
				$("#NAME").focus();
				return false;
			}
			
			if ($("#NUMBER").val() == "") {
				$("#NUMBER").tips({
					side : 3,
					msg : '请输入学生姓名',
					bg : '#AE81FF',
					time : 2
				});
				$("#NUMBER").focus();
				return false;
			}

			if ($("#KEYPAD_ID").val() == ""
					|| $("#KEYPAD_ID").val().length != 10) {
				$("#KEYPAD_ID").tips({
					side : 3,
					msg : '输入十位有效编号',
					bg : '#AE81FF',
					time : 2
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
		
		});
	</script>
</body>
</html>