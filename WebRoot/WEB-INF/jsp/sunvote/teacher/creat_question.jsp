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
	<link rel="stylesheet" href="../static/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link rel="stylesheet" href="../static/css/style.css"/>
	<script type="text/javascript" src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="../static/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
	<div class="page-header">
	  <div class="header_box  container">
		<h1 class="text-center"></h1>
		<div class="btn_group">
			<div class="time text-center" data-toggle="modal" data-target=".test_time"><h3>测验时长：<span class="bg-primary" id="time">45</span><span class="bg-primary">分钟</span></h3></div>
			<div class="pull-left"><h3>总分：<span id='score_all'>0</span> 分</h3></div>
			<div class="btn_box pull-right">
				<input type="button" class="btn btn-success btn-lg" name="save" value="保存" id="save"/>
				<button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target=".fast" id="fast">单选出题</button>
				 <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target=".addQuestion" id="addQuestion">多选出题</button> 	
				<div class="clearfix"></div>
			</div>
		</div>
	  </div>
	</div>

	<div class="content container">
		
	</div>

<!-- 快速出题 -->

<div class="modal fade fast" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">快速出题</h4>
      </div>
      <div class="modal-body">
        <div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">试题答案</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="answer" placeholder="输入题目答案（例如：“ABCDA”）" maxlength="119">
		     
		     <div class="tips" style="color:#f00"></div> 
		    </div>
		    <div class="clearfix"></div>
		</div>
		<div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">选项个数</label>
		    <div class="col-sm-10">
		      <select class="form-control" id="num_ans">
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
		    <label for="inputEmail3" class="col-sm-2 control-label">单题分数</label>
		    <div class="col-sm-10">
		      <input type="number" class="form-control" id="fraction" placeholder="" value="1">
		    </div>
		    <div class="clearfix"></div>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" id="fast_submit">确定</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!--添加试题-->
<div class="modal fade addQuestion" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">添加试题</h4>
      </div>
      <div class="modal-body">
        <!--<div class="form-group">
		     <label for="type" class="col-sm-2 control-label">题目名称</label>
		    <div class="col-sm-10">
		       <select class="form-control" id="type">
					<option value="1" selected>单选题</option>
					<option value="2">完形填空</option>
					<option value="3">阅读理解</option>
					<option value="4">判断题</option>
					<option value="5">多选题</option>
				</select>
		    </div> 
		    <div class="clearfix"></div>
		</div>-->
		<div class="form-group">
		    <label for="index_s_2" class="col-sm-2 control-label">题数</label>
		    <div class="col-sm-10">
		      <input type="number" class="form-control" id="index_s_2" placeholder="请输入题目数量（1-100）"  oninput="if(value.length>3) value=value.slice(0,3)">
		    </div>
		   <!--  <div class="col-sm-1"><span style="line-height:34px;">——</span></div>
		    <div class="col-sm-4">
		      <input type="number" class="form-control" id="index_e_2" placeholder="">
		    </div>-->
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
		    <label for="fraction2" class="col-sm-2 control-label">单题分数</label>
		    <div class="col-sm-10">
		      <input type="number" class="form-control" id="fraction2" value="1" placeholder="请输入单题分数">
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

<!-- 考试时间 -->

<div class="modal fade test_time" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">考试时间</h4>
      </div>
      <div class="modal-body">
        <div class="form-group">
		    <label for="enter_time" class="col-sm-4 control-label">考试时间（分钟）</label>
		    <div class="col-sm-6">
		      <input type="number" class="form-control" id="enter_time" placeholder="输入考试时间">
		    </div>
		    <div class="clearfix"></div>
		</div>
		
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" id="time_submit">确定</button>
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
		
	})
	
	//var testData={"title":"TEST1","exam_time":46,"paper_type":"1","subject_id":"1","grade_id":"1","user_id":"1","score":5,"questions":[{"chapter_id":"0","problem_type_id":"0","knowledge_id":"0","content":"单选","option_num":"","option_content":"","answer":"","difficulty":"","analysis":"","question_from":"","score":1,"part_score":"","remark":"","rank":"1","no_name":"一、","questions":[{"chapter_id":"0","problem_type_id":"0","knowledge_id":"0","content":"","option_num":4,"option_content":"","answer":"A","difficulty":"0","analysis":"","question_from":"1","score":1,"part_score":"0","remark":"","rank":"2","no_name":"1.1"},{"chapter_id":"0","problem_type_id":"0","knowledge_id":"0","content":"","option_num":4,"option_content":"","answer":"B","difficulty":"0","analysis":"","question_from":"1","score":1,"part_score":"0","remark":"","rank":"2","no_name":"1.2"},{"chapter_id":"0","problem_type_id":"0","knowledge_id":"0","content":"","option_num":4,"option_content":"","answer":"C","difficulty":"0","analysis":"","question_from":"1","score":1,"part_score":"0","remark":"","rank":"2","no_name":"1.3"},{"chapter_id":"0","problem_type_id":"0","knowledge_id":"0","content":"","option_num":4,"option_content":"","answer":"D","difficulty":"0","analysis":"","question_from":"1","score":1,"part_score":"0","remark":"","rank":"2","no_name":"1.4"},{"chapter_id":"0","problem_type_id":"0","knowledge_id":"0","content":"","option_num":4,"option_content":"","answer":"A","difficulty":"0","analysis":"","question_from":"1","score":1,"part_score":"0","remark":"","rank":"2","no_name":"1.5"}]}]};
	//var testData={"title":"TEST1","exam_time":46,"paper_type":"1","subject_id":"1","grade_id":"1","user_id":"1","score":5,"questions":[]};
</script>
<script type="text/javascript" src="../static/js/control-604.js?a=2"></script>


</body>
</html>