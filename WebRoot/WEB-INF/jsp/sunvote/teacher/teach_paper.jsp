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
	<link href="../static/css/teach.css" rel="stylesheet">
	<link href="../static/css/paper.css" rel="stylesheet">
  </head>
  <body>
  <div class="container">
    <div class="page-header">
	  <h3 class="col-md-6">布置练习</h3>
	    <a href="set_question" class="btn btn-info">出题</a>
		<div class="clearfix"></div>
	</div>
	<div class="choose_class">
		<div class="col-md-2"><h4>选择班级</h4></div>
		<div class="col-md-10">
			<ul>
				<li>一年级1501班</li>
				<li class="active">一年级1502班</li>
				<li>一年级1503班</li>
				<li>一年级1504班</li>
				<li>一年级1505班</li>
			</ul>
		</div>
		<div class="clearfix"></div>
	</div>
	<div class="screen">
		<div class="col-md-2">按条件筛选</div>
		<div class="col-md-10">
			<ul>
				<li>
					<div class="form-group">
					   <div class="col-sm-3">
						 <select name="dealer_id_1" id="dealer_id_1" class="selectpicker show-tick form-control"  data-width="98%" data-first-option="false" title='请选择经销商(必选)' required data-live-search="true">
							<option value="0">现在</option>
							<option value="0">6月</option>
							<option value="0">7月</option>
						 </select>
					   </div>
					</div>
				</li>
				<li>
					<div class="form-group">
					   <div class="col-sm-3">
						 <select name="dealer_id_2" id="dealer_id_2" class="selectpicker show-tick form-control"  data-width="98%" data-first-option="false" title='请选择经销商(必选)' required data-live-search="true">
							<option value="0">初一1501班</option>
							<option value="0">初一1502班</option>
							<option value="0">初一1503班</option>
							<option value="0">初一1504班</option>
							<option value="0">初一1505班</option>
						 </select>
					   </div>
					</div>
				</li>
				<li>
					<button type="button" class="btn btn-info">搜索</button>
				</li>
			</ul>
		</div>
		<div class="clearfix"></div>
	</div>
	<div class="result">
		<table class="table table-striped">
		  <thead>
			<tr>
				<th>序号</th>
				<th>创建时间</th>
				<th>班级</th>
				<th>科目</th>
				<th>完成情况</th>
				<th>试卷名称</th>
				<th>考试时长</th>
				<th>状态</th>
				<th>查看</th>
			</tr>
		  </thead>
		  <tbody id="tab_body">
			<tr>
				<td>1</td>
				<td>2018/7/31</td>
				<td>一年级1502班</td>
				<td>小学数学</td>
				<td>0/2</td>
				<td>数一数</td>
				<td>2018/08/05 08:00</td>
				<td>已截止</td>
				<td>查看</td>
			</tr>
			<tr>
				<td>2</td>
				<td>2018/6/21</td>
				<td>一年级1502班</td>
				<td>小学数学</td>
				<td>0/2</td>
				<td>1.1 认识平面图形</td>
				<td>2018/06/24 08:00</td>
				<td>已截止</td>
				<td>查看</td>
			</tr>
		  </tbody>
		</table>
	</div>
	</div>
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
	<script>
		var url="http://127.0.0.1:8080/SunvoteEducation";
		var tab_html="";
		var user_id= "8dbef15bb6d043ec94b719ede583b033",
			subject_id="",
			class_id="";
		$(document).ready(function(){
			$.ajax({
				url:url+"/api/v1/paper",
				async:false,
				type:"post",
				data:{
					paper_type:"101",
					user_id:user_id,
					subject_id:subject_id,
					class_id:class_id,
					currentpage:"",
					showcount:"10"
				},
				success:function(data){
					for(var i=0;i<data.data.length;i++){
						tab_html += '<tr><td>'+(i+1)+'</td><td>'+data.data[i].CREATE_DATE+'</td><td>一年级1502班</td><td>小学数学</td><td>0/2</td><td>'+data.data[i].TITLE+'</td><td>'+data.data[i].EXAM_TIME+'分钟</td><td>已截止</td><td><a onclick="jump($(this));" data-id="'+data.data[i].PAPER_ID+'" >查看</a></td></tr>'
					}
					$("#tab_body").html(tab_html);
				}
			})
		})
		function jump(obj){
			var id=obj.attr("data-id");
			location.href="paper_view.do?PAPER_ID="+id;
		}
		
	</script>
</html>