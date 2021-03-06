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

<title>${info.CLASS_NAME}成绩报表</title>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
  <link type="text/css" href="static/css/tablescroller.css" rel="stylesheet" />

<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />

<link rel="stylesheet" href="static/css/teach.css" />
<style>
	.font span{    font-size: 12px;
    font-weight: initial;color:#000;}
    .search_btn{width:30px;}
    .btn{margin:0 5px;}
    .center{height:39px;}
    .box_header{position:fixed;top:0;left:0;width:100%;z-index:9999;}
	
	</style>
</head>

<body style="background:#fff;height:auto;">
<div class="box_header">
	<div class="head_box_l">
		<p>
			<span class="right_b"></span>练习报表
		</p>
	</div>						
	<div class="clear"></div>
</div>
<div style="padding-top:3%;margin-top:102px;">

  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist" style="padding-bottom:3%">
    
    <c:forEach items="${pd.CLASSES}" var="var" varStatus="vs">
		<li class="btn ${pd.CLASS_ID==var.CLASS_ID?'btn-primary':'btn-default'} }btn-default btn-lg" onclick="homeReport('${var.CLASS_ID}')">${var.CLASS_NAME}</li>
	</c:forEach>
    
  </ul>


			<div style="padding:20px 20px;">
		<form action="homework/report.do" method="post" name="Form" id="Form" style="margin-bottom:0;">
			<input type="hidden" name="CLASSID" id="CLASSID" value="${pd.CLASS_ID}" />
			<input type="hidden" name="ROLE" id="ROLE" value="${pd.ROLE}" />
			<table style="margin-top:5px;margin-bottom:20px;">
				<tr>
					<td><div style="width:150px;text-align:center;">课程统计: ${fn:length(pd.DATA.HOMEWORKS)}</div></td>
					<td><div style="width:150px;text-align:center;">班级名册: ${myelfun:findClassName(pd.CLASS_ID)}</div></td>
				
					<td><div style="width:150px;text-align:center;"><span>学生人数: ${fn:length(pd.DATA.STUDENTS)}</span></div></td>
					<td></td>
					
				
					
					<td style="padding-left:2px;">
					<input
						class="span10 date-picker" name="lastStart" id="lastStart"
						value="${pd.START_DATE}" type="text" data-date-format="yyyy-mm-dd"
						readonly="readonly" style="width:88px;" placeholder="开始日期"
						title="开始日期" />
						</td>
					<td style="padding-left:2px;"><input
						class="span10 date-picker" name="lastEnd" id="lastEnd" value="${pd.END_DATE}"
						type="text" data-date-format="yyyy-mm-dd" readonly="readonly"
						style="width:88px;" placeholder="结束日期" title="结束日期" /></td>
					<td style="vertical-align:top;padding-left:2px"><a
						class="btn btn-light btn-xs" onclick="tosearch();" title="检索"><img src="static/images/search.png" alt="" class="search_btn" /></a></td>
					<td><li class="btn ${pd.CURRENT_WEEK==-1?'btn-primary':'btn-default' } btn-sm" onclick="tosearch_week(${pd.CURRENT_WEEK-1})">上一周</li></td>
					
					<td><li class="btn ${pd.CURRENT_WEEK==1?'btn-primary':'btn-default' } btn-sm" onclick="tosearch_week(${pd.CURRENT_WEEK+1})">下一周</li></td>
				</tr>
			</table>
			<hr />
			<table id="simple-table"
				class="table table-bordered table-hover"
				style="margin-top:0px;margin-bottom:0px;">
				<thead>
					<tr>
						<th class="center th_name"><div style="width:150px;">姓名</div></th>
						<th class="center "><div style="width:150px;">课程平均得分率</div></th>
						<th class="center"><div style="width:80px;">课程总分</div></th>
						<c:forEach items="${pd.DATA.HOMEWORKS}" var="var_h" varStatus="vs">
							<th class="center kc"><a
								 onclick="paper('${pd.CLASS_ID}','${var_h.HOMEWORK_ID}');"><div style="width:180px;     margin: 0 auto;cursor:hand" class="font">${var_h.NAME}</br><span>${var_h.COMPLETE_DATE}</span></div></a></th>
						</c:forEach>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="center"><div style="width:150px;">班级课程总分</div></td>
						<td class="center"><div style="width:150px;"></div></td>
						<td class="center"><div style="width:80px;"></div></td>
						<c:forEach items="${pd.DATA.HOMEWORKS}" var="var_h" varStatus="vs">
							<td class="center"><div style="width:80px;margin:0 auto;">${var_h.ALL_SCORE}</div></td>
						</c:forEach>
					</tr>
					<tr>
						<td class="center"><div style="width:150px;">班级课程平均分</div></td>
						<td class="center"><div style="width:150px;"></div></td>
						<td class="center"><div style="width:80px;"></div></td>
						<c:forEach items="${pd.DATA.HOMEWORKS}" var="var_h" varStatus="vs">
							<td class="center"><div style="width:80px;margin:0 auto;">${var_h.GET_SCORE}</div></td>
						</c:forEach>
					</tr>
					<tr>
						<td class="center"><div style="width:150px;">班级课程平均得分率</div></td>
						<td class="center"><div style="width:150px;"></div></td>
						<td class="center"><div style="width:80px;"></div></td>
						<c:forEach items="${pd.DATA.HOMEWORKS}" var="var_h" varStatus="vs">
							<td class="center"><div style="width:80px;margin:0 auto;">${var_h.GET_SCORE_PERSENT }</div></td>
						</c:forEach>
					</tr>

					<c:choose>
						<c:when test="${not empty pd.DATA.STUDENTS}">
							<c:forEach items="${pd.DATA.STUDENTS}" var="var" varStatus="vs">
								<tr>
									<%-- <td class="center"><a
										href="report/student_report?studentid=${var.ID}&class_id=${info.CLASS_ID}">${var.NAME}</a>
									</td> --%>
									<td class="center"><div style="width:150px;cursor:hand"><a
										 onclick="student('${pd.CLASS_ID}','${var.STUDENT_ID}')">${var.NAME}</a></div>
									</td>
									<td class="center"><div style="width:150px;"><fmt:formatNumber type="number"
											value="${var.PAPER_ALL_SCORE == 0 ? 0: (var.STUDENT_ALL_SCORE / var.PAPER_ALL_SCORE * 100)}"
											maxFractionDigits="2" />%</div></td>
									<td class="center"><div style="width:80px;margin:0 auto;">${var.PAPER_ALL_SCORE}</div></td>
									<c:forEach items="${pd.DATA.HOMEWORKS}" var="var1" varStatus="vs1">
										<td class="center"><div style="width:80px;margin:0 auto;"><c:set var="TEST_ID"
												value="${var1.HOMEWORK_ID}" /> ${var[TEST_ID] }</div></td>
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
		
		var role = '${pd.ROLE}';
		
		function precent(avg,total){
			if(total == 0){
				return "0%"
			}
			return Math.round(avg / total * 100)/100 + '%' ;
		}
		
		function homeReport(classId){
			var path = '<%=basePath%>homework/report.do?CLASS_ID='+classId;
			console.log(path);
			parent.$("#mainFrame").attr('src',path);
			window.top.loading.show();
		}
		
		function tosearch(){
			
			var url = "<%=basePath%>homework/report.do?CLASS_ID=${pd.CLASS_ID}" ;
			var startDate = $("#lastStart").val();
			var endDate =  $("#lastEnd").val();
			//var subject_id =  $("#SUBJECT_ID").val();
			url = url + "&START_DATE=" + startDate ;
			if(endDate != null){
				url = url + "&END_DATE=" + endDate;
			}

			window.location.href = url;
			window.top.loading.show();
			/* $("#Form").sumbit(); */
		}
		function tosearch_week(type){   //上一周 本周 下一周
			console.log('${pd.CLASS_ID}');
			var url = "<%=basePath%>homework/report.do?CLASS_ID=${pd.CLASS_ID}" ;
			url = url + "&CURRENT_WEEK=" + type ;
			
			console.log(url);
			window.location.href = url;
			window.top.loading.show();
			/* $("#Form").sumbit(); */
		}
		
		function student(classid,studentid){
		
			var url = "<%=basePath%>homework/student.do?STUDENT_ID=" + studentid + "&CLASS_ID=" + classid ;
			var startDate = $("#lastStart").val();
			var endDate =  $("#lastEnd").val();
			url = url + "&START_DATE=" + startDate + "&END_DATE=" + endDate ;
			
			window.location.href = url;
			window.top.loading.show();
		}
		
		function paper(class_id,testpaper_id){
			var url = "<%=basePath%>homework/homework_report?HOMEWORK_ID=" + testpaper_id + "&CLASS_ID=" + class_id;
			var startDate = $("#lastStart").val();
			var endDate =  $("#lastEnd").val();
			url = url + "&START_DATE=" + startDate + "&END_DATE=" + endDate ;
			window.self.location.href = url;
			window.top.loading.show();
		}
		
		$(document).ready(function(){
			window.top.loading.remove();
			
			 var sour = "${pd.DATA.HOMEWORKS}";
			
			
			 if(sour != null && sour.length > 3){
				var _width = $('#mainFrame', parent.document).width()-40;
				var _heigh = $('#mainFrame', parent.document).height()-350;
				var options = {
	            width: _width,
	            height: _heigh,
	            pinnedRows: 4,
	            pinnedCols: 3,
	            container: "#scrollableTable",
	            removeOriginal: true
	        	};
				$("#simple-table").tablescroller(options);
		        var name_height = $(".kc").last().parent().height()-18.5;
		        console.log(name_height);
		        $(".th_name").height(name_height);
			} 
				
		});
		
	</script>

</body>
</html>
