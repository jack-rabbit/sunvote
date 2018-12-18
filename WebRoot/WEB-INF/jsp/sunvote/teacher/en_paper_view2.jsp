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
    <title>SunVote-Education Management System</title>

    <!-- Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<link href="../static/css/teach.css" rel="stylesheet">
	<link href="../static/css/paper_view.css?t=1" rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	<style>
		 .analysis table{display:inline-block;vertical-align:middle;}
		 .resolve_box img{vertical-align:top;}
		 .up{width:20px;hiehgt:20px;}
		 .down{width:20px;height:20px;margin-left:10px;}
		 .save_box{width:100%;height:80px;background:#fff;text-align:center;position:fixed;bottom:0;left:0;}
		 .container{height:100%;}
		 .content_report{padding-bottom:80px;min-height:calc(100% - 126px);}
		 .star_box .col-md-6{float:right;}
	</style>
  </head>
  <body>
  <div class="container">
    <div class="page-header">
	  <h3 class="col-md-6" id="paper_title"></h3>
	   <h3 class="col-md-6">Exam Time:<span id="time"></span> Minutes</h3>
		<div class="clearfix"></div>
	</div>
	<div class="content_report">

		<div class="col-md-12 analysis">
			<ul>
				<!--<li>
					<div class="stem">
						<p>1.如图，检测4个足球，其中超过标准质量的克数记为正数，不足标准质量的克数记为负数．从轻重的角度看，最接近标准的是（　　）</p>
					</div>
					<div class="option">
						<ul>
							<li><span>A.</span><img src="images/option_1.png" /></li>
							<li><span>B.</span><img src="images/option_2.png" /></li>
							<li><span>C.</span><img src="images/option_3.png" /></li>
							<li><span>D.</span><img src="images/option_4.png" /></li>
						</ul>
						<div class="clearfix"></div>
					</div>
					<div class="resolve">
					<div class="resolve_box">
						<p>【答案】 A</p>
						<p>【解析】由图数一数，可知总共有7位小同学，其中扎小辫的女孩有2人，男孩有5人。
						故选A。</p>

						<p>【考点】 10以内数的认识</p>
					</div>
					<div class="clearfix"></div>
					</div>

					<div class="star_box">
						<div class="col-md-6"><img src="../static/images/up_ico.png"/><img src="../static/images/down_ico.png"/></div>
						<div class="col-md-6">
							<div class="star">
								<span style="float:left;">难度</span>
								<ul>
									<li class="on"></li>
									<li class="on"></li>
									<li class="off"></li>
									<li class="off"></li>
									<li class="off"></li>
								</ul>
							</div>
							<div class="resolve_click">
								<a  onclick="slide($(this))">查看解析</a>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
				</li> -->
			</ul>
		</div>
		<div class="clearfix"></div>
	</div>

	</div>
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
	<script src="../static/js/echars.js"></script>
	<script src="../static/js/loading.js"></script>
	<script src="../static/js/en_paper_view2.js"></script>
	
</html>





