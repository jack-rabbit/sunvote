	var url="";
	function slide(obj){                      //查看详情
		obj.closest(".star_box").siblings(".resolve").slideToggle(function(){
			if($(".resolve").css("display") == "none")
				obj.text("查看详情");
			else
				obj.text("收起详情");
		});
	}

		
	function bar(index,data1,data2,answer,color,sum){        //柱状图
		var myChart = echarts.init(document.getElementById('main'+index));
		myChart.setOption({
			color: ['#3398DB'],
			tooltip : {
				trigger: 'axis',
				axisPointer : {            // 坐标轴指示器，坐标轴触发有效
					type : 'line'        // 默认为直线，可选为：'line' | 'shadow'
				},
			    formatter: function(params){
				   return params[0].name+"<br/><div style='display:inline-block;width:10px;height:10px;margin-right:5px;border-radius:5px;background:"+params[0].color+"'></div>占比:"+((params[0].value/sum)*100).toFixed(2)+"%<br/><div style='display:inline-block;width:10px;height:10px;margin-right:5px;border-radius:5px;background:"+params[0].color+"'></div>人数:"+params[0].value;
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
					type : 'value',
					max: function(value) {
						return sum;
					}
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
				$("#paper_title").html(data.data.NAME);
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
							if(answerinfo[k].ANSWER=="")
								answerinfo[k].ANSWER="未答";
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
						bar(j,data1,data2,answer,color,sum);
						if(data.data.QUESTIONS[j].RANDOM=="1")
							$(".analysis ul").children("li").eq(j).append('<div class="chou">抽</div>');
					}
				}
			},
			error: function (XMLHttpRequest, textStatus, errorThrown) {
				// 错误信息   
				alert("状态码："+XMLHttpRequest.status+"状态："+XMLHttpRequest.readyState+"错误信息："+textStatus+"");
				window.top.loading.remove();
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
	$(document).on("click",".round_n_orange",function(){    //显示错误学生名单
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
					if(typeof(data.data[i].ANSWER)=="undefined")
						data.data[i].ANSWER="未答";
					student_html+='<tr><td>'+(i+1)+'</td><td>'+data.data[i].NAME+'</td><td>'+data.data[i].ANSWER+'</td><td>'+data.data[i].PRESS_TIME+'秒</td></tr>';
				}
				$(".student_list").html(student_html);
			},
			error: function (XMLHttpRequest, textStatus, errorThrown) {
				// 错误信息   
				alert("状态码："+XMLHttpRequest.status+"状态："+XMLHttpRequest.readyState+"错误信息："+textStatus+"");
				window.top.loading.remove();
			}
		});
		$('#myModal').modal('show');
	})