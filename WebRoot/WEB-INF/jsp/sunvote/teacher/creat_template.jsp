<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>

<html lang="en">
<head>
	<title>创建试卷</title>
	<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="../static/css/bootstrap.min.css">
	<link rel="stylesheet" href="../static/css/style.css"/>
	<script type="text/javascript" src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="../static/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="page-header">
	  <div class="header_box  container" style="display:block;">
		<h1 class="text-center">&nbsp;</h1>
		<div class="btn_group">
			<div class="pull-left"><h3>总分：<span id='score_all'>0</span> 分</h3></div>
			<div class="btn_box pull-right">
				<button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target=".addQuestion" id="fast">添加</button>
				<input type="button" class="btn btn-success btn-lg" name="save" value="保存" id="save"/>
				<!-- <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target=".fast" id="fast">单选出题</button>
				 <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target=".addQuestion" id="addQuestion">多选出题</button> --> 	
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
		</div>
	  </div>
	</div>

	<div class="content container">
		
	</div>



<!--添加试题-->
<div class="modal fade addQuestion" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">添加试题</h4>
      </div>
     
      
      <div class="modal-body">
		<div class="form-group">
		    <label for="type" class="col-sm-2 control-label">题型</label>
		    <div class="col-sm-10">
		      <select class="form-control" id="type">
					<option value="1">单选题</option>
					<option value="2">多选题</option>
				</select>
		    </div>
		    <div class="clearfix"></div>
		</div>
		<div class="form-group">
		    <label for="num_ans_2" class="col-sm-2 control-label">选项个数</label>
		    <div class="col-sm-10">
		      <select class="form-control" id="num_ans_2">
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4" selected>4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
				</select>
		    </div>
		    <div class="clearfix"></div>
		</div>
		<div class="form-group">
		    <label for="index_s_2" class="col-sm-2 control-label">题目数</label>
		    <div class="col-sm-10">
		      <input type="number" class="form-control" id="index_s_2" placeholder="输入题目数量" maxlength="119">
		     
		     <div class="tips" style="color:#f00"></div> 
		    </div>
		    <div class="clearfix"></div>
		</div>
		<div class="form-group">
		    <label for="fraction2" class="col-sm-2 control-label">单题分数</label>
		    <div class="col-sm-10">
		      <input type="number" class="form-control" id="fraction2" placeholder="" value="1">
		    </div>
		    <div class="clearfix"></div>
		</div>
      </div>
      
      
      <div class="modal-footer">
         <button type="button" class="btn btn-default" id="addQuestion_submit">确定</button>
         <button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<div class="loading" style="background:rgba(0,0,0,0.5);width:100%;height:100%;position:fixed;top:0;display:none;">
	<img src="../static/images/loading.gif" width="200px" style="position:absolute;top:0;bottom:0;left:0;right:0;margin:auto;"/>
</div>
<script>
	var testData = ${pd.JSON};
	var template = ${TEMPLEATE == null ? "[]" : TEMPLEATE.CONTENT};
	var URL = "<%=basePath%>api/v1/uploadpaper";
	var JUMP_URL = "<%=basePath%>/${JUMP_URL}";  
	if(testData.questions.length>0){
		var title = testData.title;
		if(title == null || title == ''){
			title = "浏览试卷";
		}
		$("title").html(title);
	}
	$(document).ready(function(){
		var _height = $(".page-header").height();
		$(".content").css("padding-top",_height);
		
	});
	
	
	
	//var testData={"title":"TEST1","exam_time":46,"paper_type":"1","subject_id":"1","grade_id":"1","user_id":"1","score":5,"questions":[{"chapter_id":"0","problem_type_id":"0","knowledge_id":"0","content":"单选","option_num":"","option_content":"","answer":"","difficulty":"","analysis":"","question_from":"","score":1,"part_score":"","remark":"","rank":"1","no_name":"一、","questions":[{"chapter_id":"0","problem_type_id":"0","knowledge_id":"0","content":"","option_num":4,"option_content":"","answer":"A","difficulty":"0","analysis":"","question_from":"1","score":1,"part_score":"0","remark":"","rank":"2","no_name":"1.1"},{"chapter_id":"0","problem_type_id":"0","knowledge_id":"0","content":"","option_num":4,"option_content":"","answer":"B","difficulty":"0","analysis":"","question_from":"1","score":1,"part_score":"0","remark":"","rank":"2","no_name":"1.2"},{"chapter_id":"0","problem_type_id":"0","knowledge_id":"0","content":"","option_num":4,"option_content":"","answer":"C","difficulty":"0","analysis":"","question_from":"1","score":1,"part_score":"0","remark":"","rank":"2","no_name":"1.3"},{"chapter_id":"0","problem_type_id":"0","knowledge_id":"0","content":"","option_num":4,"option_content":"","answer":"D","difficulty":"0","analysis":"","question_from":"1","score":1,"part_score":"0","remark":"","rank":"2","no_name":"1.4"},{"chapter_id":"0","problem_type_id":"0","knowledge_id":"0","content":"","option_num":4,"option_content":"","answer":"A","difficulty":"0","analysis":"","question_from":"1","score":1,"part_score":"0","remark":"","rank":"2","no_name":"1.5"}]}]};
	//var testData={"title":"TEST1","exam_time":46,"paper_type":"1","subject_id":"1","grade_id":"1","user_id":"1","score":5,"questions":[]};
</script>
<script type="text/javascript" src="../static/js/control_template.js?a=3"></script>


</body>
</html>