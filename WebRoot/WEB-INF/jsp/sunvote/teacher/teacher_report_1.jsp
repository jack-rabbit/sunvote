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

<title>${info.CLASS_NAME}成绩报表</title>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
  <link type="text/css" href="static/css/tablescroller.css" rel="stylesheet" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
<style>
	.font span{    font-size: 12px;
    font-weight: initial;color:#000;}
	</style>
</head>

<body style="background:#fff;overflow-y:hidden;">
	<div style="padding:20px 20px;">
		<form action="report/report.do" method="post" name="Form" id="Form">
			<input type="hidden" name="CLASSID" id="CLASSID" value="${info.CLASS_ID}" />
			<table style="margin-top:5px;margin-bottom:20px;">
				<tr>
					<td><div style="width:150px;text-align:center;">课程统计: ${info.testsize}</div></td>
					<td><div style="width:150px;text-align:center;">班级名册: ${info.CLASS_NAME}</div></td>
				
					<td><div style="width:150px;text-align:center;"><span>学生人数: ${info.STUDENT_NUM}</span></div></td>
					<td></td>
					<td style="padding-left:2px;">
					<input
						class="span10 date-picker" name="lastStart" id="lastStart"
						value="${start_date}" type="text" data-date-format="yyyy-mm-dd"
						readonly="readonly" style="width:88px;" placeholder="开始日期"
						title="开始日期" />
						</td>
					<td style="padding-left:2px;"><input
						class="span10 date-picker" name="lastEnd" id="lastEnd" value="${end_date}"
						type="text" data-date-format="yyyy-mm-dd" readonly="readonly"
						style="width:88px;" placeholder="结束日期" title="结束日期" /></td>
					<td style="vertical-align:top;padding-left:2px"><a
						class="btn btn-light btn-xs" onclick="tosearch();" title="检索"><i
							id="nav-search-icon"
							class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
				</tr>
			</table>
			<table id="simple-table"
				class="table table-striped table-bordered table-hover"
				style="margin-top:0px;margin-bottom:0px;">
				<thead>
					<tr>
						<th class="center th_name"><div style="width:150px;">姓名</div></th>
						<th class="center "><div style="width:150px;">课程平均得分率</div></th>
						<th class="center"><div style="width:80px;">课程总分</div></th>
						<c:forEach items="${testpaperList}" var="var" varStatus="vs">
							<th class="center kc"><a
								 onclick="paper('${info.CLASS_ID}','${var.TESTPAPER_ID}');"><div style="width:180px;" class="font">${var.NAME}</br><span>${var.CREATE_DATE}</span></div></a></th>
						</c:forEach>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="center"><div style="width:150px;">班级课程总分</div></td>
						<td class="center"><div style="width:150px;"></div></td>
						<td class="center"><div style="width:80px;"></div></td>
						<c:forEach items="${testpaperList}" var="var" varStatus="vs">
							<td class="center"><div style="width:80px;margin:0 auto;">${var.TOTAL_SCORE}</div></td>
						</c:forEach>
					</tr>
					<tr>
						<td class="center"><div style="width:150px;">班级课程平均分</div></td>
						<td class="center"><div style="width:150px;"></div></td>
						<td class="center"><div style="width:80px;"></div></td>
						<c:forEach items="${testpaperList}" var="var" varStatus="vs">
							<td class="center"><div style="width:80px;margin:0 auto;">${var.AVG_SCORE}</div></td>
						</c:forEach>
					</tr>
					<tr>
						<td class="center"><div style="width:150px;">班级课程平均得分率</div></td>
						<td class="center"><div style="width:150px;"></div></td>
						<td class="center"><div style="width:80px;"></div></td>
						<c:forEach items="${testpaperList}" var="var" varStatus="vs">
							<td class="center"><div style="width:80px;margin:0 auto;"><fmt:formatNumber type="number"
									value="${var.TOTAL_SCORE == 0 ? 0: (var.AVG_SCORE / var.TOTAL_SCORE * 100)}"
									maxFractionDigits="2" />%</div></td>
						</c:forEach>
					</tr>

					<c:choose>
						<c:when test="${not empty studentList}">
							<c:forEach items="${studentList}" var="var" varStatus="vs">
								<tr>
									<%-- <td class="center"><a
										href="report/student_report?studentid=${var.ID}&class_id=${info.CLASS_ID}">${var.NAME}</a>
									</td> --%>
									<td class="center"><div style="width:150px;"><a
										 onclick="student('${info.CLASS_ID}','${var.ID}')">${var.NAME}</a></div>
									</td>
									<td class="center"><div style="width:150px;"><fmt:formatNumber type="number"
											value="${var.TOTALSCORE == 0 ? 0: (var.GETSCORE / var.TOTALSCORE * 100)}"
											maxFractionDigits="2" />%</div></td>
									<td class="center"><div style="width:80px;margin:0 auto;">${var.GETSCORE }</div></td>
									<c:forEach items="${testpaperList}" var="var1" varStatus="vs1">
										<td class="center"><div style="width:180px;margin:0 auto;"><c:set var="TEST_ID"
												value="${var1.TESTPAPER_ID}" /> ${var[TEST_ID] }</div></td>
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
		
		function tosearch(){
			var url = "<%=basePath%>report/report.do?classid=${info.CLASS_ID}" ;
			var startDate = $("#lastStart").val();
			var endDate =  $("#lastEnd").val();
			url = url + "&start_date=" + startDate + "&end_date=" + endDate ;
			window.location.href = url;
			/* $("#Form").sumbit(); */
		}
		
		function student(classid,studentid){
			var url = "<%=basePath%>report/student_report?studentid=" + studentid + "&class_id=" + classid ;
			var startDate = $("#lastStart").val();
			var endDate =  $("#lastEnd").val();
			url = url + "&start_date=" + startDate + "&end_date=" + endDate ;
			window.self.location.href = url;
			window.top.loading.show();
		}
		
		function paper(class_id,testpaper_id){
			var url = "<%=basePath%>report/test_report?TestID=" + testpaper_id + "&class_id=" + class_id;
			var startDate = $("#lastStart").val();
			var endDate =  $("#lastEnd").val();
			url = url + "&start_date=" + startDate + "&end_date=" + endDate ;
			window.self.location.href = url;
			window.top.loading.show();
		}
		
		$(document).ready(function(){
			window.top.loading.remove();
			
			
			
			//alert(window.top.document.getElmentById("mainFrame").clienHeight);
			var _width = $('#mainFrame', parent.document).width()-40;
			var _heigh = $('#mainFrame', parent.document).height()-100;
			//console.log(_heigh);
			
			var options = {
            width: _width,
            height: _heigh,
            pinnedRows: 4,
            pinnedCols: 3,
            container: "#scrollableTable",
            removeOriginal: true
        	};

			var sour = ${testpaperList};
			
			if(sour != null && sour.length > 0){
			$("#simple-table").tablescroller(options);
	        var name_height = $(".kc").last().parent().height()-18.5;
	        console.log(name_height);
	        $(".th_name").height(name_height);
			}
				
		});
		
		
		//console.log('${studentList}');
		
	</script>

</body>
</html>
