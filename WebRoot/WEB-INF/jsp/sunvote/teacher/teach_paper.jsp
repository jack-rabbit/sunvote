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
					<span class="right_b"></span>即时测试卷管理
				</p>
			</div>
			<div class="head_box_r">
				<input class="date-picker" type="text" placeholder="开始日期" name="lastStart" id="lastStart" data-date-format="yyyy-mm-dd" readonly="readonly" value=""/> 
				<input type="text" class="date-picker" placeholder="结束日期" name="lastEnd" id="lastEnd" data-date-format="yyyy-mm-dd" readonly="readonly" value=""/>
				<select name="dealer_id_2" id="dealer_id_2" class="selectpicker show-tick form-control"  data-width="98%" data-first-option="false" required data-live-search="true">
					<!--班级列表-->
				 </select>
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
				<col style="width: 10%" />
				<col style="width: 10%" />
				<col style="width: 20%" />
				<col style="width: 10%" />
				<col style="width: 10%" />
				<thead>
					<tr>
						<th><input type="checkbox"  name='ids' id="ids" />序号</th>
						<th>试卷名称</th>
						<th>班级</th>
						<th>科目</th>
						<th>考试时长</th>
						<th>创建时间</th>
						<th>查看</th>
						<th>操作</th>
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
				<col style="width: 10%" />
				<col style="width: 10%" />
				<col style="width: 20%" />
				<col style="width: 10%" />
				<tbody id="tab_body">
				
				</tbody>
			</table>
	
	
			<div class="footer">
				<div class="creat">
					<input type="button"  id="creatPaper" value="新建试卷" />
				</div>
				<div class="removeAll">
					<input type="button" onclick="deleteAll()" value="批量删除" />
				</div>
				<div class="page_box">
					
					<div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">请选择班级</h4>
			  </div>
			  <div class="modal-body">
				<form class="form-horizontal">
				  <div class="classList">
					<ul>
						
					</ul>
				  </div>
				</form>
			  </div>
			  <div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-primary" id="submit" onclick="setQUestion()">确定</button>
			  </div>
			</div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
  
 
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<script src="../static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="../static/ace/js/bootbox.js"></script>
	<script src="../static/js/teach_paper.js?a=1"></script>
</html>