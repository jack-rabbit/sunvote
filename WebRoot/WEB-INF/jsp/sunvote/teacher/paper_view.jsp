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
	<link href="../static/css/paper_view.css" rel="stylesheet">

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
	   <h3 class="col-md-6">考试时长：<span id="time"></span>分钟</h3>
		<div class="clearfix"></div>
	</div>
	<div class="content_report">
		<div class="col-md-3 left_menu">
			<ul>
				<li class="active">学生完成情况</li>
				<li>题目分析</li>
			</ul>
		</div>
		<div class="col-md-9 report">
			<div class="report_info">
				<ul>
					<li>未完成学生 1/1</li>
					<li>平均错题数 0</li>
					<li>正确率 0%</li>
					<li>平均用时 0秒</li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="table_box">
				<table class="table table-striped">
				  <thead>
					<tr>
						<th>姓名</th>
						<th>答题时间</th>
						<th>答对数</th>
						<th>答错数</th>
						<th>错题详情</th>
						<th>一键催交</th>
					</tr>
				  </thead>
				  <tbody>
					<tr>
						<td>杨大辉</td>
						<td>未完成</td>
						<td>--</td>
						<td>--</td>
						<td>--</td>
						<td>催作业</td>
					</tr>
					<tr>
						<td>何禾</td>
						<td>2018/6/21</td>
						<td>--</td>
						<td>--</td>
						<td>--</td>
						<td>催作业</td>
					</tr>
				  </tbody>
				</table>
			</div>
		</div>
		<div class="col-md-9 analysis" style="display:none;">
			<ul>
				<li>
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
				</li>
			</ul>
		</div>
	</div>

	</div>
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
	<script src="js/echars.js"></script>
	<script>
	var url="http://127.0.0.1:8080/SunvoteEducation/"
	function slide(obj){                      //查看解析
		obj.closest(".star_box").siblings(".resolve").slideToggle(function(){
			if($(".resolve").css("display") == "none")
				obj.text("查看解析");
			else
				obj.text("收起解析");
		});
	}
		$(".left_menu li").click(function(){
			if($(this).index()==0){
				$(this).siblings().removeClass("active");
				$(this).addClass("active");
				$(".analysis").css("display","none");
				$(".report").css("display","block");
			}else if($(this).index()==1){
				$(this).siblings().removeClass("active");
				$(this).addClass("active");
				$(".report").css("display","none");
				$(".analysis").css("display","block");
			}
		})
		
	function bar(index){
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
					data : ['A', 'B', 'C', 'D'],
					axisTick: {
						alignWithLabel: true
					},
					axisLabel: {
						show:true,
						textStyle:{
							 color: function (value){
								console.log(value);
								return value == "C" ? '#75b3ff' : '#fcb35b';
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
					name:'直接访问',
					type:'bar',
					barWidth: '60%',
					data:[10, 0, 20, 5],
					itemStyle: {
						//通常情况下：
						normal:{
							//每个柱子的颜色即为colorList数组里的每一项，如果柱子数目多于colorList的长度，则柱子颜色循环使用该数组
							color: function (params){
								var colorList = ['#fcb35b','#fcb35b','#75b3ff','#fcb35b'];
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
	var PAPER_ID=getQueryString("PAPER_ID");
	var _html="";
	$(document).ready(function(){
		$.ajax({
			url:url+"/api/v1/paperinfo",
			async:false,
			type:"post",
			data:{PAPER_ID:PAPER_ID},
			success:function(data){
				console.log(data);
				$("#paper_title").html(data.data.title);
				$("#time").html(data.data.exam_time);
				if(data.data.questions.length>0){				
					for(var i=0;i<data.data.questions.length;i++){
						_html += '<li><div class="stem"></div><div class="option"><ul></ul><div class="clearfix"></div></div><div class="resolve"><div class="resolve_box"><p>【答案】 '+data.data.questions[i].answer+'</p><p><span>【解析】</span>'+data.data.questions[i].analysis+'</p></div><div class="clearfix"></div><div class="tab_report_box"><div class="col-md-3"><p>答错人数</p><div class="round_w_orange"><div class="round_n_orange"><span>0/0</span></div></div></div><div class="col-md-3"><p>错误率</p><div class="round_w_red"><div class="round_n_red"><span>100%</span></div></div></div><div class="col-md-6"><div id="main'+i+'" style="width:250px;height:140px;"></div></div><div class="clearfix"></div></div></div><div class="star_box"><div class="col-md-6">错误学生：0/0</div><div class="col-md-6"><div class="star"><span style="float:left;">难度</span></div><div class="resolve_click"><a  onclick="slide($(this))">查看解析</a></div></div><div class="clearfix"></div></div></li>';
					}
					console.log(_html);
					$(".analysis ul").html(_html);
					for(var j=0;j<data.data.questions.length;j++){
						var option_html="";
						$(".analysis li .stem").eq(j).append('<span>'+(j+1)+'、</span>'+data.data.questions[j].content);
						var arry_option=data.data.questions[j].option_content;
						arry_option=arry_option.replace("[","");
						arry_option=arry_option.replace("]","");
						arry_option=arry_option.split(",");
						for(var x=0;x<arry_option.length;x++){
							option_html += '<li><span>'+String.fromCharCode(64 + parseInt(x+1))+'.</span>'+arry_option[x]+'</li>';
						}
						$(".option").eq(j).find("ul").html(option_html);
						
						star(j,parseInt(data.data.questions[j].difficulty));
						bar(j);
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
	</script>
	
<!-- 	<li><div class="stem"></div><div class="option"><ul></ul><div class="clearfix"></div></div><div class="resolve"><div class="resolve_box"><p>【答案】 A</p><p>【解析】</p></div><div class="clearfix"></div><div class="tab_report_box"><div class="col-md-3"><p>答错人数</p><div class="round_w_orange"><div class="round_n_orange"><span>0/0</span></div></div></div><div class="col-md-3"><p>错误率</p><div class="round_w_red"><div class="round_n_red"><span>100%</span></div></div></div><div class="col-md-6"><div id="main" style="width:250px;height:140px;"></div></div><div class="clearfix"></div></div></div><div class="star_box"><div class="col-md-6">错误学生：0/0</div><div class="col-md-6"><div class="star"><span style="float:left;">难度</span></div><div class="resolve_click"><a  onclick="slide($(this))">查看解析</a></div></div><div class="clearfix"></div></div></li> -->
	
</html>





