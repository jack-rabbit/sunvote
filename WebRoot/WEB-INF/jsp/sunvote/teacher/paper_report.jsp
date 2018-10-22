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
    <title>中天电子-教育管理系统</title>

    <!-- Bootstrap -->
    <link href="../static/css/bootstrap.min.css" rel="stylesheet">
	<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://lib.sinaapp.com/js/bootstrap/3.0.0/js/bootstrap.min.js"></script>

   
	<style>
    body{ background-color: #fff ;}
		::-webkit-scrollbar-track {
		background-color: #F5F5F5;
	}

	::-webkit-scrollbar {
		width: 6px;
		background-color: #F5F5F5;
	}

	::-webkit-scrollbar-thumb {
		 background-color: #999; 
	}
	.tr-link:hover { cursor: pointer; }

    </style>
  </head>
  <body>
  <div class="container">
    <div class="page-header">
	  <h3 class="col-md-6" id="paper_title"></h3>
	  <!--  <h3 class="col-md-6">考试时间：<span id="time"></span></h3> -->
		<div class="clearfix"></div>
	</div>
	<div class="container column" >
		<div class="tabs-container">
			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#tab-1" aria-expanded="true"> 知识点统计报表</a>
				</li>
				<li class=""><a data-toggle="tab" href="#tab-2" aria-expanded="false">难度统计报表</a>
				</li>
			</ul>
			<div class="tab-content">
				<div id="tab-1" class="tab-pane active">
				  <div class="col-md-8">
					<div class="panel-body">
						<table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>姓名</th>
                                    <th>知识点</th>
                                    <th>正确率</th>
                                    <th>班级平均正确率</th>
                                </tr>
                            </thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty knowadgeStudentList}">
												<c:forEach items="${knowadgeStudentList}" var="var" varStatus="vs">
													<tr class="tr-link" onclick="knowadge('${var.STUDENT_NAME}')">
														<td>${vs.index+1}</td>
														<td>${var.STUDENT_NAME}</td>
														<td>${var.KNOWLEDGE_NAME}</td>
														<td>${var.RIGHT_PERSENT}%</td>
														<td>${knowadgeClassList[vs.index % knowadgeClassListSize].RIGHT_PERSENT}%</td>
													</tr>
													
												</c:forEach>
											</c:when>
										</c:choose>
									</tbody>
								</table>						
					</div>
				  </div>
				  <div class="col-md-4">
					 <div class="echarts" id="echarts-radar-chart" style="height: 300px;width:100%"></div>
				  </div>
				</div>
				<div id="tab-2" class="tab-pane">
				     <div class="col-md-8">
					<div class="panel-body">
						<table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>姓名</th>
                                    <th>难度系数</th>
                                    <th>正确率</th>
                                     <th>班级平均正确率</th>
                                </tr>
                            </thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty diffcultStudentList}">
												<c:forEach items="${diffcultStudentList}" var="var" varStatus="vs">
													<tr class="tr-link" onclick="diffcult(${vs.index})">
														<td>${vs.index+1}</td>
														<td>${var.NAME}</td>
														<td>${var.DIFFICULTY == 0 ? "无" : var.DIFFICULTY == 1 ? "*" : var.DIFFICULTY == 2 ? "**" : var.DIFFICULTY == 3 ? "***" : var.DIFFICULTY == 4 ? "****" : var.DIFFICULTY == 5 ? "*****" : "其他"}</td>
														<td>${var.RIGHT_PERSENT}%</td>
														<td>${diffcultClassList[vs.index % diffcultClassListSize].RIGHT_PERSENT}%</td>
													</tr>
													
												</c:forEach>
											</c:when>
										</c:choose>
									</tbody>
								</table>						
					</div>
				  </div>
				  <div class="col-md-4">
					 <div class="echarts" id="echarts-radar-chart1" style="height: 300px;width:100%"></div>
				  </div>
				</div>
			</div>


		</div>
	</div>
	
	</div>
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
	<script src="../static/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<!-- ECharts -->
    <script src="../static/js/echarts-all.js"></script>
	<!-- 自定义js -->
    <script src="../static/js/echarts-demo.js?a=2"></script>
	<script>
		$(document).ready(function(){
			window.top.loading.remove();
			});
	</script>
	
</html>





