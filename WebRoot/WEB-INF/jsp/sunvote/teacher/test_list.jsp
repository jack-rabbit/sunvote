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
				
				</tbody>
			</table>
	
	
			<div class="footer">
				<!--<div class="creat">
					<input type="button"  id="creatPaper" value="新建试卷" />
				</div>
				<div class="removeAll">
					<input type="button" onclick="deleteAll()" value="批量删除" />
				</div>-->
				<div class="page_box">
					
					<div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div>
				</div>
			</div>
		</div>
  <!--<div class="container">
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
					<button type="button" class="btn btn-info" onclick="search()">搜索</button>
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
				<th>试卷名称</th>
				<th>考试时长</th>
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
	</div> -->
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<script src="../static/ace/js/date-time/bootstrap-datepicker.js"></script>

	<script>
		var url="http://127.0.0.1:8080/SunvoteEducation";
		
		var option_html="";
		var user_id= "8dbef15bb6d043ec94b719ede583b033",
			subject_id="";
			
		function getQueryString(name) {
		  var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
		  var r = window.location.search.substr(1).match(reg);
		  if (r != null) return unescape(r[2]); return null;
		}
		var class_id=getQueryString("classid");
		$(document).ready(function(){
			getList();
			//timeList();
			$.ajax({
				url:url+"/teacher/info",
				async:false,
				type:"post",
				success:function(data){
					subject_id=data.data.subjectList[0].SUBJECT_ID;
					user_id=data.data.ID;
					if(data.data.classInfoList.length>0){
						for(var i=0;i<data.data.classInfoList.length;i++){
							option_html += '<option value="'+data.data.classInfoList[i].CLASS_ID+'">'+data.data.classInfoList[i].CLASS_NAME+'</option>'
						}
						$("#dealer_id_2").html(option_html);
					}
				}
			})
			//日期框
			$('.date-picker').datepicker({
				autoclose: true,
				todayHighlight: true
			});
			window.top.loading.remove();
		})
		function getList(start_date,end_date,class_id){
			var tab_html="";
			$.ajax({
				url:url+"/api/v1/testpaper",
				async:false,
				type:"post",
				data:{
					paper_type:"101",
					user_id:user_id,
					subject_id:subject_id,
					class_id:class_id,
					currentpage:"1",
					showcount:"",
					start_date:start_date,
					end_date:end_date
				},
				success:function(data){
					console.log(data);
					for(var i=0;i<data.data.length;i++){
						tab_html += '<tr><td>'+(i+1)+'</td><td>'+data.data[i].createDate+'</td><td>'+getClassName(data.data[i].classId)+'</td><td>'+data.data[i].name+'</td><td><a onclick="window.top.loading.show();jump($(this));" data-id="'+data.data[i].testpaperId+'" >查看</a></td></tr>'
					}
					$("#tab_body").html(tab_html);
				}
			});
		}
		function jump(obj){
			var id=obj.attr("data-id");
			location.href="paper_view1.do?testpaperId="+id;
		}
		$(".classList").on("click","li",function(){
			$(this).siblings().removeClass("active");
			$(this).addClass("active");
		})
		function getSubjectName(id){
			var subjectName="";
			$.ajax({
				url:url+"/api/v1/subjectcname",
				async:false,
				type:"post",
				data:{id:id},
				success:function(data){
					subjectName=data.data;
				}
			})
			return subjectName;
		}
		function getClassName(id){
			var className="";
			$.ajax({
				url:url+"/api/v1/classname",
				async:false,
				type:"post",
				data:{id:id},
				success:function(data){
					className=data.data;
				}
			})
			return className;
		}
		function tosearch(){
			var start_date=$("#lastStart").val();
			var end_date=$("#lastEnd").val();
			var class_id=$("#dealer_id_2").val();
			getList(start_date,end_date,class_id);
		}
		
	</script>
</html>