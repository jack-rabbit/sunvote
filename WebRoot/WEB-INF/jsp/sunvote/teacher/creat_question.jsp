<!DOCTYPE html>
<html>
<head>
	<title>创建试卷</title>
	<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link rel="stylesheet" href="../static/css/style.css"/>
	<script type="text/javascript" src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
	<div class="page-header">
	  <div class="header_box  container">
		<h1 class="text-center"></h1>
		<div class="btn_group">
			<div class="time text-center" data-toggle="modal" data-target=".test_time"><h3>测验时长：<span class="bg-primary" id="time">45</span><span class="bg-primary">分钟</span></h3></div>
			<div class="btn_box pull-right">
				<input type="button" class="btn btn-success btn-lg" name="save" value="保存" id="save"/>
				<button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target=".fast" id="fast">快速出题</button>
				<!-- <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target=".addQuestion" id="addQuestion">添加试题</button> -->	
				<div class="clearfix"></div>
			</div>
		</div>
	  </div>
	</div>

	<div class="content container">
		<!--<div class="section section-1">
			<div class="title">
				<h3>一、单选</h3>
				<input type="button" class="btn btn-danger pull-right remove" name="remove" value="删除" />
			</div>
			<div class="question_list">
				 <div class="question question1">
					<span>1、</span>
					<ul>
						<li class="btn btn-default on">A</li>
						<li class="btn btn-default">B</li>
						<li class="btn btn-default">C</li>
						<li class="btn btn-default">D</li>
					</ul>
				</div>
				<div class="question question2">
					<span>2、</span>
					<ul>
						<li class="btn btn-default">A</li>
						<li class="btn btn-default on">B</li>
						<li class="btn btn-default">C</li>
						<li class="btn btn-default">D</li>
					</ul>
				</div> 
			</div>
		</div>-->
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
		      <input type="text" class="form-control" id="answer" placeholder="输入题目答案，以分号隔开">
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
				</select>
		    </div>
		    <div class="clearfix"></div>
		</div>
		<div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">单题分数</label>
		    <div class="col-sm-10">
		      <input type="number" class="form-control" id="fraction" placeholder="">
		    </div>
		    <div class="clearfix"></div>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" id="fast_submit">确定</button>
        <button type="button" class="btn btn-primary" data-dismiss="fast">取消</button>
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
        <div class="form-group">
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
		</div>
		<div class="form-group">
		    <label for="index_s_2" class="col-sm-2 control-label">题号</label>
		    <div class="col-sm-4">
		      <input type="number" class="form-control" id="index_s_2" placeholder="">
		    </div>
		    <div class="col-sm-1"><span style="line-height:34px;">——</span></div>
		    <div class="col-sm-4">
		      <input type="number" class="form-control" id="index_e_2" placeholder="">
		    </div>
		    <div class="clearfix"></div>
		</div>
		<div class="form-group">
		    <label for="answer_2" class="col-sm-2 control-label">试题答案</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="answer_2" placeholder="输入题目答案，以分号隔开">
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
				</select>
		    </div>
		    <div class="clearfix"></div>
		</div>
		<div class="form-group">
		    <label for="fraction2" class="col-sm-2 control-label">单题分数</label>
		    <div class="col-sm-10">
		      <input type="number" class="form-control" id="fraction2" placeholder="">
		    </div>
		    <div class="clearfix"></div>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" id="addQuestion_submit">确定</button>
        <button type="button" class="btn btn-primary" data-dismiss="addQuestion">取消</button>
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
        <button type="button" class="btn btn-primary" data-dismiss="test_time">取消</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script>
	var testData = ${pd.JSON};
	//var testData={"title":"TEST1","exam_time":46,"paper_type":"1","subject_id":"1","grade_id":"1","user_id":"1","score":5,"questions":[{"chapter_id":"0","problem_type_id":"0","knowledge_id":"0","content":"单选","option_num":"","option_content":"","answer":"","difficulty":"","analysis":"","question_from":"","score":1,"part_score":"","remark":"","rank":"1","no_name":"一、","questions":[{"chapter_id":"0","problem_type_id":"0","knowledge_id":"0","content":"","option_num":4,"option_content":"","answer":"A","difficulty":"0","analysis":"","question_from":"1","score":1,"part_score":"0","remark":"","rank":"2","no_name":"1.1"},{"chapter_id":"0","problem_type_id":"0","knowledge_id":"0","content":"","option_num":4,"option_content":"","answer":"B","difficulty":"0","analysis":"","question_from":"1","score":1,"part_score":"0","remark":"","rank":"2","no_name":"1.2"},{"chapter_id":"0","problem_type_id":"0","knowledge_id":"0","content":"","option_num":4,"option_content":"","answer":"C","difficulty":"0","analysis":"","question_from":"1","score":1,"part_score":"0","remark":"","rank":"2","no_name":"1.3"},{"chapter_id":"0","problem_type_id":"0","knowledge_id":"0","content":"","option_num":4,"option_content":"","answer":"D","difficulty":"0","analysis":"","question_from":"1","score":1,"part_score":"0","remark":"","rank":"2","no_name":"1.4"},{"chapter_id":"0","problem_type_id":"0","knowledge_id":"0","content":"","option_num":4,"option_content":"","answer":"A","difficulty":"0","analysis":"","question_from":"1","score":1,"part_score":"0","remark":"","rank":"2","no_name":"1.5"}]}]};
	//var testData={"title":"TEST1","exam_time":46,"paper_type":"1","subject_id":"1","grade_id":"1","user_id":"1","score":5,"questions":[]};
</script>
<script type="text/javascript" src="../static/js/control.js"></script>


</body>
</html>