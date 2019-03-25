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
<style>
	.edit_btn{
		width:20%;
		margin:0 auto;
	}
	.edit_btn .edit_btn_sty{
		outline-style: none;
	    color: rgb(255, 255, 255);
	    margin-right: 20px;
	    margin-top:10%;
	    font-size: 16px;
	    background: #f29c9f;
	    text-decoration: none;
	    border-width: initial;
	    border-style: none;
	    border-color: initial;
	    border-image: initial;
	    padding: 10px 15px;
	    width:100%;
	}
	.edit_btn .save_btn_sty{
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
	    padding: 10px 15px;
	    width:100%;
	}
	.school_info .col-sm-4{
		width:100px;
		padding-right:0;
		line-height:34px;
		font-size:16px;
	}
</style>
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
	<form action="school/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
		<div class="head_box" style="position:relative;">
			<div class="box_header">
				<div class="head_box_l">
					<p>
						<span class="right_b"></span>学校管理
					</p>
				</div>
				<div class="head_box_r">
					
				</div>
				<div class="clear"></div>
			</div>
		</div>
					
		<div class="col-md-6 school_info" style="margin-left:25%;margin-top:5%;">
			<div class="form-group">
			    <label for="enter_title" class="col-sm-4 control-label">学校名称:</label>
			    <div class="col-sm-8">
			      <input type="text" class="form-control" disabled placeholder="输入学校名称"  maxlength="100" minlength="1"  name="NAME" id="NAME" value="${pd.NAME}">
			    </div>
			    <div class="clearfix"></div>
			</div>
	       
	        <div class="form-group">
			    <label for="enter_time" class="col-sm-4 control-label">学校地址:</label>
			    <div class="col-sm-8">
			      <input type="text" class="form-control" disabled placeholder="输入学校地址"  name="ADDRESS" id="ADDRESS" value="${pd.ADDRESS}" maxlength="255" >
			    </div>
			    <div class="clearfix"></div>
			</div>
			 <div class="form-group">
			    <label for="enter_time" class="col-sm-4 control-label">校长:</label>
			    <div class="col-sm-8">
			      <input type="text" class="form-control" disabled placeholder="输入校长名称" name="PRESIDENT" id="PRESIDENT" value="${pd.PRESIDENT}" maxlength="255" >
			    </div>
			    <div class="clearfix"></div>
			</div>
			 <div class="form-group">
			    <label for="enter_time" class="col-sm-4 control-label">联系电话:</label>
			    <div class="col-sm-8">
			      <input type="text" class="form-control" disabled placeholder="输入联系电话" name="PHONE" id="PHONE" value="${pd.PHONE}" maxlength="255" >
			    </div>
			    <div class="clearfix"></div>
			</div>
			 <div class="form-group">
			    <label for="enter_time" class="col-sm-4 control-label">备注:</label>
			    <div class="col-sm-8">
			      <input type="text" class="form-control" disabled placeholder="输入备注"  name="REMARK" id="REMARK"  value="${pd.REMARK}" maxlength="255" >
			    </div>
			    <div class="clearfix"></div>
			</div>
			
		</div>
		<div class="clearfix"></div>
	    
			<div class="edit_btn">
				<input type="button" class="edit_btn_sty" data-state="edit" id="btn" value="修改" />
			</div>					
		</form>



	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
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
				$("#Form").submit();
				$(".form-control").attr("disabled","disabled");
				$("#btn").val("修改");
				$(this).attr({"class":"edit_btn_sty","data-state":"edit"});
			}
		})
			

		</script>
</body>
</html>