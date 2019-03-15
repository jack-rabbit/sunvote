<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<link href="static/css/teach.css" rel="stylesheet">
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
<link rel="stylesheet" type="text/css" href="static/css/jquery.datetimepicker.css"/>
<style>
	 .col-sm-4{
		width:100px;
		padding-right:0;
		line-height:34px;
		font-size:16px;
	}
	.edit_btn{
		width:20%;
		margin:0 auto;
	}
	.form-group{margin-top:15px;margin-bottom:0;}
	.edit_btn .btn_sty{
		outline-style: none;
	    color: rgb(255, 255, 255);
	    margin-right: 20px;
	    margin-top:10%;
	    font-size: 16px;
	    background: rgb(59, 194, 214);
	    text-decoration: none;
	    border-width: initial;
	    border-style: none;
	    border-color: initial;
	    border-image: initial;
	    padding: 5px 10px;
	    width:100%;
	}
	.section{border:1px solid #ccc;padding:20px;position:relative;margin-top:40px;}
	.section h2{margin:0;position:absolute;top:-11px;background:#fff;display:inline-block;padding:0 10px;font-size:20px;font-weight:bold;}
</style>
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
		<div class="head_box" style="position:relative;">
			<div class="box_header">
				<div class="head_box_l">
					<p>
						<span class="right_b"></span>其他设置
					</p>
				</div>
				<div class="head_box_r">
					
				</div>
				<div class="clear"></div>
			</div>
		</div>
					
		<div class="col-md-6" style="margin-left:25%;margin-top:5%;">
			<!-- <div class="form-group">
			    <label for="enter_title" class="col-sm-4 control-label">备份地址:</label>
			    <div class="col-sm-8">
			      <input type="text" class="form-control" id="enter_title"  placeholder="输入学校名称"  maxlength="100" minlength="1" value="${pd.NAME}">
			    </div>
			    <div class="clearfix"></div>
			</div> -->
	       <div class="section section1">
	       		<h2>数据备份</h2>
	       		<div class="form-group">
				    <label for="enter_title" class="col-sm-4 control-label">备份地址:</label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control" id="enter_title"  placeholder="输入备份地址"  maxlength="100" minlength="1" value="${pd.NAME}">
				    </div>
				    <div class="clearfix"></div>
				</div>
				<div class="edit_btn">
					<input type="button" class="btn_sty" id="btn" value="备份" />
				</div>
	       </div>
	        <div class="section section2">
	       		<h2>数据还原</h2>
	       		<div class="form-group">
				    <label for="enter_title" class="col-sm-4 control-label">还原地址:</label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control" id="enter_title"  placeholder="输入还原地址"  maxlength="100" minlength="1" value="${pd.NAME}">
				    </div>
				    <div class="clearfix"></div>
				</div>
				<div class="edit_btn">
					<input type="button" class="btn_sty" id="btn" value="还原" />
				</div>
	       </div>
	        <div class="section section3">
	       		<h2>定时备份设置</h2>
	       		<div class="form-group">
				    <label for="enter_title" class="col-sm-4 control-label">周期:</label>
				    <div class="col-sm-8">
				       <select class="chosen-select form-control" name="grade_id" id="grade_id" data-placeholder="这里输入所属学校">
								<option value="1">每年</option>
								<option value="2">每月</option>
								<option value="3">每周</option>
								<option value="4">每日</option>
						</select>
				    </div>
				    <div class="clearfix"></div>
				</div>
				<div class="form-group">
				    <label for="enter_title" class="col-sm-4 control-label">时间</label>
				    <div class="col-sm-8">
				       <input type="text" class="form-control" id="datetimepicker"  placeholder="输入时间"  maxlength="100" minlength="1" value=""/>
				    </div>
				    <div class="clearfix"></div>
				</div>
				<div class="edit_btn">
					<input type="button" class="btn_sty" id="btn" value="保存" />
				</div>
	       </div>
			
		</div>
					
		



	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!-- 时间选择 -->
	<script src="static/js/jquery.datetimepicker.full.js"></script>
		<script type="text/javascript">
		$(document).ready(function(){
			window.top.loading.remove();	
		});
		
		$("#btn").click(function(){
			var state=$(this).attr("data-state");
			if(state=="edit"){
				$(".form-control").removeAttr("disabled");
				$("#btn").val("保存");
				$(this).attr({"class":"save_btn_sty","data-state":"save"});
			}else if(state=="save"){
				$(".form-control").attr("disabled","disabled");
				$("#btn").val("修改");
				$(this).attr({"class":"edit_btn_sty","data-state":"edit"});
			}
		})
			
		//时间选择
		$.datetimepicker.setLocale('ch');
		$('#datetimepicker').datetimepicker({
		dayOfWeekStart : 1,
		lang:'ch',
		disabledDates:['1986/01/08','1986/01/09','1986/01/10'],
		startDate:	'1986/01/05'
		});
		
		$('#datetimepicker').datetimepicker({value:'2015/04/15 05:03',step:10});
		</script>
</body>
</html>