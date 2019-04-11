
	var data0=[],data1=[],data2=[],data3=[];
	var startDate,endDate;
	var studentid;
	var data_temp,_index=0;
	var home_all_score=0,home_avg_score=0,home_get_score=0,home_max_score=0;
	function getQueryString(name) {
		  var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
		  var r = window.location.search.substr(1).match(reg);
		  if (r != null) return unescape(r[2]); return null;
	  	}
	function getData(){
		
				data_temp=data;
				console.log(data);
				var _html='';
				for(var i=0;i<data.STUDENTS.length;i++){
					_html+='<li style="cursor:pointer"><p>'+data.STUDENTS[i].NAME+'</p></li>';
					if(data.STUDENT_ID==data.STUDENTS[i].ID)
						_index=i;
				}
				console.log(data.DATA.length);
				for(var j=0;j<data.DATA.length;j++){
					home_all_score+=parseInt(data.DATA[j].PAPER_SCORE);
					home_avg_score+=parseInt(data.DATA[j].AVG_SCORE);
					home_max_score+=parseInt(data.DATA[j].GET_MAX_SCORE);
					home_get_score+=parseInt(data.DATA[j].STUDENT_SCORE);
					
				}
				
				$(".content_l ul").html(_html);
				
				dataMethod(_index,data_temp);
				$(".content_l li").eq(_index).siblings().removeClass("on");
				$(".content_l li").eq(_index).addClass("on");
				window.top.loading.remove();

	
	}	
	
	$( document ).ready(function() {
		$("#starDate").val(data.START_DATE);
		$("#endDate").val(data.END_DATE);
		
		getData();
			
		$(document).on("click",".content_l li",function(){
			
		 $(this).siblings().removeClass("on");
			$(this).addClass("on");
			_index=$(this).index();
			student(data.STUDENTS[_index].CLASS_ID,data.STUDENTS[_index].ID);

		 })
		 $("input[type=radio]").change(function(){

			 dataMethod(_index,data_temp);
		})
		
		$("#search").click(function(){

			window.top.loading.show();
			//startDate = $("#starDate").val();
			//endDate = $("#endDate").val();
			//getData(startDate,endDate);
			
			 student(data.STUDENTS[_index].CLASS_ID,data.STUDENTS[_index].ID);
			
		})
		
		$(".prev").click(function(){
			 _index-=1;
			 if(_index<0){
				 _index=data_temp.STUDENTS.length-1;
			 }
			 student(data.STUDENTS[_index].CLASS_ID,data.STUDENTS[_index].ID);
		 })
		 $(".next").click(function(){
			 _index+=1;
			 if(_index>(data_temp.STUDENTS.length-1)){
				 _index=0;
			 }
			 student(data.STUDENTS[_index].CLASS_ID,data.STUDENTS[_index].ID);
		 })
    });
	
	
	function dataMethod(index,data){
		
		if(data.DATA.length==0){
			return false;
		}
		
		var GETSCORE = parseFloat(home_get_score);
		var TOTALSCORE = parseFloat(home_all_score);
		var ratio=(GETSCORE/TOTALSCORE*100).toFixed(2);
		var class_avg= (home_avg_score/ home_all_score*100).toFixed(2);
		var class_max=(home_max_score/ home_all_score*100).toFixed(2);
		
		var test_num=data.DATA.length;
		var part_num=test_num;
		
			data0=[];
			data1=[];
			data2=[];
			data3=[];
		
		//console.log(data.data.studentList[index].testList[2].SCORE);
		if($("input[type='radio']:checked").val()==1){
			for(var i=0;i<test_num;i++){
			if(1>0){
				data0[i]=data.DATA[i].NAME+"\n"+data.DATA[i].COMPLETE_DATE;//data.data.studentList[index].testList[i].NAME + "\n" + data.data.studentList[index].testList[i].CREATE_DATE;
				data1[i]=(data.DATA[i].AVG_SCORE/data.DATA[i].PAPER_SCORE*100).toFixed(2);//(data.data.studentList[index].testList[i].AVG_SCORE/data.data.studentList[index].testList[i].TOTAL_SCORE*100).toFixed(2);
				data2[i]=(data.DATA[i].STUDENT_SCORE/data.DATA[i].PAPER_SCORE*100).toFixed(2);//(data.data.studentList[index].testList[i].SCORE/data.data.studentList[index].testList[i].TOTAL_SCORE*100).toFixed(2);
				data3[i]=(data.DATA[i].GET_MAX_SCORE/data.DATA[i].PAPER_SCORE*100).toFixed(2);//(data.data.studentList[index].testList[i].MAX_SCORE/data.data.studentList[index].testList[i].TOTAL_SCORE*100).toFixed(2);
			}else{
				data1[i]=0;
				data2[i]=0;
				data3[i]=0;
			}
			
			if(data.DATA[i].STUDENT_SCOREE=="0")
				part_num--;
			}
		}else if($("input[type='radio']:checked").val()==2){
			for(var i=0;i<test_num;i++){
			data0[i]=data.DATA[i].NAME+"\n"+data.DATA[i].COMPLETE_DATE;
			data1[i]=data.DATA[i].AVG_SCORE;
			data2[i]=data.DATA[i].STUDENT_SCOREE;
			data3[i]=data.DATA[i].GET_MAX_SCORE;
			if(data.DATA[i].STUDENT_SCOREE=="0")
				part_num--;
			}
		}
		
		console.log(data0);
		console.log(data1);
		console.log(data2);
		console.log(data2);
		var partake=(part_num/test_num*100).toFixed(2);
		
		
		$("#class_avg").html(class_avg);
		$("#class_max").html(class_max);
		//console.log(data);
		$(".name h1").html(data.DATA[0].STUDENT_NAME);
		$(".circle .col-md-6").eq(1).html('<div id="myStathalf1" data-dimension="350" data-text="'+ratio+"%"+'" data-info="个人平均得分率" data-width="10" data-fontsize="38" data-percent="'+ratio+'" data-fgcolor="#8ad254" data-bgcolor="#a9f9ff" data-type="half" data-fill="#50b5c9"></div>');
		$(".circle .col-md-6").eq(0).html('<div id="myStathalf" data-dimension="350" data-text="'+part_num+'/'+test_num+'" data-info="参与测试" data-width="10" data-fontsize="38" data-percent="'+partake+'" data-fgcolor="#8ad254" data-bgcolor="#a9f9ff" data-type="half" data-fill="#50b5c9"></div>');
		$('#myStathalf1').circliful();
		$('#myStathalf').circliful();
		 myChart.setOption({
			 	tooltip:{
			 	         trigger: 'axis'
			 	},
			    xAxis: {
			        type: 'category',
			        data: data0
			        /*,
			        axisLabel:{interval: 0}*/
			    },
			    yAxis: {
			        type: 'value',
			        splitArea: {show: true}
			    },
			    series: [{
			    	name:"班级平均分",
			        data: data1,
			        type: 'line',
			        symbol: 'circle',
			        symbolSize: 5,
			        lineStyle: {
			            normal: {
			                color: '#93D150',
			                width: 2,
			                type: 'dashed'
			            }
			        },
			        itemStyle: {
			            normal: {
			                borderWidth: 2,
			                borderColor: '#93D150',
			                color: '#93D150'
			            }
			        }
			    },{
			    	name:"班级最高分",
			        data: data3,
			        type: 'line',
			        symbol: 'circle',
			        symbolSize: 5,
			        lineStyle: {
			            normal: {
			                color: '#FFC004',
			                width: 2,
			                type: 'dashed',
			            }
			        },
			        itemStyle: {
			            normal: {
			                borderWidth: 2,
			                borderColor: '#FFC004',
			                color: '#FFC004'
			            }
			        }
			    },{
			    	name:"个人成绩",
			        data: data2,
			        type: 'line',
			        symbol: 'circle',
			        symbolSize: 10,
			        lineStyle: {
			            normal: {
			                color: '#45a6f3',
			                width: 4,
			                type: 'solid'
			            }
			        },
			        itemStyle: {
			            normal: {
			                borderWidth: 3,
			                borderColor: '#45a6f3',
			                color: '#45a6f3',
			                label : {show: true,color:'#000'}
			            }
			        }
			    }]
			});
	}
	 
	 
	var myChart = echarts.init(document.getElementById('main'));
