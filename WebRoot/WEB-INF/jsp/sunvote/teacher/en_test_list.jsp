<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SunVote Class</title>

    <!-- Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="../static/ace/css/datepicker.css" />
	<link href="../static/css/teach.css" rel="stylesheet">
	<link href="../static/css/paper.css?t=1" rel="stylesheet">
  </head>
  <body>
   <div class="head_box">
		<div class="box_header">
			<div class="head_box_l">
				<p>
					<span class="right_b"></span>SunVote Class Test Paper Management
				</p>
			</div>
			<div class="head_box_r">
				<input class="date-picker" type="text" placeholder="Start Date" name="lastStart" id="lastStart" data-date-format="yyyy-mm-dd" readonly="readonly" value=""/> 
				<input type="text" class="date-picker" placeholder="End Date" name="lastEnd" id="lastEnd" data-date-format="yyyy-mm-dd" readonly="readonly" value=""/>				
				 <a onclick="tosearch();"><img
					src="../static/images/search.png" /></a>
			</div>
			<div class="clear"></div>
			</div>
			<div style="padding:0 5%;background:#fff;">
				<table class="table table-striped">
				<col style="width: 10%" />
				<col style="width: 20%" />
				<col style="width: 10%" />
				<col style="width: 20%" />
				<col style="width: 10%" />
				<thead>
					<tr>
						<th>Serial No.</th>
						<th>Test Paper Title</th>
						<th>Class</th>
						<th>Create Time</th>
						<th>Operate</th>
					</tr>
				</thead>
			</table>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="table_box">
			<table class="table table-striped">
				<col style="width: 10%" />
				<col style="width: 20%" />
				<col style="width: 10%" />
				<col style="width: 20%" />
				<col style="width: 10%" />
				<tbody id="tab_body">
					<!--测验列表-->
				</tbody>
			</table>
	
	
			<div class="footer">
				<div class="page_box">
					<div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div>
				</div>
			</div>
		</div>
  
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<script src="../static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script type="text/javascript">
		var user_id= "${pd.userId}";
		var url = "<%=basePath%>";
	</script>
	<script src="../static/js/en_test_list.js?a=0"></script>
</html>