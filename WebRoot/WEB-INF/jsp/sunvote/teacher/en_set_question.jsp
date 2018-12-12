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
	<link href="../static/css/set_quetion.css?t=12" rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	<style>
		table{display:inline-block;vertical-align: middle;}
		.resolve_box img{vertical-align:top;}
	</style>
  </head>
  <body>
  <div class="col-md-12">
	<div class="col-md-3 left_menu">
		<div class="tab">
			<ul>
				<li  data-index=0><p>Sync Textbook</p></li>
				<li class="active" data-index=1><p>Knowledge Point</p></li>
				<div class="clearfix"></div>
			</ul>
		</div>
		<div class="choose_book">
			<div class="book"><p><span id="book_name">Western Normal University/Grade 1-A</span></p><img src="../static/images/down_arrow.png" /><div class="clearfix"></div></div>
			<div class="book_box">
				<ul>
					<!--教材版本列表-->
				</ul>
				
			</div>
		</div>
		<div class="section">
			<ul>
				<!--左侧菜单列表-->
			</ul>
		</div>
	</div>
	<div class="col-md-9 right_content">

		<div class="question_box">
			<ul>				
				<!--题目列表-->
			</ul>
			<div class="view_more">
				<p>Click to view more<span>︾</span></p>
			</div>
		</div>
	</div>
	</div>
	<div class="basket">
		<div class="basket_box">
			<p class="col-md-4">Selected:<span id="all_que_num">0</span></p>
			<p class="col-md-8"><input type="button" value="Clear"  class="btn btn-danger clear_que"/><button type="button" class="btn btn-primary btn-lg topic" >
Complete question selection
</button></p>
		</div>
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
		<div class="modal-content">
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title">Complete question selection</h4>
		  </div>
		  <div class="modal-body">
			<form class="form-horizontal">
			  <div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">Exam paper title</label>
				<div class="col-sm-10">
				  <input type="text" class="form-control" id="title" placeholder="i.e.: Maths of grade 8">
				</div>
			  </div>
			  <div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">Exam Time</label>
				<div class="col-sm-10">
				  <input type="text" class="form-control" id="time" placeholder="i.e.: 120 minutes">
				</div>
			  </div>
			</form>
		  </div>
		  <div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
			<button type="button" class="btn btn-primary" id="submit">Ok</button>
		  </div>
		</div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	<script>
		//var subject_id = '${subject_id}' ;
	</script>
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>   
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<script src="../static/js/en_set_question.js?a=0"></script>
</html>