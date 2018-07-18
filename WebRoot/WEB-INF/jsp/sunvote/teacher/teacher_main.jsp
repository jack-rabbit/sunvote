﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>中天电子-教育管理系统</title>

<!-- Bootstrap -->
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../static/css/teach.css?a=1" rel="stylesheet">
<link href="../static/css/mb_style.css" rel="stylesheet">

<!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
<!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div class="header">
		<div class="logo">
			<img src="../static/images/logo.png" />
		</div>
		<div class="out">
			<a href="../logout"><img src="../static/images/close.png" />退出登录</a>
		</div>
		<div class="clear"></div>
	</div>
	<div class="content">
		<div class="content_l">
			<div class="info_tab">
				<div class="head_pic">
					<img src="../static/images/head_defult.png" />
				</div>
				<div class="name">
					<p>欢迎！</p>
					<p id="name">${pd.TEACHER[0].TEACHER_NAME }</p>
					<p id="school">${pd.TEACHER[0].SCHOOL_NAME }</p>
				</div>
			</div>
			<div class="class tab1">
				<p>
					班级管理<span class="right jiao"></span>
				</p>
				<ul>
					<c:forEach items="${pd.TEACHER}" var="var" varStatus="vs">
						<li onclick="event.stopPropagation();chooseClass('${var.CLASS_ID}','${var.TERM_ID}')">${var.GRADE_NAME}${var.SUBJECT_NAME}
								<span>${var.CLASS_NAME}</span>
						</li>
			</c:forEach>

			</ul>
		</div>
		<div class="testpaper tab1">
			<p>
				试卷管理<span class="right jiao"></span>
			</p>
		</div>
		<div class="analyse tab1">
			<p>
				测验分析<span class="right jiao"></span>
			</p>
			<ul>
			<c:forEach items="${pd.TEACHER}" var="var" varStatus="vs">
				<li onclick="event.stopPropagation();report('${var.CLASS_ID}')">${var.CLASS_NAME} 成绩</li>
			</c:forEach>
			</ul>
		</div>
	</div>
	<div class="content_r">
		<iframe name="mainFrame" id="mainFrame" frameborder="0" src="../paper/list2.do?" width="100%" height="100%"></iframe>
		
	</div>

	<div class="modal fade title_time" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document" style="z-index:1400">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">新建试卷</h4>
	      </div>
	      <div class="modal-body">
	        <div class="form-group">
			    <label for="enter_title" class="col-sm-4 control-label">测验标题</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="enter_title" placeholder="输入测验标题">
			    </div>
			    <div class="clearfix"></div>
			</div>
	        <div class="form-group">
			    <label for="enter_time" class="col-sm-4 control-label">测验时长（分钟）</label>
			    <div class="col-sm-6">
			      <input type="number" class="form-control" id="enter_time" placeholder="输入测验时长">
			    </div>
			    <div class="clearfix"></div>
			</div>
			
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" id="time_submit">确定</button>
	        <button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
	<script
		src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="../static/js/model.js"></script>
	<script src="../static/js/loading.js"></script>
	<script src="../static/js/remove.js?a=2"></script>
	<script src="../static/js/dailog.js"></script>
	<script type="text/javascript">
		function chooseClass(classID,termID){
			var path = "../student/listcs.do?class_id=" + classID + "&term_id=" + termID ;
			//$(".content_r").html('<iframe name="mainFrame" id="mainFrame" frameborder="0" style="width:100%;height:'+$(".content_l").height()+'px;" src=' + path + '></iframe>');
			$("#mainFrame").attr('src',path);
		}
		
		function report(classId){
			//window.open('<%=basePath%>report/report.do?classid=' + classId);
			$("#mainFrame").attr('src','<%=basePath%>report/report.do?classid=' + classId);
		}
		
		$("#time_submit").click(function(){
			var name = $("#enter_title").val();
			var time = $("#enter_time").val();
			if(name != null&& name != '' && time != null && time != ''){
				self.location.href = "<%=basePath%>" + "paper/npaper.do?" + "name=" + name + "&time=" + time ;
				$(".title_time").modal("hide");
			}
		});
		
		$(".testpaper").click(function (){
			var path = "../paper/list2.do?" ;
			//$(".content_r").html('<iframe name="mainFrame" id="mainFrame" frameborder="0" style="width:100%;height:'+$(".content_l").height()+'px;" src=' + path + '></iframe>');
			$("#mainFrame").attr('src',path);
		});
	</script>
</body>
</html>