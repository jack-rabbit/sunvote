		var url="";
		var class_html="",
			option_html="";
		var user_id= "",
			subject_id="",
			class_id="";
		$(document).ready(function(){
			getList();
			timeList();
			$.ajax({
				url:url+"/SunvoteEducation/teacher/info",
				async:false,
				type:"post",
				success:function(data){
					console.log(data);
					subject_id=data.data.subjectList[0].SUBJECT_ID;
					user_id=data.data.ID;

					if(data.data.classInfoList.length>0){
						for(var i=0;i<data.data.classInfoList.length;i++){
							class_html += '<li data-classId="'+data.data.classInfoList[i].CLASS_ID+'">'+data.data.classInfoList[i].CLASS_NAME+'</li>';
							option_html += '<option value="'+data.data.classInfoList[i].CLASS_ID+'">'+data.data.classInfoList[i].CLASS_NAME+'</option>'
						}
						$(".classList").html(class_html+'<div class="clearfix"></div>');
						$(".classList li").eq(0).addClass("active");
						$("#dealer_id_2").html(option_html);
					}
				}
			})

			//日期框
			$('.date-picker').datepicker({
				autoclose: true,
				todayHighlight: true
			});
			window.top.loading.remove();
		})
		
		function getList(start_date,end_date,class_id){       //获取试卷列表
			var tab_html="";
			$.ajax({
				url:url+"/SunvoteEducation/api/v1/paper",
				async:false,
				type:"post",
				data:{
					paper_type:"101",
					user_id:user_id,
					subject_id:subject_id,
					class_id:class_id,
					currentpage:"1",
					showcount:"",
					start_date:start_date,
					end_date:end_date
				},
				success:function(data){
					console.log(data);
					for(var i=0;i<data.data.length;i++){
						tab_html += '<tr data-id="'+data.data[i].PAPER_ID+'" data-classid="'+data.data[i].CLASS_ID+'"><td><input type="checkbox" name="ids" id="ids" value="'+data.data[i].PAPER_ID+'"/>'+(i+1)+'</td><td>'+data.data[i].TITLE+'</td><td>'+getClassName(data.data[i].CLASS_ID)+'</td><td>'+getSubjectName(data.data[i].SUBJECT_ID)+'</td><td>'+data.data[i].EXAM_TIME+'分钟</td><td>'+data.data[i].CREATE_DATE+'</td><td><a onclick="jump($(this))">查看</a></td><td><a href="#" onclick="del($(this));"><img src="../static/images/remove.png" /></a></td></tr>';
					}
					$("#tab_body").html(tab_html);
					window.top.loading.remove();
				}
			});
		}
		$('#ids').on('click', function(){
				var th_checked = $("#ids").prop('checked');//checkbox inside "TH" table header
				
				$(".table_box .table").find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
		});
		function jump(obj){          //预览试卷
			window.top.loading.show();
			var id=obj.closest("tr").attr("data-id");
			var classid=obj.closest("tr").attr("data-classid");
			location.href="paper_view2.do?PAPER_ID="+id+"&classID="+classid+"&userid="+user_id;
		}
		$(".classList").on("click","li",function(){
			$(this).siblings().removeClass("active");
			$(this).addClass("active");
			
		});
		$("#creatPaper").click(function(){   //新建试卷
			$('#myModal').modal('show');
		});
		function setQUestion(){             //新建试卷-选择班级
			if($(".classList .active").length>0){
				class_id=$(".classList .active").attr("data-classid");
				location.href="set_question.do?subject_id="+subject_id+"&class_id="+class_id+"&user_id="+user_id;
			}else{
				alert("请先选择班级");
			}
			window.top.loading.show();
				console.log($(".classList .active").length);
			//location.href="";
		}
		function getSubjectName(id){           //获取科目中文名
			var subjectName="";
			$.ajax({
				url:url+"/SunvoteEducation/api/v1/subjectcname",
				async:false,
				type:"post",
				data:{id:id},
				success:function(data){
					subjectName=data.data;
				}
			})
			return subjectName;
		}
		function getClassName(id){        //获取班级中文名
			var className="";
			$.ajax({
				url:url+"/SunvoteEducation/api/v1/classname",
				async:false,
				type:"post",
				data:{id:id},
				success:function(data){
					className=data.data;
				}
			})
			return className;
		}
		function getday(month){         //获取日期
			var time=[];
			var  d= new Date();
			 d.setMonth(month-1);
			 d.setDate(1);
			 var day=d.getDate();
			 var month=d.getMonth()+1;
			 if((d.getMonth()+1)<10){
				 var month="0"+(d.getMonth()+1);
			 }
			 var year=d.getFullYear();
			 var startTime=year+"-"+month+"-"+day;
			 d.setMonth(month);
			 var end_day=d.getDate();
			 var end_month=d.getMonth()+1;
			 if((d.getMonth()+1)<10){
				 var end_month="0"+(d.getMonth()+1);
			 }
			 var end_year=d.getFullYear();
			 var endTime=end_year+"-"+end_month+"-"+end_day;
			 time[0]=startTime;
			 time[1]=endTime;
			 return time;
		}
		function timeList(){          //渲染时间列表
			var time = new Date();
			var now_month=time.getMonth()+1;
			time.setMonth(now_month-1)
			if(time.getMonth()!= 0 ){
				var preceding_month = time.getMonth();
			}else
				var preceding_month = 12;
			time.setMonth(now_month-2)
			if(time.getMonth()!= 0 ){
				var last_month = time.getMonth();
			}else
				var last_month = 12;
			var option_html="";
			option_html += '<option value="'+now_month+'">'+now_month+'月</option><option value="'+preceding_month+'">'+preceding_month+'月</option><option value="'+last_month+'">'+last_month+'月</option>';
			$("#dealer_id_1").html(option_html);
		}
		function tosearch(){        //搜索
			//var timeBox=getday($("#dealer_id_1").val());
			var start_date=$("#lastStart").val();
			var end_date=$("#lastEnd").val();
			var class_id=$("#dealer_id_2").val();
			getList(start_date,end_date,class_id);
		}

		function del(obj){       //删除
			//var remove = new remove();
			var id=obj.closest("tr").attr("data-id");
			window.top.remove.init({"title":"删除","func":function(success){
				if(success){
					var url = "/SunvoteEducation/paper/delete.do?PAPER_ID="+id+"&tm="+new Date().getTime();
					window.top.loading.show();
					$.get(url,function(data){
						tosearch();
					});
				}
				else{
					console.log("false");
				}
			}});
			window.top.remove.show();
		}
		function deleteAll(){       //批量删除
			window.top.remove.init({"title":"删除","func":function(success){
				if(success){
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++){
					  if(document.getElementsByName('ids')[i].checked){
					  	if(str=='') str += document.getElementsByName('ids')[i].value;
					  	else str += ',' + document.getElementsByName('ids')[i].value;
					  }
					}
					if(str==''){
						
					}else{
						$.ajax({
								type: "POST",
								url: '/SunvoteEducation/paper/deleteAll.do?tm='+new Date().getTime(),
						    	data: {DATA_IDS:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									 $.each(data.list, function(i, list){
											tosearch();
									 });
								}
							});
					}
				}
				else{
					console.log("false");
				}
			}});
			window.top.remove.show();
		}