<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>试卷成绩报表</title>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>

<body style="background:#fff">
	<div style="min-width:1360px; margin:0 100px">
	</br>
	</br>
	</br>
		<form action="report/report_test.do" method="post" name="Form" id="Form">
			<input type="hidden" name="CLASSID" id="CLASSID" value="${info.CLASS_ID}" />
			<table style="margin-top:5px;">
				<tr>
					<td>试卷名称: ${info.testsize}</td>
				</tr>
				<tr>
					<td>收卷时间: ${info.CLASS_NAME}</td>
				</tr>
				<tr>
					<td>班级名册：${info.CLASS_NAME}</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><span>学生人数: ${info.STUDENT_NUM}</span></td>
					
				</tr>
			</table>
			<table id="simple-table"
				class="table table-striped table-bordered table-hover"
				style="margin-top:5px;">
				<thead>
					<tr>
						<th class="center">键盘</th>
						<th class="center">学号</th>
						<th class="center">姓名</th>
						<th class="center">得分</th>
						<th class="center">正确率</th>
						<th class="center">排名</th>
						<c:forEach items="${testpaperList}" var="var" varStatus="vs">
							<th class="center">${var.NAME}</th>
						</c:forEach>
						<th class="center">非选择题得分</th>
						<th class="center">总分</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="center"></td>
						<td class="center"></td>
						<td class="center"></td>
						<td class="center"></td>
						<td class="center"></td>
						<td class="center"></td>
						<c:forEach items="${testpaperList}" var="var" varStatus="vs">
							<td class="center">${var.TOTAL_SCORE}</td>
						</c:forEach>
						<td class="center"></td>
						<td class="center"></td>
					</tr>

					<c:choose>
						<c:when test="${not empty studentList}">
							<c:forEach items="${studentList}" var="var" varStatus="vs">
								<tr>
									<td class="center"><a
										href="<%=basePath%>report/student_report。do?studentid=${var.ID}">${var.NAME}</a>
									</td>
									<td class="center"><fmt:formatNumber type="number"
											value="${var.TOTALSCORE == 0 ? 0: (var.GETSCORE / var.TOTALSCORE * 100)}"
											maxFractionDigits="1" />%</td>
									<td class="center">${var.GETSCORE }</td>
									<c:forEach items="${testpaperList}" var="var1" varStatus="vs1">
										<td class="center"><c:set var="TEST_ID"
												value="${var1.TESTPAPER_ID}" /> ${var[TEST_ID] }</td>
									</c:forEach>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>
		</form>
	</div>

	<%@ include file="../../system/index/foot.jsp"%>
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>

	<script type="text/javascript">
		$(function() {

			//日期框
			$('.date-picker').datepicker({
				autoclose : true,
				todayHighlight : true
			});

			//下拉框
			if (!ace.vars['touch']) {
				$('.chosen-select').chosen({
					allow_single_deselect : true
				});
				$(window).off('resize.chosen').on('resize.chosen', function() {
					$('.chosen-select').each(function() {
						var $this = $(this);
						$this.next().css({
							'width' : $this.parent().width()
						});
					});
				}).trigger('resize.chosen');
				$(document).on('settings.ace.chosen',
						function(e, event_name, event_val) {
							if (event_name != 'sidebar_collapsed')
								return;
							$('.chosen-select').each(function() {
								var $this = $(this);
								$this.next().css({
									'width' : $this.parent().width()
								});
							});
						});
				$('#chosen-multiple-style .btn').on(
						'click',
						function(e) {
							var target = $(this).find('input[type=radio]');
							var which = parseInt(target.val());
							if (which == 2)
								$('#form-field-select-4').addClass(
										'tag-input-style');
							else
								$('#form-field-select-4').removeClass(
										'tag-input-style');
						});
			}

			//复选框全选控制
			var active_class = 'active';
			$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on(
					'click',
					function() {
						var th_checked = this.checked;//checkbox inside "TH" table header
						$(this).closest('table').find('tbody > tr').each(
								function() {
									var row = this;
									if (th_checked)
										$(row).addClass(active_class).find(
												'input[type=checkbox]').eq(0)
												.prop('checked', true);
									else
										$(row).removeClass(active_class).find(
												'input[type=checkbox]').eq(0)
												.prop('checked', false);
								});
					});
		});
		
		
		function precent(avg,total){
			if(total == 0){
				return "0%"
			}
			return Math.round(avg / total * 100)/100 + '%' ;
		}
	</script>

</body>
</html>
