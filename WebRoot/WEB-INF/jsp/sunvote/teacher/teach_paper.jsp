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
    <title>即时测</title>

    <!-- Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	
	<link rel="stylesheet" href="../static/ace/css/datepicker.css" />
	<link href="../static/css/teach.css" rel="stylesheet">
	<link href="../static/css/paper.css?t=1" rel="stylesheet">
  </head>
  <body>
  
	  <div class="head_box">
		<div class="box_header">
			<div class="head_box_l">
				<p>
					<span class="right_b"></span>即时测试卷管理
				</p>
			</div>
			<div class="head_box_r">
				<input class="date-picker" type="text" placeholder="开始日期" name="lastStart" id="lastStart" data-date-format="yyyy-mm-dd" readonly="readonly" value=""/> 
				<input type="text" class="date-picker" placeholder="结束日期" name="lastEnd" id="lastEnd" data-date-format="yyyy-mm-dd" readonly="readonly" value=""/>
				<select name="dealer_id_2" id="dealer_id_2" class="selectpicker show-tick form-control"  data-width="98%" data-first-option="false" required data-live-search="true">
					<!--<option value="0">初一1501班</option>
					<option value="0">初一1502班</option>
					<option value="0">初一1503班</option>
					<option value="0">初一1504班</option>
					<option value="0">初一1505班</option>-->
				 </select>
				 <a onclick="tosearch();"><img
					src="../static/images/search.png" /></a>
			</div>
			<div class="clear"></div>
			</div>
			<div style="padding:0 5%;background:#fff;">
				<table class="table table-striped">
				<col style="width: 10%" />
				<col style="width: 20%" />
				<col style="width: 10%" />
				<col style="width: 10%" />
				<col style="width: 10%" />
				<col style="width: 20%" />
				<col style="width: 10%" />
				<col style="width: 10%" />
				<thead>
					<tr>
						<th><input type="checkbox"  name='ids' id="ids" />序号</th>
						<th>试卷名称</th>
						<th>班级</th>
						<th>科目</th>
						<th>考试时长</th>
						<th>创建时间</th>
						<th>查看</th>
						<th>操作</th>
					</tr>
				</thead>
			</table>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="table_box">
			<table class="table table-striped">
				<col style="width: 10%" />
				<col style="width: 20%" />
				<col style="width: 10%" />
				<col style="width: 10%" />
				<col style="width: 10%" />
				<col style="width: 20%" />
				<col style="width: 10%" />
				<tbody id="tab_body">
				
				</tbody>
			</table>
	
	
			<div class="footer">
				<div class="creat">
					<input type="button"  id="creatPaper" value="新建试卷" />
				</div>
				<div class="removeAll">
					<input type="button" onclick="deleteAll()" value="批量删除" />
				</div>
				<div class="page_box">
					
					<div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">请选择班级</h4>
			  </div>
			  <div class="modal-body">
				<form class="form-horizontal">
				  <div class="classList">
					<ul>
						
					</ul>
				  </div>
				</form>
			  </div>
			  <div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-primary" id="submit" onclick="setQUestion()">确定</button>
			  </div>
			</div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
  
 
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<script src="../static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="../static/ace/js/bootbox.js"></script>

	<script>
		var url="/SunvoteEducation";
		
		var class_html="",option_html="";
		var user_id= "",
			subject_id="",
			class_id="";
		$(document).ready(function(){
			getList();
			timeList();
			$.ajax({
				url:url+"/teacher/info",
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
		
		function getList(start_date,end_date,class_id){
			var tab_html="";
			$.ajax({
				url:url+"/api/v1/paper",
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
		function jump(obj){
			var id=obj.closest("tr").attr("data-id");
			var classid=obj.closest("tr").attr("data-classid");
			location.href="paper_view.do?PAPER_ID="+id+"&classID="+classid+"&userid="+user_id;
		}
		$(".classList").on("click","li",function(){
			$(this).siblings().removeClass("active");
			$(this).addClass("active");
			class_id=$(this).attr("data-classid");
		});
		$("#creatPaper").click(function(){
			$('#myModal').modal('show');
		});
		function setQUestion(){
			if($(".classList .active").length>0){
				location.href="set_question.do?subject_id="+subject_id+"&class_id="+class_id;
			}else{
				alert("请先选择班级");
			}
			window.top.loading.show();
				console.log($(".classList .active").length);
			//location.href="";
		}
		function getSubjectName(id){
			var subjectName="";
			$.ajax({
				url:url+"/api/v1/subjectcname",
				async:false,
				type:"post",
				data:{id:id},
				success:function(data){
					subjectName=data.data;
				}
			})
			return subjectName;
		}
		function getClassName(id){
			var className="";
			$.ajax({
				url:url+"/api/v1/classname",
				async:false,
				type:"post",
				data:{id:id},
				success:function(data){
					className=data.data;
				}
			})
			return className;
		}
		function getday(month){
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
		function timeList(){
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
		function tosearch(){
			//var timeBox=getday($("#dealer_id_1").val());
			var start_date=$("#lastStart").val();
			var end_date=$("#lastEnd").val();
			var class_id=$("#dealer_id_2").val();
			getList(start_date,end_date,class_id);
		}

		function del(obj){
			//var remove = new remove();
			var id=obj.closest("tr").attr("data-id");
			window.top.remove.init({"title":"删除","func":function(success){
				if(success){
					var url = "<%=basePath%>paper/delete.do?PAPER_ID="+id+"&tm="+new Date().getTime();
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
		function deleteAll(){
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
								url: '<%=basePath%>paper/deleteAll.do?tm='+new Date().getTime(),
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
	</script>
</html>