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
	</style>
  </head>
  <body>
  <div class="container">
    <div class="page-header">
	  <h3 class="col-md-6" id="paper_title"></h3>
	   <h3 class="col-md-6">考试时间：<span id="time"></span></h3>
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
					<div class="tab_report_box">
						<div class="col-md-3">
							<p>答错人数</p>
							<div class="round_w_orange">
								<div class="round_n_orange">
									<span>0/0</span>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<p>错误率</p>
							<div class="round_w_red">
								<div class="round_n_red">
									<span>100%</span>
								</div>
							</div>
						</div>
						<div class="col-md-6">
						<div id="main" style="width:250px;height:140px;"></div>
						</div>
						<div class="clearfix"></div>
					</div>
					</div>

					<div class="star_box">
						<div class="col-md-6">错误学生：0/0</div>
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
				</li>-->
			</ul>
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
			<table class="table table-bordered">
			  <thead>
					<tr>
						<th>序号</th>
						<th>学生姓名</th>
						<th>选项</th>
						<th>答题时间</th>
					</tr>
				</thead>
				<tbody class="student_list">
					
				</tbody>
			</table>
		  </div>
		  <div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			<button type="button" class="btn btn-primary" id="submit">确定</button>
		  </div>
		</div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	</div>
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<script src="../static/js/echars.js"></script>
	<script src="../static/js/loading.js"></script>
	<script>
	var url="";
	function slide(obj){                      //查看详情
		obj.closest(".star_box").siblings(".resolve").slideToggle(function(){
			if($(".resolve").css("display") == "none")
				obj.text("查看详情");
			else
				obj.text("收起详情");
		});
	}

		
	function bar(index,data1,data2,answer,color){
		var myChart = echarts.init(document.getElementById('main'+index));
		myChart.setOption({
			color: ['#3398DB'],
			tooltip : {
				trigger: 'axis',
				axisPointer : {            // 坐标轴指示器，坐标轴触发有效
					type : 'line'        // 默认为直线，可选为：'line' | 'shadow'
				}
			},
			grid: {
				top: 15,
				left: '0%',
				right: '0%',
				bottom: '0%',
				containLabel: true
			},
			xAxis : [
				{
					type : 'category',
					data : data2,
					axisTick: {
						alignWithLabel: true
					},
					axisLabel: {
						show:true,
						textStyle:{
							 color: function (value){
								console.log(value);
								return value == answer ? '#75b3ff' : '#fcb35b';
							}
						}
					}
				}


			],
			yAxis : [
				{
					type : 'value'
				}
			],
			series : [
				{
					name:'选项人数',
					type:'bar',
					barWidth: '60%',
					data:data1,
					itemStyle: {
						//通常情况下：
						normal:{
							//每个柱子的颜色即为colorList数组里的每一项，如果柱子数目多于colorList的长度，则柱子颜色循环使用该数组
							color: function (params){
								var colorList = color;
								return colorList[params.dataIndex];
							},
							label : {show: true,position:'top',distance:-4}
						}
					}
				}
			]
		});							
	}
		
function getQueryString(name) {
	  var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
	  var r = window.location.search.substr(1).match(reg);
	  if (r != null) return unescape(r[2]); return null;
  	}
	var testpaperId=getQueryString("testpaperId");
	
	var _html="";
	$(document).ready(function(){
		window.top.loading.remove();
		$.ajax({
			url:url+"/SunvoteEducation/api/v1/testpaperinfo",
			async:false,
			type:"post",
			data:{ID:testpaperId},
			success:function(data){
				console.log(data);
				$("#paper_title").html(data.data.name);
				$("#time").html(data.data.CREATE_DATE);
				if(data.data.QUESTIONS.length>0){				
					for(var i=0;i<data.data.QUESTIONS.length;i++){
						_html += '<li class="question_li" data-id="'+data.data.QUESTIONS[i].QUESTION_ID+'"><div class="stem"></div><div class="option"><ul></ul><div class="clearfix"></div></div><div class="resolve"><div class="resolve_box"><p>【答案】 '+data.data.QUESTIONS[i].ANSWER+'</p><p><span>【解析】</span>'+data.data.QUESTIONS[i].ANALYSIS+'</p></div><div class="clearfix"></div><div class="tab_report_box"><div class="col-md-3"><p>答错人数</p><div class="round_w_orange"><div class="round_n_orange"><span>0/0</span></div></div></div><div class="col-md-3"><p>错误率</p><div class="round_w_red"><div class="round_n_red"><span>100%</span></div></div></div><div class="col-md-6"><div id="main'+i+'" style="width:250px;height:140px;"></div></div><div class="clearfix"></div></div></div><div class="star_box"><div class="col-md-6">错误学生：<span class="erro_num">0/0</span></div><div class="col-md-6"><div class="star"><span style="float:left;">难度</span></div><div class="resolve_click"><a  onclick="slide($(this))">查看详情</a></div></div><div class="clearfix"></div></div></li>';
					}
					console.log(_html);
					$(".analysis ul").html(_html);
					for(var j=0;j<data.data.QUESTIONS.length;j++){
						var option_html="";
						var sum=0;
						var right_num=0;
						var data1=[];
						var data2=[];
						var answer="";
						var color=[];
						$(".analysis li .stem").eq(j).append('<span>'+(j+1)+'、</span>'+data.data.QUESTIONS[j].CONTENT);
						var arry_option=data.data.QUESTIONS[j].OPTION_CONTENT;
						var answerinfo=data.data.QUESTIONS[j].ANSWERINFO;

						for(var x=0;x<arry_option.length;x++){
							option_html += '<li><span>'+String.fromCharCode(64 + parseInt(x+1))+'.</span>'+arry_option[x]+'</li>';
						}
						for(k=0;k<answerinfo.length;k++){
							data1[k]=parseInt(answerinfo[k].COUNT);
							data2[k]=answerinfo[k].ANSWER;
							color[k]="#fcb35b";
							if(answerinfo[k].ISRIGHT==1){
								right_num=answerinfo[k].COUNT;
								answer=answerinfo[k].ANSWER;
								color[k]="#75b3ff";
							}
							sum += parseInt(answerinfo[k].COUNT);
						}
						$(".round_n_orange span").eq(j).text((sum-right_num)+"/"+sum);
						$(".erro_num").eq(j).text((sum-right_num)+"/"+sum);
						$(".round_n_red span").eq(j).text(((sum-right_num)/sum).toFixed(2)*100+"%");
						$(".option").eq(j).find("ul").html(option_html);
						
						star(j,parseInt(data.data.QUESTIONS[j].DIFFICULTY));
						console.log(data1,data2);
						bar(j,data1,data2,answer,color);
						if(data.data.QUESTIONS[j].RANDOM=="1")
							$(".analysis ul").children("li").eq(j).append('<div class="chou">抽</div>');
					}
				}
			}
		})
	})
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
	$(document).on("click",".round_n_orange",function(){
		var question_id = $(this).closest("li").attr("data-id");
		var student_html="";
		$.ajax({
			url:url+"/SunvoteEducation/api/v1/qstudentinfo",
			async:false,
			type:"post",
			data:{question_id:question_id,test_id:testpaperId},
			success:function(data){
				console.log(data);
				for(var i=0;i<data.data.length;i++){
					student_html+='<tr><td>'+(i+1)+'</td><td>'+data.data[i].NAME+'</td><td>'+data.data[i].ANSWER+'</td><td>'+data.data[i].PRESS_TIME+'秒</td></tr>';
				}
				$(".student_list").html(student_html);
			}
		});
		$('#myModal').modal('show');
	})	
		

	</script>
	
</html>





