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
					<p id="school">${SNAME }</p>
					<p id="name">${SNAME } 管理员</p>
					</br></br>
				</div>
			</div>
			<div class="class tab1">
				<p>
					年级管理<span class="right jiao"></span>
				</p>
				<ul class="menu_1">
					<c:forEach items="${gradeInfos}" var="var" varStatus="vs">
						<li onclick="event.stopPropagation();chooseListClass('${var.SCHOOL_ID}','${var.GRADE_ID}')">
							<p>${ var.GNAME }</p>
						</li>
			</c:forEach>

			</ul>
		</div>
		<%-- <div class="class tab1">
				<p>
					科目管理<span class="right jiao"></span>
				</p>
				<ul class="menu_1">
					<c:forEach items="${subjectInfos}" var="var" varStatus="vs">
						<li onclick="event.stopPropagation();"><p>${var.SCNAME}</p>
						</li>
			</c:forEach>

			</ul>
		</div> --%>
			<div class="class tab1">
				<p>
					任课管理<span class="right jiao"></span>
				</p>
				<ul class="menu_1">
					<li onclick="event.stopPropagation();subject('${SCHOOL_ID}')"><p>科目管理</p></li>
					<li onclick="event.stopPropagation();coursemanager('${SCHOOL_ID}')"><p>任课管理</p></li>
					<li onclick="event.stopPropagation();teacher('${SCHOOL_ID}')"><p>教师管理</p></li>
			</ul>
		</div>
		<div class="testpaper tab1">
			<p>试卷管理<span class="right jiao"></span></p>
				<ul class="menu_1">
					<li >
						<p >轻松考试卷管理</p>
						<ul class="menu_2">
							<li ><p id="new_paper">出卷</p></li>
							<li ><p id="qingsongkao_paper">查看所有试卷</p></li>
							
						</ul>
					</li>
					<li>
						<p id="jishice_paper">即时测试卷管理</p>
					</li>
				</ul>
			
		</div>
		<div class="analyse tab1">
			<p>
				测验分析<span class="right jiao"></span>
			</p>
			
			<ul class="menu_1">
					<li >
						<p>轻松考统考</p>
					</li>
					<li >
						<p>轻松考班级情况</p>
						<ul class="menu_2">
							<c:forEach items="${gradeInfos}" var="var" varStatus="vs">
								<c:forEach items="${var.classInfos}" var="var1" varStatus="vs1">
									<li onclick="event.stopPropagation();report('${var1.ID}')">
										<p>${ var1.CLASS_NAME }</p>
									</li>
								</c:forEach>
							</c:forEach>
						</ul>
					</li>
					<li>
						<p>即时测测验分析</p>
							<ul class="menu_2">
							<c:forEach items="${gradeInfos}" var="var" varStatus="vs">
								<c:forEach items="${var.classInfos}" var="var1" varStatus="vs1">
									<li onclick="event.stopPropagation();report2('${var1.ID}')">
										<p>${ var1.CLASS_NAME }</p>
									</li>
								</c:forEach>
							</c:forEach>
						</ul>
					</li>
				</ul>
		</div>
		<div class="analyse tab1">
			<p>
				系统设置<span class="right jiao"></span>
			</p>
			
			<ul class="menu_1">
					<li >
						<p>学校设置</p>
						
					</li>
					<li>
						<p >年级设置</p>
					</li>
					<li>
						<p>年级升级</p>
					</li>
					<li>
						<p>其他配置</p>
					</li>
				</ul>
		</div>
	</div>
	<div class="content_r">
		<iframe name="mainFrame" id="mainFrame" frameborder="0" width="100%" height="100%"></iframe>
		
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
			      <input type="text" class="form-control" id="enter_title" placeholder="输入测验标题（不能超过100个字符）"  maxlength="100" minlength="1">
			    </div>
			    <div class="clearfix"></div>
			</div>
	       
	        <div class="form-group">
			    <label for="enter_time" class="col-sm-4 control-label">测验时长（分钟）</label>
			    <div class="col-sm-6">
			      <input type="number" class="form-control" id="enter_time" placeholder="输入测验时长（单位：分钟）" maxlength="3" oninput="if(value.length>3) value=value.slice(0,3)">
			    </div>
			    <div class="clearfix"></div>
			</div>
			 <div class="form-group">
			    <label for="enter_time" class="col-sm-4 control-label">年级</label>
			    <div class="col-sm-6">
			      <select class="chosen-select form-control" name="grade_id" id="grade_id" data-placeholder="这里输入所属学校">
						<c:forEach items="${gradeInfos}" var="var" varStatus="vs">
							<option value="${var.GRADE_ID}">${var.GNAME}</option>
						</c:forEach>
				</select>
			    </div>
			    <div class="clearfix"></div>
			</div>
			 <div class="form-group">
			    <label for="enter_time" class="col-sm-4 control-label">科目</label>
			    <div class="col-sm-6">
			      <select class="chosen-select form-control" name="subject_id" id="subject_id" data-placeholder="这里输入所属学校">
						<c:forEach items="${subjectInfos}" var="var" varStatus="vs">
							<option value="${var.SUBJECT_ID}">${var.SCNAME}</option>
						</c:forEach>
				</select>
			    </div>
			    <div class="clearfix"></div>
			</div>
			 <div class="form-group">
			    <label for="enter_time" class="col-sm-4 control-label">模板</label>
			    <div class="col-sm-6">
			      <select class="chosen-select form-control" name="TEMPLATE_ID" id="TEMPLATE_ID" data-placeholder="这里输入所属学校">
			      		<option value="">自定义</option>
						<c:forEach items="${templateInfos}" var="var" varStatus="vs">
							<option value="${var.PAGETEMPLATE_ID}">${var.NAME}</option>
						</c:forEach>
				</select>
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
	
		var schoolId = '${SCHOOL_ID}';
		function subject(school_id){
			var path = "../subject/listcs.do?school_id=" + school_id ;
			//if($("#mainFrame").attr('src') != (path)){
				$("#mainFrame").attr('src',path);
				window.top.loading.show();
			//}
		}
	
		function coursemanager(school_id){
			var path = "../coursemanagement/listcs.do?school_id=" + school_id ;
			//if($("#mainFrame").attr('src') != (path)){
				$("#mainFrame").attr('src',path);
				window.top.loading.show();
			//}
		}
		function teacher(school_id){
			var path = "../teacher/listcs.do?school_id=" + school_id ;
			if($("#mainFrame").attr('src') != (path)){
				$("#mainFrame").attr('src',path);
				window.top.loading.show();
			}
		}
	
		function chooseListClass(school_id,gradle_id){
			var path = "../sclass/listcs.do?school_id=" + school_id + "&grade_id=" + gradle_id ;
			$("#mainFrame").attr('src',path);
			window.top.loading.show();
		}
		
		function report(classId){
			//window.open('<%=basePath%>report/report.do?role=admin&classid=' + classId);
				$("#mainFrame").attr('src','<%=basePath%>report/report.do?role=admin&classid=' + classId);
				window.top.loading.show();
		}
		function report2(classId){
			//window.open('<%=basePath%>report/report.do?classid=' + classId);
			//if($("#mainFrame").attr('src') != ('<%=basePath%>report/report.do?classid=' + classId)){
			//	$("#mainFrame").attr('src','<%=basePath%>teacher/test_list.do?classid=' + classId);
			//	window.top.loading.show();
			//}
		}
		
		$("#time_submit").click(function(){
			var name = $("#enter_title").val();
			var time = $("#enter_time").val();
			var grade_id = $("#grade_id").val();
			var subject_id = $("#subject_id").val();
			if(name != null&& name != '' && time != null && time != ''){
				var itime = parseInt(time);
				if(itime > 0 && itime <= 300){
					self.location.href = "<%=basePath%>" + "paper/npaper.do?paper_type=2&" + "name=" + name + "&grade_id=" + grade_id +"&subject_id=" + subject_id + "&school_id=" + schoolId + "&time=" + time ;
					$(".title_time").modal("hide");
				}else{
					alert("请输入正确的时间，时间不能超过300分钟");
				}
			}
		});
		
		$("#qingsongkao_paper").click(function (){
			var path = "../paper/list4.do?school_id=" + schoolId ;
			//$(".content_r").html('<iframe name="mainFrame" id="mainFrame" frameborder="0" style="width:100%;height:'+$(".content_l").height()+'px;" src=' + path + '></iframe>');
			$("#mainFrame").attr('src',path);
			window.top.loading.show();
		});
		
		$("#new_paper").click(function (){
			var path = "../paper/list5.do?school_id=" + schoolId ;
			//$(".content_r").html('<iframe name="mainFrame" id="mainFrame" frameborder="0" style="width:100%;height:'+$(".content_l").height()+'px;" src=' + path + '></iframe>');
			$("#mainFrame").attr('src',path);
			window.top.loading.show();
		});
		
		$("#jishice_paper").click(function (){
			var path = "../teacher/teach_paper.do?school_id=" + schoolId;
			//if($("#mainFrame").attr('src') != (path)){
		//		$("#mainFrame").attr('src',path);
		//		window.top.loading.show();
			//}
		});
		
		var defaultUrl = '${pd.DEFAULTURL}' ;
		if(defaultUrl != '' && defaultUrl != ''){
			$("#mainFrame").attr('src',defaultUrl);
		}
	</script>
</body>
</html>