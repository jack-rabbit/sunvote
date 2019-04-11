<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="myelfun" uri="/WEB-INF/tld/elfun.tld"%>
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
  <link type="text/css" href="static/css/tablescroller.css" rel="stylesheet" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
<link rel="stylesheet" href="static/css/teach.css" />
<style>
.table{padding-bottom:0 !important;}
.dec{font-size:14px;}
</style>
</head>

<body style="background:#fff;/* overflow-y:hidden; */">
	<div class="box_header">
		<div class="head_box_l">
			<p>
				<span class="right_b"></span>${pd.HOMEWORKINFO.NAME}
			</p>
			<p class="dec">练习说明: ${pd.HOMEWORKINFO.HOMEWORK_DESC}</p>
			<p class="dec">收卷时间: ${pd.HOMEWORKINFO.COMPLETE_DATE}</p>
			
		</div>	
		<div class="head_box_r">
			<p class="dec">班级完成情况: ${pd.HOMEWORKINFO.COMPLETE_DESC}</p>
			<p class="dec">班级名册：${myelfun:findClassName(pd.CLASS_ID)}</p>
			<p class="dec">学生人数: ${fn:length(pd.STUDENTS)}</p>
		</div>					
		<div class="clear"></div>
	</div>
	<div style="padding:20px 20px;">
		<form action="report/report_test.do" method="post" name="Form" id="Form">
			<input type="hidden" name="CLASSID" id="CLASSID" value="${pd.CLASS_ID}" />
			
			<table id="simple-table"
				class="table table-bordered table-hover"
				style="margin-top:0px;margin-bottom:0;">
				<thead>
					<tr>
						<th class="center"><div style="width:80px;">排名</div></th>
						<th class="center"><div style="width:80px;">姓名</div></th>
						<th class="center"><div style="width:80px;">学号</div></th>
						<th class="center"><div style="width:109px;">键盘</div></th>
						<th class="center"><div style="width:80px;">正确率</div></th>
						<th class="center"><div style="width:80px;">得分</div></th>						
						<c:set value="${ fn:split(pd.DATA[0].ANSWER, ';') }" var="ANSWER" />
						<c:forEach items="${ANSWER}" var="var" varStatus="vs">
							<th class="center th_w"><div style="width:80px;margin:0 auto;">题目${vs.index+1}</div></th>
						</c:forEach>
						
					</tr>
				</thead>
				<tbody>
					

					<c:choose>
						<c:when test="${not empty pd.STUDENTS}">
							<c:forEach items="${pd.STUDENTS}" var="var" varStatus="vs">
								<tr>
									<td class="center"><div style="width:80px;">${pd.DATA[vs.index].RANK}</div></td>
									<td class="center"><div style="width:80px;">${var.NAME}</div></td>
									<td class="center"><div style="width:80px;">${var.SNO}</div></td>
									<td class="center"><div style="width:80px;">${var.KEYPAD_ID}</div></td>
									<td class="center"><div style="width:109px;"><fmt:formatNumber type="number" value="${pd.DATA[vs.index].STUDENT_SCORE/pd.DATA[vs.index].PAPER_SCORE*100}" pattern="0.00"/>%</div></td>
									<td class="center"><div style="width:80px;">${pd.DATA[vs.index].STUDENT_SCORE}</div></td>
									
									<c:forEach items="${ANSWER}" var="var1" varStatus="vs1">
										<c:set value="${ fn:split(ANSWER[vs1.index], ',') }" var="ANSWER1" />
										<td class="center td_w" <c:if test="${ANSWER1[1]== '1'}">style="background:#0bb8b9"</c:if>><div style="width:80px;margin:0 auto;">${ANSWER1[0]==""?"--":ANSWER1[0]}</div></td>
									</c:forEach>
									
									
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>
			<div id="scrollableTable"></div>
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
	
		<script language="javascript" src="static/js/tablescroller.js"></script>
    <script language="javascript" src="static/js/tablescroller.jquery.js"></script>
    

	<script type="text/javascript">
		$(document).ready(function(){
			window.top.loading.remove();
			
			var _heigh = $('#mainFrame', parent.document).height()-220;
			//console.log(_heigh);
			
			var options = {
            width: '100%',
            height: _heigh,
            pinnedRows: 1,
            pinnedCols: 6,
            container: "#scrollableTable",
            removeOriginal: true
        	};

       		$("#simple-table").tablescroller(options);
       		
       		$(".scrollable-columns-table").css("width","100%");
       		
		});
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
