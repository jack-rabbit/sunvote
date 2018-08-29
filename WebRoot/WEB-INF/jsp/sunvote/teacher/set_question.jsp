<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>中天电子-教育管理系统</title>

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
				<li  data-index=0><p>同步教材</p></li>
				<li class="active" data-index=1><p>知识点</p></li>
				<div class="clearfix"></div>
			</ul>
		</div>
		<div class="choose_book">
			<div class="book"><p><span id="book_name">西师大版/一年级上</span></p><img src="../static/images/down_arrow.png" /><div class="clearfix"></div></div>
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
				<p>点击查看更多<span>︾</span></p>
			</div>
		</div>
	</div>
	</div>
	<div class="basket">
		<div class="basket_box">
			<p class="col-md-4">已选：<span id="all_que_num">0</span>题</p>
			<p class="col-md-8"><input type="button" value="清空"  class="btn btn-danger clear_que"/><button type="button" class="btn btn-primary btn-lg topic" >
  完成选题
</button></p>
		</div>
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
		<div class="modal-content">
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title">完成选题</h4>
		  </div>
		  <div class="modal-body">
			<form class="form-horizontal">
			  <div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">试卷标题</label>
				<div class="col-sm-10">
				  <input type="text" class="form-control" id="title" placeholder="例：初二数学">
				</div>
			  </div>
			  <div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">考试时长</label>
				<div class="col-sm-10">
				  <input type="text" class="form-control" id="time" placeholder="例：120分钟">
				</div>
			  </div>
			</form>
		  </div>
		  <div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			<button type="button" class="btn btn-primary" id="submit">确定</button>
		  </div>
		</div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>   
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<script src="../static/js/set_question.js?a=1"></script>
</html>