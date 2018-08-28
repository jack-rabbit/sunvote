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
    <!--<div class="choose_class">
		<div class="col-md-2">
			<p>选择班级</p>
		</div>
		<div class="col-md-10 classList">
			<ul>
				<li>一年级1502班</li>
			</ul>
		</div>
		<div class="clearfix"></div>
	</div>-->
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
					
				</ul>
				
			</div>
			<!-- <div class="gary"></div> -->
		</div>
		<div class="section">
			<ul>
				<!-- <li>
					<img src="../static/images/add.png" /><span>1 准备课</span>
					<ul>
						<li>
							<span>●</span>
							<span>1.1 数一数</span>
						</li>
						<li>
							<span>●</span>
							<span>1.1 数一数</span>
						</li>
					</ul>
				</li>
				<li><img src="../static/images/reduce.png" />期中</li> -->
			</ul>
		</div>
	</div>
	<div class="col-md-9 right_content">
		<!-- <div class="screen">
			<div class="tag">
				<dl>
					<dt>题目难度：</dt>
					<dd>基础题</dd>
					<dd>中档题</dd>
					<dd>难题</dd>
				</dl>
			</div>
			<div class="tag">
				<dl>
					<dt>题目来源：</dt>
					<dd>云题库</dd>
					<dd>个人题库</dd>
				</dl>
			</div>
		</div> -->
		<div class="question_box">
			<ul>
				<!-- <li>
					<div class="content">
					<span>1、</span>
						<img  src="http://image.yuncelian.com/1/2018/1/2a5074aa7d5f0dc7df586005922cb60d.png" style="vertical-align:middle;FLOAT:right" />如图，▱ABCD的对角线AC、BD交于点O，AE平分∠BAD交BC于点E，且∠ADC=60°，AB=<span class="YclQues" mathtag="math" style="whiteSpace:nowrap;wordSpacing:normal;wordWrap:normal"><table cellpadding="-1" cellspacing="-1" style="margin-right:1px"><tr><td style="border-bottom:1px solid black">1</td></tr><tr><td>2</td></tr></table></span>BC，连接OE．下列结论：①∠CAD=30°；②S<SUB>▱ABCD</SUB>=AB•AC；③OB=AB；④OE=<span class="YclQues" mathtag="math" style="whiteSpace:nowrap;wordSpacing:normal;wordWrap:normal"><table cellpadding="-1" cellspacing="-1" style="margin-right:1px"><tr><td style="border-bottom:1px solid black">1</td></tr><tr><td>4</td></tr></table></span>BC，成立的个数有（　　）
					</div>
					<div class="option">
						<ul>
							<li><span>A.</span>1个</li>
							<li><span>B.</span>2个</li>
							<li><span>C.</span>3个</li>
							<li><span>D.</span>4个</li>
							<div class="clearfix"></div>
						</ul>
					</div>
					<div class="resolve">
					<div class="resolve_box">
						<p><span>【答案】</span> A</p>
						<p><span>【解析】</span><img src="http://image.yuncelian.com/1/analysis/00ca500f-224f-584e-b92f-d7863238e2a8.png"></p>

						<p>【考点】 10以内数的认识</p>
					</div>
					<div class="clearfix"></div>
					</div>
					<div class="star_box">
						<div class="col-md-6">
							<div class="star">
								<span style="float:left;">难度</span>
								<ul data-num="4">
									<li class="on"></li>
									<li class="on"></li>
									<li class="off"></li>
									<li class="off"></li>
									<li class="off"></li>
								</ul>
							</div>
							<div class="resolve_click">
								<a  onclick="slide($(this))">查看解析</a>
								<div class="check_box"></div>
							</div>
							
								
							
						</div>
						<div class="clearfix"></div>
					</div>
				</li> -->
				
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
	<script>
	//http://192.168.0.113:8080/SunvoteEducation/api/v1/point  所有知识点
	var url="http://127.0.0.1:8080";
	var temp_tag;
	var temp_data;
	var TEXTBOOK_ID="";
	var question_box=[];
	var question_num=0;
	var pageNum=0;
	var end=0;
	
	
	$(document).ready(function(){
		//getClassName();
		
		getPoint();	
				
	});
	
	function getQueryString(name) {
	  var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
	  var r = window.location.search.substr(1).match(reg);
	  if (r != null) return unescape(r[2]); return null;
  	}
	
	var subject_id=getQueryString("subject_id");
	var class_id=getQueryString("class_id");
	var user_id=getQueryString("user_id");
	
	//alert(subject_id+";"+class_id);
	
	function getPoint(){             //获取知识点
		$.ajax({
			url:url+"/SunvoteEducation/api/v1/point",
			async:false,
			type:"post",
			data:{depth:"",subject_id:subject_id,p_id:"",knowledge_from:101},
			success:function(data){
				console.log(data);
				var point_html="";
				for(var i=0;i<data.data.length;i++){
					point_html +='<li data-id="'+data.data[i].KNOWLEDGE_ID+'" data-img-click=0 data-span-click=0><img src="../static/images/add.png" class="add" /><span>'+(i+1)+data.data[i].NAME+'</span></li>';
				}
				$(".section").children("ul").html(point_html);
				getQuestion($(".section li").eq(0));
			}
		})
	}
	function getChapter(TEXTBOOK_ID){                 //获取章节
		$(".section").children("ul").html("");
		$.ajax({
			url:url+"/SunvoteEducation/api/v1/chapter",
			async:false,
			type:"post",
			data:{TEXTBOOK_ID:TEXTBOOK_ID},
			success:function(data){
				console.log(data);
				for(var i=0;i<data.data.length;i++){
					$(".section").children("ul").append('<li data-id="'+data.data[i].ID+'" data-img-click=0 data-span-click=0><img src="../static/images/add.png" class="add"/><span>'+data.data[i].NAME+'</span></li>');	
					if(data.data[i].CHILDREN.length>0){
						$(".section").children("ul").children("li").eq(i).append("<ul></ul>");
						for(var j=0;j<data.data[i].CHILDREN.length;j++){
							$(".section").children("ul").children("li").eq(i).children("ul").append('<li data-id="'+data.data[i].CHILDREN[j].ID+'" onclick="getQuestion($(this))"><span>●</span><span>'+data.data[i].CHILDREN[j].NAME+'</span></li>');
						}
					}
				}
				
			}
		})
	}
	function getMenu(id,obj){        //获取知识点下级内容
		var _html="";
		$.ajax({
			url:url+"/SunvoteEducation/api/v1/point",
			async:false,			
			type:"post",
			data:{depth:"",subject_id:subject_id,p_id:id,knowledge_from:101},
			success:function(data){
				console.log(data);
				obj.append('<ul></ul>');
				for(var i=0;i<data.data.length;i++){
				console.log(typeof(data.data[i].CHILDREN));
				if(data.data[i].CHILDREN===undefined)
					_html +='<li data-id="'+data.data[i].KNOWLEDGE_ID+'" data-span-click=0 "><span>●</span><span>'+(i+1)+data.data[i].NAME+'</span></li>';
				else
					_html +='<li data-id="'+data.data[i].KNOWLEDGE_ID+'" data-img-click=0 data-span-click=0 ><img src="../static/images/add.png" class="add"/><span>'+(i+1)+data.data[i].NAME+'</span></li>';
				}
				obj.children('ul').html(_html);
			}
		})
	}
	function slide(obj){                      //查看解析
		obj.closest(".star_box").siblings(".resolve").slideToggle(function(){
			if($(".resolve").css("display") == "none")
				obj.text("查看解析");
			else
				obj.text("收起解析");
		});

		}
	function getQuestion(obj){                //获取题目
		
		var knowledge_id="",chapter_id="";
		if($(".tab .active").attr("data-index")==1){
			knowledge_id=obj.attr("data-id");
		}else{
			chapter_id=obj.attr("data-id");
		}
		
		var _html="";
		
		$.ajax({
			url:url+"/SunvoteEducation/api/v1/questions",
			async:true,
			type:"post",
			data:{chapter_id:chapter_id,teachingmaterial_id:"",knowledge_id:knowledge_id,question_from:101,user_id:"",problem_type:"",subject_id:subject_id,count:"5",pageNum:pageNum},
			success:function(data){
			window.top.loading.remove();
			console.log(data);
			if(data.data.length>0){
				for(var i=0;i<data.data.length;i++){
					_html += '<li data-id="'+data.data[i].QUESTION_ID+'"><div class="content"></div><div class="option"><ul></ul></div><div class="resolve"><div class="resolve_box"><p><span>【答案】</span> '+data.data[i].ANSWER+'</p><p><span>【解析】</span>'+data.data[i].ANALYSIS+'</p></div></div><div class="star_box"><div class="col-md-6"><div class="star"><span style="float:left;">难度</span></div><div class="resolve_click"><a  onclick="slide($(this))">查看解析</a><div class="check_box"></div></div></div><div class="clearfix"></div></div></li>';
				}
				$(".question_box").children("ul").append(_html);
				console.log(5*pageNum);
				for(var j=5*pageNum;j<(data.data.length+5*pageNum);j++){
					var option_html="";
					//console.log(data.data[j-5*pageNum].CONTENT);
					$(".question_box li .content").eq(j).append('<span>'+(j+1)+'、</span>'+data.data[j-5*pageNum].CONTENT);
					var arry_option=data.data[j-5*pageNum].OPTION_CONTENT;
					if(question_box.indexOf(data.data[j-5*pageNum].QUESTION_ID)>=0){
						$(".check_box").eq(j).addClass("checked");
					}
					//arry_option=arry_option.replace("[","");
					//arry_option=arry_option.replace("]","");
					//arry_option=arry_option.split(",");
					for(var x=0;x<arry_option.length;x++){
						option_html += '<li><span>'+String.fromCharCode(64 + parseInt(x+1))+'.</span>'+arry_option[x]+'</li>';
					}
					$(".option").eq(j).find("ul").html(option_html);
					
					star(j,parseInt(data.data[j-5*pageNum].DIFFICULTY));
					
				}
			}else{
				$(".question_box").children("ul").html("");
				pageNum-=1;
				end=1;
			}
			
			}
		})
	}
	function getTeachingMaterial(){             //获取教材版本
	
		$.ajax({
			url:url+"/SunvoteEducation/api/v1/teachingmaterial",
			async:true,
			type:"post",
			data:{subject_id:subject_id},
			success:function(data){
				console.log(data);
				if(data.data.length>0){
					var teach_html="";
					
					
					for(var i=0;i<data.data.length;i++){
						teach_html += '<li data-id="'+data.data[i].ID+'" class="li_name"><p class="name">'+data.data[i].NAME+'</p><img src="../static/images/arrow_right.png" /><div class="clearfix"></div></li>';	
					}
					$(".book_box ul").html(teach_html);
					var li_length=$(".book_box ul li").length;
					for(var k=0;k<li_length;k++){
						var books=[];
						var book_html="";
						var book_id=$(".book_box ul").children("li").eq(k).attr("data-id");
						
						if(textBook(book_id).length>0){
							
							books=textBook($(".book_box ul li").eq(k).attr("data-id"));
							$(".book_box ul li").eq(k).append('<div class="float_box"><ul><div class="clearfix"></div></ul></div>');
							
							for(var j=0;j<books.length;j++){
								console.log("j:"+j);
								book_html += '<li data-id='+books[j].id+'>'+books[j].name+'</li>';
							}
							$(".float_box").eq(k).children("ul").find(".clearfix").before(book_html);
							TEXTBOOK_ID=books[0].id;
						}
						
					}
				getChapter(TEXTBOOK_ID);
				$("#book_name").text($(".name").eq(0).text()+"/"+$(".float_box").eq(0).find('li').eq(0).text());
				}
				
			}	
		})
		
	}
	function textBook(id){
		var textBookName=[];
		$.ajax({
			url:url+"/SunvoteEducation/api/v1/textbook",
			async:false,
			type:"post",
			data:{teaching_material_id:id,subject_id:subject_id,grade_id:""},
			success:function(data){
				//alert(data.data);
				if(data.data.length>0){
					for(var i=0;i<data.data.length;i++){
						textBookName[i]={"name":data.data[i].NAME,"id":data.data[i].ID};
					}
				}
			}
		})
		return textBookName;
	}
	function getClassName(){
		//var className="";
		$.ajax({
			url:url+"/SunvoteEducation/api/v1/classname",
			async:false,
			type:"post",
			data:{id:class_id},
			success:function(data){
				//alert(data.data);
				$(".classList li").html(data.data);
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
	
		$(".section").on("click",".add",function(event){       //展开菜单
			event.stopPropagation();
			
			var that=$(this).closest("li");
			//alert(that.attr("data-img-click"));
			
			//console.log(that.attr("data-click"));
			if($(".tab .active").attr("data-index")==1){
				if(that.attr("data-img-click")==0){
					getMenu(that.attr("data-id"),that);
					//getQuestion(that);
				}	
				that.attr("data-img-click",1);
			}else{
				if(that.attr("data-img-click")==0){
					//getQuestion(that);
				}	
				that.attr("data-img-click",1);
			}
			
			if(that.children('ul').length>0)
				that.children('ul').slideToggle(function(){
					if(that.children('ul').css("display")=="block")
						that.children('img').attr("src","../static/images/reduce.png");
					else
						that.children('img').attr("src","../static/images/add.png");
				});
		});
		$(".section").on("click","span",function(event){       //点击菜单获取题目
			window.top.loading.show();
			event.stopPropagation();
			$(".question_box ul").html("");
			var that=$(this).closest("li");
			if($(".tab .active").attr("data-index")==1){				
					getQuestion(that);
					$(".menu_active").removeClass();
					that.addClass("menu_active");
			}else{
					getQuestion(that);
					$(".menu_active").removeClass();
					that.addClass("menu_active");
			}

		});
		$(".book_box").children("ul").on("mouseover","li",function(event){    //教材版本交互
			event.stopPropagation();
			//$(this).siblings("li").css("background","#fff");
			//$(this).css("background","#e9f0ff");
			//$(".float_box").css("display","none");
			$(this).children(".float_box").css("display","block");
		});
		$(".book_box").children("ul").on("mouseleave","li",function(event){  //教材版本交互
			event.stopPropagation();
			//$(this).css("background","#fff");
			$(this).children(".float_box").css("display","none");
		});
		$(".float_box").on("mouseleave",function(event){                //教材版本交互
			event.stopPropagation();
			$(this).css("display","none");
		});
		$(document).on("click",".float_box li",function(event){                //教材版本交互
			//alert($(this).index());
			event.stopPropagation();
			var id=$(this).attr("data-id");
			$("#book_name").text($(this).closest(".li_name").children(".name").text()+"/"+$(this).text());
			$(".float_box").css("display","none");
			$(".book_box").slideToggle();
			getChapter(id);
		});
		$(".book").click(function(){                                //教材版本下拉框交互
			$(".book_box").slideToggle();
		})
		$(document).on("click",".check_box",function(){    //选中题目
			
			if($(this).hasClass("checked")){
				var id=$(this).closest("li").attr("data-id");
				var que_index=question_box.indexOf(id);
				$(this).removeClass("checked");
				question_box.splice(que_index,1);
				question_num--;
			}else{
				question_box[question_num]=$(this).closest("li").attr("data-id");
				question_num++;
				$(this).addClass("checked");
			}
			$("#all_que_num").html(question_num);
		});
		$(".clear_que").click(function(){                 //清空
			question_num=0;
			question_box=[];
			$(".checked").removeClass("checked");
			$("#all_que_num").html(question_num);
		});
		$(".tab li").click(function(){                     //教材与知识点选择
			$(this).siblings().removeClass("active");
			$(this).addClass("active");
			if($(this).index()==0){
				getTeachingMaterial();
				$(".choose_book").css("display","block");
				getChapter(TEXTBOOK_ID);
			}else{
				$(".choose_book").css("display","none");
				getPoint();
			}
		});
		$(".topic").click(function(){
			if(parseInt($("#all_que_num").text())>0)
				$('#myModal').modal('show');
			else
				alert("请先选择题目")
		});
		$(".view_more").click(function(){
			pageNum++;
			if(end>0){
				$(".view_more p").html("没有更多了");
				return;
			}
			getQuestion($(".menu_active"));
		})
		$("#submit").click(function(){
			var question_arry=[];
			for(var i=0;i<question_num;i++){
				question_arry[i]={
						score: "0",
						part_score: "0",
						question_id: question_box[i],
						rank: i.toString(),
						no_name: i.toString()
					};
				
			}
			var data={
				title: $("#title").val(),
				exam_time: $("#time").val(),
				paper_type: "101",
				subject_id: subject_id,
				grade_id: "",
				class_id: class_id,
				user_id: user_id,
				score: "100",
				questions: question_arry
			};
			//console.log(data);
			sessionStorage.setItem("data",JSON.stringify(data));
			location.href="paper_view.do?classID="+class_id+"&userid="+user_id;
			/* $.ajax({
				url:url+"/SunvoteEducation/api/v1/publishpaper",
				async:false,
				type:"post",
				dataType: "json",
				headers: {'Content-Type': 'application/json'},
				data:JSON.stringify(data),
				success:function(data){
					alert("上传成功");
					$('#myModal').modal('hide');
					window.history.go(-1);
				}
			}) */	
			
		})
	</script>
</html>