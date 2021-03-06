﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>班级-测试名单</title>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://cdn.staticfile.org/twitter-bootstrap/4.0.0-alpha.2/js/bootstrap.min.js"></script>
<link
	href="http://cdn.staticfile.org/twitter-bootstrap/4.0.0-alpha.2/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="../static/css/jquery.circliful.css" rel="stylesheet"
	type="text/css" />
<link href="../static/css/style1.css?t=123" rel="stylesheet" type="text/css" />
<!-- 日期框 -->
<link rel="stylesheet" href="../static/ace/css/datepicker.css" />
<script src="../static/laydate/laydate.js"></script>
<!-- 改成你的路径 -->
<script src="../static/js/jquery.circliful.min.js"></script>
<script src="../static/js/echars.js"></script>
<!-- 日期框 -->
<script src="../static/ace/js/date-time/bootstrap-datepicker.js"></script>
<!--提示框-->
<script type="text/javascript" src="../static/js/jquery.tips.js"></script>




<style>
body {
	padding-top: 50px;
}

li {
	list-style: none;
}
</style>
</head>
<body>
	<div class="header">
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container">
				<input type="hidden" name="SUBJECT_ID" id="SUBJECT_ID" value="${pd.SUBJECT_ID}"/>
				<input type="text" class="date-picker" placeholder="Start Date"	name="starDate" id="starDate" data-date-format="yyyy-mm-dd"	readonly="readonly" value="${start_date}"/> 
				<input type="text" class="date-picker" placeholder="End Date" name="endDate" id="endDate"  data-date-format="yyyy-mm-dd"	readonly="readonly" value="${end_date}"/>
				<input type="button" value="Search" id="search" />
			</div>
		</nav>
	</div>
	<div class="content row">
		<div class="content_l col-md-2">
			<ul>

			</ul>
		</div>
		<div class="content_r col-md-10">
			<div class="tabel_t">
				<div class="name">
					<h1></h1>
				</div>
				<div class="circle row">
					<div class="col-md-6">
						<!-- <div id="myStathalf" data-dimension="350" data-text="9/19" data-info="参与测试" data-width="10" data-fontsize="38" data-percent="35" data-fgcolor="#8ad254" data-bgcolor="#a9f9ff" data-type="half" data-fill="#50b5c9"></div> -->

					</div>
					<div class="col-md-6">
						<!-- <div id="myStathalf1" data-dimension="350" data-text="36%" data-info="个人平均得分率" data-width="10" data-fontsize="38" data-percent="35" data-fgcolor="#8ad254" data-bgcolor="#a9f9ff" data-type="half" data-fill="#50b5c9"></div> -->

					</div>
				</div>
				<div class="info row">
					<div class="col-md-6">
						<p>
							Class Average <span id="class_avg">0.0</span>%
						</p>
					</div>
					<div class="col-md-6">
						<p>
							Class Highest <span id="class_max">0.0</span>%
						</p>
					</div>
				</div>
				<div class="prev"></div>
				<div class="next"></div>
			</div>
			<div class="tabel_b">
				<div class="tab_top row">
					<div class="col-md-3"></div>
					<div class="col-md-9">
						<div class="color">
							<ul>
								<li><span class="green"></span>Class Avg.</li>
								<li><span class="yellow"></span>Class Highest</li>
								<li><span class="blue"></span>Student</li>
								<div class="clear"></div>
							</ul>
						</div>
						<div class="check_box">
							<input type="radio" checked value="1" name="check" id="check1" />
							<label for="check1">Correct Rate</label> <input type="radio" value="2"
								name="check" id="check2" /> <label for="check2">Marks</label>
						</div>
					</div>
				</div>
				<div class="tabel_content">
					<div id="main" style="width: 100%;height:400px;"></div>
				</div>
			</div>
		</div>
	</div>
	<script type="">
		var URL = '<%=basePath%>${URL}';
	</script>
	<script src="../static/js/en_control1.js?a=0"></script>
	<!-- 日期框 -->
	<script>
	//lay('#version').html('-v'+ laydate.v);
	//日期范围
	// laydate.render({
	//  elem: '#test6'
	//  ,range: true
	// });
		$(document).ready(function(){
		//	window.top.loading.remove();
		});
		
		$.fn.datepicker.dates['en'] = {
					    days: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
					    daysShort: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
					    daysMin: ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"],
					    months: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
					    monthsShort: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
					    today: "Today",
					    clear: "Clear",
					    format: "mm/dd/yyyy",
					    titleFormat: "MM yyyy", /* Leverages same syntax as 'format' */
					    weekStart: 0
				};
			//日期框
			$('.date-picker').datepicker({
				autoclose: true,
				todayHighlight: true,
				 language: 'en'
			});
</script>



</body>
</html>
