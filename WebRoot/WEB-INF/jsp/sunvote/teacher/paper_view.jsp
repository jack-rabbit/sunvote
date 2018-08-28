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
	</style>
  </head>
  <body>
  <div class="container">
    <div class="page-header">
	  <h3 class="col-md-6" id="paper_title"></h3>
	   <h3 class="col-md-6">考试时间：<span id="time"></span>分钟</h3>
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
	<div class="save_box">
		<input type="button" value="保存" class="btn btn-primary btn-lg topic save" disabled="disabled"/>
	</div>
	</div>
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
	<script src="../static/js/echars.js"></script>
	<script src="../static/js/loading.js"></script>
	<script>
	var url="";
	var question_box=[];
	function slide(obj){                      //查看解析
		obj.closest(".star_box").siblings(".resolve").slideToggle(function(){
			if($(".resolve").css("display") == "none")
				obj.text("查看解析");
			else
				obj.text("收起解析");
		});
	}
			
function getQueryString(name) {
	  var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
	  var r = window.location.search.substr(1).match(reg);
	  if (r != null) return unescape(r[2]); return null;
  	}
	var PAPER_ID=getQueryString("PAPER_ID");
	var classId=getQueryString("classId");
	var userid=getQueryString("userid");
	
	var _html="";
	var question_id_arry="";
	$(document).ready(function(){
		window.top.loading.remove();
			var data=JSON.parse(sessionStorage.getItem("data")); 
				console.log(data);
				$("#paper_title").html(data.title);
				$("#time").html(data.exam_time);
				if(data.questions.length>0){
					for(var i=0;i<data.questions.length;i++){
						question_id_arry+=data.questions[i].question_id+',';
					}
					getQuestionInfo(question_id_arry);
				}
		
	})
	function getQuestionInfo(id){
		$.ajax({
			url:url+"/SunvoteEducation/api/v1/question",
			async:true,
			type:"post",
			data:{ID:id},
			success:function(data){
				console.log(data);
				if(data.data.length>0){				
					for(var i=0;i<data.data.length;i++){
						_html += '<li class="question_li" data-id="'+data.data[i].QUESTION_ID+'"><div class="stem"></div><div class="option"><ul></ul><div class="clearfix"></div></div><div class="resolve"><div class="resolve_box"><p>【答案】 '+data.data[i].ANSWER+'</p><p><span>【解析】</span>'+data.data[i].ANALYSIS+'</p></div><div class="clearfix"></div></div><div class="star_box"><div class="col-md-6 move"><img src="../static/images/up_ico.png" class="up"/><img src="../static/images/down_ico.png" class="down"/></div><div class="col-md-6"><div class="star"><span style="float:left;">难度</span></div><div class="resolve_click"><a  onclick="slide($(this))">查看解析</a></div></div><div class="clearfix"></div></div></li>';
					}
					console.log(_html);
					$(".analysis ul").html(_html);
					for(var j=0;j<data.data.length;j++){
						var option_html="";
						var sum=0;
						var right_num=0;
						var data1=[];
						var data2=[];
						var answer="";
						var color=[];
						$(".analysis li .stem").eq(j).append('<span class="li_index">'+(j+1)+'</span>、'+data.data[j].CONTENT);
						var arry_option=data.data[j].OPTION_CONTENT;
						//arry_option=arry_option.replace("[","");
						//arry_option=arry_option.replace("]","");
						//arry_option=arry_option.split(",");

						for(var x=0;x<arry_option.length;x++){
							option_html += '<li><span>'+String.fromCharCode(64 + parseInt(x+1))+'.</span>'+arry_option[x]+'</li>';
						}
						$(".option").eq(j).html(option_html);
						star(j,parseInt(data.data[j].DIFFICULTY));
					}
				}
			}
		})
		
	}
	function star(index,num){                //难度星级
			$(".star").eq(index).append('<ul></ul>');
			var li_html="";
			for(var i=1;i<=num;i++){
				li_html +='<li class="on"></li>';
			}
			for(var j=num;j<5;j++){
				li_html += '<li class="off"></li>';
			}
			
			$(".star").eq(index).find("ul").html(li_html);
		}
	$(document).on('click', '.move img', function(event) {
		  event.preventDefault();
		  $(".save").removeAttr('disabled');
		  var parent=$(this).closest("li");
		  var this_index=parent.children(".stem").find(".li_index").html();
		  var up_index=parent.prev().children(".stem").find(".li_index").html()
		  console.log(this_index);
		  console.log(up_index);
		  var parents=$(this).closest(".analysis").children("ul");
		  var len=parents.children().length;
		  if(($(this).is(".up") || $(this).is(".top")) && parent.index()==0){
		   alert("已经置顶！");
		   return false;
		  }else if(($(this).is(".down") || $(this).is(".bottom")) && parent.index()==len-1){
		   alert("已经置底！");
		   return false;
		  }
		  switch (true) {
		   case $(this).is(".up"):
			var prev = parent.prev();
			var this_index=parent.children(".stem").find(".li_index").html();
			var up_index=prev.children(".stem").find(".li_index").html();
			prev.children(".stem").find(".li_index").html(this_index);
			parent.children(".stem").find(".li_index").html(up_index);
			parent.insertBefore(prev);
			break;
		   case $(this).is(".down"):
			var next = parent.next();
			var this_index=parent.children(".stem").find(".li_index").html();
			var up_index=next.children(".stem").find(".li_index").html();
			next.children(".stem").find(".li_index").html(this_index);
			parent.children(".stem").find(".li_index").html(up_index);
			parent.insertAfter(next);
			break;
		   case $(this).is(".top"):
			parents.prepend(parent);
			break;
		   case $(this).is(".bottom"):
			parents.append(parent);
			break;
		  }
		 // alert("操作完成！！");
	});
	 $(".save").click(function(){
		 	var question_arry=[];
			for(var i=0;i<$(".question_li").length;i++){
				question_arry[i]={
						score: "0",
						part_score: "0",
						question_id: $(".question_li").eq(i).attr("data-id"),
						rank: i.toString(),
						no_name: i.toString()
					};
				
			}
			var data={
				title: $("#paper_title").html(),
				exam_time: $("#time").html(),
				paper_type: "101",
				subject_id: "20",
				grade_id: "",
				class_id: classId,
				user_id: userid,
				score: "100",
				questions: question_arry
			};
			//console.log(data);
			$.ajax({
			url:url+"/SunvoteEducation/api/v1/publishpaper",
			async:false,
			type:"post",
			dataType: "json",
			headers: {'Content-Type': 'application/json'},
			data:JSON.stringify(data),
			success:function(data){
				alert("上传成功");
				window.history.go(-1);
			}
		})	
	 })
	</script>
	
</html>





