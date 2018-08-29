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
    <title>即时测</title>

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
					<span class="right_b"></span>云测验测验分析
				</p>
			</div>
			<div class="head_box_r">
				<input class="date-picker" type="text" placeholder="开始日期" name="lastStart" id="lastStart" data-date-format="yyyy-mm-dd" readonly="readonly" value=""/> 
				<input type="text" class="date-picker" placeholder="结束日期" name="lastEnd" id="lastEnd" data-date-format="yyyy-mm-dd" readonly="readonly" value=""/>				
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
						<th>序号</th>
						<th>创建时间</th>
						<th>班级</th>
						<th>试卷名称</th>
						<th>查看</th>
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
	<script src="../static/js/test_list.js"></script>
</html>