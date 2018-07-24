
	var data0=[],data1=[],data2=[],data3=[];
	var startDate,endDate;
	var studentid;
	var data_temp,_index=0;
	function getQueryString(name) {
		  var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
		  var r = window.location.search.substr(1).match(reg);
		  if (r != null) return unescape(r[2]); return null;
	  	}
	function getData(startDate,endDate){
		var attend = "" ;
		if(startDate != null && endDate != null){
			attend = "&start_Date="+startDate+"&end_Date="+endDate;
		}
		$.ajax({
			url:URL+ attend,
			type:"get",
			async:false,
			dataType:"json",
			success:function(data){
				data_temp=data;
				console.log(data);
				var _html='';
				for(var i=0;i<data.data.studentList.length;i++){
					_html+='<li><p>'+data.data.studentList[i].NAME+'</p></li>';
					if(studentid==data.data.studentList[i].ID)
						_index=i;
				}
				$(".content_l ul").html(_html);
				console.log(_index);
				
			}
			
		});
		data(_index,data_temp);
		$(".content_l li").eq(_index).siblings().removeClass("on");
		$(".content_l li").eq(_index).addClass("on");
	}		
	$( document ).ready(function() {
		//alert($("input[type=radio][checked]").val());
		
		studentid=getQueryString("studentid");
		
		startDate = $("#starDate").val();
		endDate = $("#endDate").val();
		getData(startDate,endDate);
		
		//$('#myStathalf').circliful();
		//$('#myStathalf1').circliful();
		$(document).on("click",".content_l li",function(){
		 $(this).siblings().removeClass("on");
			$(this).addClass("on");
			_index=$(this).index();
			data(_index,data_temp);
			studentid = 0;
		 })
		 $("input[type=radio]").change(function(){
			//alert($("input[type='radio']:checked").val());
			data(_index,data_temp);
		})
		
		$("#search").click(function(){
//			var date_string=$("#test6").val();
//			var date_arry=date_string.split(' - ');
//			startDate=date_arry[0];
//			endDate=date_arry[1];
			startDate = $("#starDate").val();
			endDate = $("#endDate").val();
			getData(startDate,endDate);
		})
		
		$(".prev").click(function(){
			 _index-=1;
			 if(_index<0){
				 _index=data_temp.data.studentList.length-1;
			 }
			$(".content_l li").eq(_index).siblings().removeClass("on");
			$(".content_l li").eq(_index).addClass("on");
			 data(_index,data_temp);
		 })
		 $(".next").click(function(){
			 _index+=1;
			 if(_index>(data_temp.data.studentList.length-1)){
				 _index=0;
			 }
			$(".content_l li").eq(_index).siblings().removeClass("on");
			$(".content_l li").eq(_index).addClass("on");
			 data(_index,data_temp);
		 })
    });
	
	
	function data(index,data){
		console.log(data);
		//data0=[];data1=[];data2=[];data3=[];
		var GETSCORE = parseInt(data.data.studentList[index].GETSCORE);
		var TOTALSCORE = parseInt(data.data.TOTAL_SCORE);
		var ratio=(GETSCORE/TOTALSCORE*100).toFixed(2);
		var class_avg= (parseInt(data.data.AVG_SCORE)/ parseInt(data.data.TOTAL_SCORE)*100).toFixed(2);
		var class_max=(parseInt(data.data.MAX_SCORE)/ parseInt(data.data.TOTAL_SCORE)*100).toFixed(2);
		
		var test_num=data.data.studentList[index].testList.length;
		var part_num=test_num;
		
			data0=[];
			data1=[];
			data2=[];
			data3=[];
		
		//console.log(data.data.studentList[index].testList[2].SCORE);
		if($("input[type='radio']:checked").val()==1){
			for(var i=0;i<test_num;i++){
			if(data.data.studentList[index].testList[i].TOTAL_SCORE>0){
				data0[i]=data.data.studentList[index].testList[i].NAME;
				data1[i]=(data.data.studentList[index].testList[i].AVG_SCORE/data.data.studentList[index].testList[i].TOTAL_SCORE*100).toFixed(2);
				data2[i]=(data.data.studentList[index].testList[i].SCORE/data.data.studentList[index].testList[i].TOTAL_SCORE*100).toFixed(2);
				data3[i]=(data.data.studentList[index].testList[i].MAX_SCORE/data.data.studentList[index].testList[i].TOTAL_SCORE*100).toFixed(2);
			}else{
				data1[i]=0;
				data2[i]=0;
				data3[i]=0;
			}
			
			if(data.data.studentList[index].testList[i].SCORE=="0")
				part_num--;
			}
		}else if($("input[type='radio']:checked").val()==2){
			for(var i=0;i<test_num;i++){
			data0[i]=data.data.studentList[index].testList[i].NAME;
			data1[i]=data.data.studentList[index].testList[i].AVG_SCORE;
			data2[i]=data.data.studentList[index].testList[i].SCORE;
			data3[i]=data.data.studentList[index].testList[i].MAX_SCORE;
			if(data.data.studentList[index].testList[i].SCORE=="0")
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
		$(".name h1").html(data.data.studentList[index].NAME);
		$(".circle .col-md-6").eq(1).html('<div id="myStathalf1" data-dimension="350" data-text="'+ratio+"%"+'" data-info="个人平均得分率" data-width="10" data-fontsize="38" data-percent="'+ratio+'" data-fgcolor="#8ad254" data-bgcolor="#a9f9ff" data-type="half" data-fill="#50b5c9"></div>');
		$(".circle .col-md-6").eq(0).html('<div id="myStathalf" data-dimension="350" data-text="'+part_num+'/'+test_num+'" data-info="参与测试" data-width="10" data-fontsize="38" data-percent="'+partake+'" data-fgcolor="#8ad254" data-bgcolor="#a9f9ff" data-type="half" data-fill="#50b5c9"></div>');
		$('#myStathalf1').circliful();
		$('#myStathalf').circliful();
		 myChart.setOption({
			    xAxis: {
			        type: 'category',
			        data: data0
			    },
			    yAxis: {
			        type: 'value'
			    },
			    series: [{
			        data: data1,
			        type: 'line',
			        symbol: 'circle',
			        symbolSize: 5,
			        lineStyle: {
			            normal: {
			                color: 'green',
			                width: 2,
			                type: 'dashed'
			            }
			        },
			        itemStyle: {
			            normal: {
			                borderWidth: 2,
			                borderColor: 'green',
			                color: 'green'
			            }
			        }
			    },{
			        data: data3,
			        type: 'line',
			        symbol: 'circle',
			        symbolSize: 5,
			        lineStyle: {
			            normal: {
			                color: 'yellow',
			                width: 2,
			                type: 'dashed',
			            }
			        },
			        itemStyle: {
			            normal: {
			                borderWidth: 2,
			                borderColor: 'yellow',
			                color: 'yellow'
			            }
			        }
			    },{
			        data: data2,
			        type: 'line',
			        symbol: 'circle',
			        symbolSize: 10,
			        lineStyle: {
			            normal: {
			                color: 'blue',
			                width: 4,
			                type: 'solid'
			            }
			        },
			        itemStyle: {
			            normal: {
			                borderWidth: 3,
			                borderColor: 'blue',
			                color: 'blue',
			                label : {show: true}
			            }
			        }
			    }]
			});
	}
	 
	 
	var myChart = echarts.init(document.getElementById('main'));
