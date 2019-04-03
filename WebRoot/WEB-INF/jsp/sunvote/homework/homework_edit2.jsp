<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en" style="overflow-x:hidden;">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	
	<link rel="stylesheet" href="static/css/bootstrap.min.css">
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
	
	
	<link rel="stylesheet" href="static/css/edit.css" />
	<style>
		
		
	</style>
</head>
<body class="no-skin homework_edit">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
					
					<form action="homework/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="TEACHER_ID" id="TEACHER_ID" value="${pd.TEACHER_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;width:80%;margin:0 auto;">
						<table id="table_report" class="table">
							<tr>
								<td style="width:95px;text-align: right;padding-top: 13px;">练习标题</td>
								<td><input type="text" name="TITLE" class="form-control" id="CODE" value="${pd.CODE}" maxlength="255" placeholder="输入练习标题，不超过20个汉字" title="作业代码" /></td>
							</tr>
							<tr>
								<td style="width:95px;text-align: right;padding-top: 13px;">练习说明</td>
								<td><input type="text" name="NAME" class="form-control" id="NAME" value="${pd.NAME}" maxlength="255" placeholder="输入题目说明，如教材第12页1-5题，教辅第5页1-3题，尽量精简，不超过100个汉字" title="作业名称" /></td>
							</tr>
							<tr>
								<td style="width:95px;text-align: right;padding-top: 13px;">指定班级完成时间</td>
								<td>
									<div class="classBox">
										<ul>
											<li>
												
												<input type="checkbox" id="class1" name="className" value="1"  />
												<label for="class1"></label>
												 <span>1班</span> 
												 <input class="date-picker" type="text" class="form-control" style="width:200px;text-align:center;" placeholder="完成日期" name="lastStart" id="lastStart" data-date-format="yyyy-mm-dd" readonly="readonly" value=""/>
											</li>
											<li>
												
												<input type="checkbox" id="class2" name="className" value="1"  />
												<label for="class2"></label>
												 <span>2班</span> 
												 <input class="date-picker" type="text" class="form-control" style="width:200px;text-align:center;" placeholder="完成日期" name="lastStart" id="lastStart" data-date-format="yyyy-mm-dd" readonly="readonly" value=""/>
											</li>
											<li>
												
												<input type="checkbox" id="class3" name="className" value="1"  />
												<label for="class3"></label>
												 <span>3班</span> 
												 <input class="date-picker" type="text" class="form-control" style="width:200px;text-align:center;" placeholder="完成日期" name="lastStart" id="lastStart" data-date-format="yyyy-mm-dd" readonly="readonly" value=""/>
											</li>
											<li>
												
												<input type="checkbox" id="class4" name="className" value="1"  />
												<label for="class4"></label>
												 <span>4班</span> 
												 <input class="date-picker" type="text" class="form-control" style="width:200px;text-align:center;" placeholder="完成日期" name="lastStart" id="lastStart" data-date-format="yyyy-mm-dd" readonly="readonly" value=""/>
											</li>
											<li>
												<input type="checkbox" id="class5" name="className" value="1" />
												<label for="class5"></label>
												<span>5班</span>
												<input class="date-picker" type="text" class="form-control" style="width:200px;text-align:center;" placeholder="完成日期" name="lastStart" id="lastStart" data-date-format="yyyy-mm-dd" readonly="readonly" value=""/>
											</li>
											<li>
												<input type="checkbox" id="class6" name="className" value="1" />
												<label for="class6"></label>
												<span>6班</span>
												<input class="date-picker" type="text" class="form-control" style="width:200px;text-align:center;" placeholder="完成日期" name="lastStart" id="lastStart" data-date-format="yyyy-mm-dd" readonly="readonly" value=""/>
											</li>
										</ul>
									</div>
								
								</td>
							</tr>
							
						</table>
						</div>
						<hr />
						<div class="subject" style="width:80%;margin:0 auto;">
							<table  width="100%">
								<col width="50%"/>
								<col width="20%"/>
								<col width="20%"/>
								<col width="10%"/>
								<thead>
									<tr>
										<th style="text-align:left;"><span>题目数量</span><span class="add">+</span><input type="number" class="w_100" id="que_num" value="0"/><span class="redu">-</span></th>
										<th><span>选项个数</span><span class="add">+</span><input type="number" class="w_100 ans_num" id="ans_num" value="4"/><span class="redu">-</span></th>
										<th><span>分值</span><span class="add">+</span><input type="number" class="w_100 score" id="score" value="1"/><span class="redu">-</span></th>
										<th></th>
									</tr>
								</thead>
							</table>
							<table width="100%" border="0"  class="subject_body_tabel">
								<col width="10%"/>
								<col width="40%"/>
								<col width="20%"/>
								<col width="20%"/>
								<col width="10%"/>
								<tbody class="subject_body_tbody">									
									<!-- <tr>
										<td class="first">1</td>
										<td class="middle">
											
											<div class="question question1">
												
												<ul>
													<li class="btn btn-default on">A</li>
													<li class="btn btn-default">B</li>
													<li class="btn btn-default">C</li>
													<li class="btn btn-default">D</li>
												</ul>
											</div>
											
										</td>
										<td class="middle"><span>选项个数</span><span class="add">+</span><input type="number" class="w_100 ans_num" value="4"/><span class="redu">-</span></td>
										<td class="middle"><span>分值</span><span class="add">+</span><input type="number" class="w_100 score" value="1"/><span class="redu">-</span></td>
										<td class="last"><a onclick="del('${var.ID}');"><img src="static/images/remove.png" /></a></td>
									</tr>
									<tr>
										<td class="first">1</td>
										<td class="middle">
											<div class="question question1">
												<ul>
													<li class="btn btn-default on">A</li>
													<li class="btn btn-default">B</li>
													<li class="btn btn-default">C</li>
													<li class="btn btn-default">D</li>
												</ul>
											</div>
										</td>
										<td class="middle"><span>选项个数</span><span class="add">+</span><input type="number" class="w_100 ans_num" value="4"/><span class="redu">-</span></td>
										<td class="middle"><span>分值</span><span class="add">+</span><input type="number" class="w_100 score" value="1"/><span class="redu">-</span></td>
										<td class="last"><a onclick="del('${var.ID}');"><img src="static/images/remove.png" /></a></td>
									</tr>-->
								</tbody>
							</table>
						</div>
						<hr />
						<div>
							<div style="text-align: center;" colspan="10">
								
								<a class="btn btn-mini btn-primary" onclick="save();">确定布置</a>
								<a class="btn btn-mini btn-danger" onclick="window.top.modal.remove();">取消</a>
							</div>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->

	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		var saveData={
				    "NAME": "",
				    "SUBJECT_ID": "",
				    "ALL_SCORE": "",
				    "TEACHER_ID":"",
				    "HOMEWORK_DESC": "",
				    "CLASSLIST": [
				        {
				            "CLASS_ID": "",
				            "COMPLETE_DATE": ""
				        },
				        {
				            "CLASS_ID": "",
				            "COMPLETE_DATE": ""
				        }
				    ],
				    "QUESTION_COUNT": "",
				    "QUESTIONS": [
				        {
				            "RANK": "",
				            "NAME": "",
				            "OPTION_NUM": "",
				            "SCORE": "",
				            "RIGHT_ANSWER": "",
				            "TYPE": ""
				        },
				        {
				            "RANK": "",
				            "NAME": "",
				            "OPTION_NUM": "",
				            "SCORE": "",
				            "RIGHT_ANSWER": "",
				            "TYPE": ""
				        }
				    ]
		};
		$(document).on('click',"input[type='checkbox']",function(){
			console.log($(this).attr("checked"));
			if($(this).prop('checked')){
				$(this).closest("li").attr("class","checked");
			}else{
				$(this).closest("li").removeClass("checked");
			}
			
		});
		var work={        //保存标题框中的数字框的值
			que_num:0,
			ans_num:4,
			score:0
		}
		//点击+执行操作
		function creat_work(_id,index,num){//index:开始序号，num:目标序号
			
			if(_id=="que_num"){    //新增题目
				for(j=index;j<=num;j++){
					$(".subject_body_tbody").append('<tr><td class="first">'+j+'</td><td class="middle"><div class="question question'+j+'"><ul></ul></div></td><td class="middle"><span>选项个数</span><span class="add">+</span><input type="number" class="w_100 ans_num" value="'+$("#ans_num").val()+'"/><span class="redu">-</span></td><td class="middle"><span>分值</span><span class="add">+</span><input type="number" class="w_100 score" value="1"/><span class="redu">-</span></td><td class="last"><a class="remove"><img src="static/images/remove.png" /></a></td></tr>');
					for(i=0;i<work.ans_num;i++){
						$(".question"+j+" ul").append('<li class="btn btn-default">'+String.fromCharCode(0x41 + i)+'</li>')
					}
				}
			}
			else if(_id=="ans_num"){//新增选项
				for(j=1;j<=work.que_num;j++){	//轮询每道题目
					var now_length=$(".question"+j+" ul").find(".btn").length; //获取当前题目选项个数
					if(now_length<work.ans_num){   //当前题目选项个数小于数字框中个数，则把选项个数增加到数字框中的个数
						for(i=now_length;i<work.ans_num;i++){
							console.log("index:"+index+"-"+"num:"+num+"i:"+i);
							$(".question"+j+" ul").append('<li class="btn btn-default">'+String.fromCharCode(0x41 + i)+'</li>')
						}
					}
					if(now_length>work.ans_num){//当前题目选项个数大于数字框中个数，则把选项个数减少到数字框中的个数
						for(i=now_length;i>=work.ans_num;i--){
							$(".question"+j+" ul").find(".btn").eq(work.ans_num).remove();
						}
					}
					
				}
				
			}else{
				if(_id.siblings(".w_100").attr("class").indexOf("ans_num")>-1){ //没有id，但是class中含有ans_num，则为单个题目中的选项设置框
					var _index=_id.closest("tr").index()+1;
					for(i=index;i<=num;i++){
						$(".question"+_index+" ul").append('<li class="btn btn-default">'+String.fromCharCode(0x41 + i-1)+'</li>')
					}
				}
			}
		}
		//点击-执行操作
		function remove_work(_id,index,num){
			
			if(_id=="que_num"){	//减少题目
				for(i=index;i<=num;i++){
					$(".subject_body_tbody tr").eq(index).remove();
				}
			}
			if(_id=="ans_num"){  //减少选项
				for(j=1;j<=work.que_num;j++){    //轮询每道题目
					var now_length=$(".question"+j+" ul").find(".btn").length;  //获取当前题目中的选项个数
					if(now_length>work.ans_num){     //如果当前选项个数大于数字框中的值，则减少选项个数到数字框中的个数
						for(i=now_length;i>=work.ans_num;i--){
							$(".question"+j+" ul").find(".btn").eq(work.ans_num).remove();
						}
					}
					if(now_length<work.ans_num){  //如果当前选项个数小于数字框中的值，则增加选项个数到数字框中的个数
						for(i=now_length;i<work.ans_num;i++){
							$(".question"+j+" ul").append('<li class="btn btn-default">'+String.fromCharCode(0x41 + i)+'</li>')
						}
					}
					
				}
			}else{
				if(_id.siblings(".w_100").attr("class").indexOf("ans_num")>-1){  //没有id值，但是类名中含有ans_num，则判断为单个题目中的选项设置框
					var _index=_id.closest("tr").index()+1;
					for(i=index;i<=num;i++){
						$(".question"+_index+" ul").find(".btn").eq(index).remove();
					}
				}
			}
			
		}
		//点击+按钮
		$(document).on("click",".add",function(){
			var _that=$(this);
			var temp_num=0;
			//获取当前按钮旁边数字框的值
			temp_num=parseInt(_that.siblings(".w_100").val());
			temp_num+=1;
			//点击+号，数字框中的数字+1
			_that.siblings(".w_100").val(temp_num);
			//如果数字框有id，则是标题栏上面的数字框
			if(_that.siblings(".w_100").attr("id")){
				//将下面的数字框的值设置成标题栏数字框的值
				var _class=_that.siblings(".w_100").attr("id");
				$("."+_class).val(temp_num);
				//题目数
				if(_class=="que_num"){
					work.que_num=temp_num;
					creat_work(_class,work.que_num,work.que_num);
				}
				//选项数
				if(_class=="ans_num"){
					work.ans_num=temp_num;
					creat_work(_class,work.ans_num,work.ans_num);
				}				
			}
			else{
				if(_that.siblings(".w_100").attr("class").indexOf("ans_num")>-1){
					creat_work(_that,temp_num,temp_num);
				}
			}
			
		})
		//点击-按钮
		$(document).on("click",".redu",function(){
			var _that=$(this);
			var temp_num=0;
			
			temp_num=parseInt(_that.siblings(".w_100").val());
			temp_num-=1;
			if(temp_num<0){
				temp_num=0;
				return;
			}
			
			_that.siblings(".w_100").val(temp_num);
			
			if(_that.siblings(".w_100").attr("id")){
				var _class=$(this).siblings(".w_100").attr("id");
				$("."+_class).val(temp_num);
				
				if(_class=="que_num"){
					work.que_num=temp_num;
					remove_work(_class,work.que_num,work.que_num);
				}
				if(_class=="ans_num"){
					work.ans_num=temp_num;
					remove_work(_class,work.ans_num,work.ans_num);
				}	
			}else{
				if(_that.siblings(".w_100").attr("class").indexOf("ans_num")>-1){
					remove_work(_that,temp_num,temp_num);
				}
			}
			
		})
		$(document).on("click",".remove",function(){
			var _that=$(this);
			_that.closest("tr").remove();
			work.que_num=$(".first").length;
			$("#que_num").val(work.que_num);
			for(i=0;i<$(".first").length;i++){
				//console.log($(".first").closest("tr").index());
				$(".first").eq(i).text(i+1);
				$(".question").eq(i).attr("class","question question"+(i+1));
			}
		});
		$(document).on("click","li.btn ",function(){
			if($(this).attr("class").indexOf("on")>-1)
				$(this).removeClass("on");
			else
				$(this).addClass("on");
		});
		$("#que_num").change(function(){
			var now_num=parseInt($("#que_num").val());
			var old_num=parseInt(work.que_num);
			var _temp=now_num-old_num;
			
			if(_temp>0){
				creat_work($(this).attr("id"),(old_num+1),now_num);
			}else{
				remove_work($(this).attr("id"),now_num,old_num);
			}
			
			work.que_num=now_num;
			
		})
		$("#ans_num").change(function(){
			var now_num=parseInt($("#ans_num").val());
			var old_num=parseInt(work.ans_num);
			var _temp=now_num-old_num;
			
			$(".ans_num").val(now_num);
			work.ans_num=now_num;
			
			if(_temp>0){
				creat_work($(this).attr("id"),(old_num+1),now_num);
			}else{
				remove_work($(this).attr("id"),now_num,old_num);
			}
			
			
		});
		
		
		
		function save(){
			if($("#CODE").val()==""){
				$("#CODE").tips({
					side:3,
		            msg:'请输入作业代码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CODE").focus();
			return false;
			}
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入作业名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}
			if($("#SUBJECT_ID").val()==""){
				$("#SUBJECT_ID").tips({
					side:3,
		            msg:'请输入科目ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUBJECT_ID").focus();
			return false;
			}
			if($("#CLASS_ID").val()==""){
				$("#CLASS_ID").tips({
					side:3,
		            msg:'请输入班级ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CLASS_ID").focus();
			return false;
			}
			if($("#GRADE_ID").val()==""){
				$("#GRADE_ID").tips({
					side:3,
		            msg:'请输入年级ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GRADE_ID").focus();
			return false;
			}
			if($("#SCHOOL_ID").val()==""){
				$("#SCHOOL_ID").tips({
					side:3,
		            msg:'请输入学校ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SCHOOL_ID").focus();
			return false;
			}
			if($("#COMPLETE_DATE").val()==""){
				$("#COMPLETE_DATE").tips({
					side:3,
		            msg:'请输入需要完成时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#COMPLETE_DATE").focus();
			return false;
			}
			if($("#CREATE_DATE").val()==""){
				$("#CREATE_DATE").tips({
					side:3,
		            msg:'请输入创建时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATE_DATE").focus();
			return false;
			}
			if($("#MODIFY_DATE").val()==""){
				$("#MODIFY_DATE").tips({
					side:3,
		            msg:'请输入修改时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MODIFY_DATE").focus();
			return false;
			}
			if($("#COMPLETE_COUNT").val()==""){
				$("#COMPLETE_COUNT").tips({
					side:3,
		            msg:'请输入完成次数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#COMPLETE_COUNT").focus();
			return false;
			}
			if($("#ALL_SCORE").val()==""){
				$("#ALL_SCORE").tips({
					side:3,
		            msg:'请输入总分',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ALL_SCORE").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			window.top.loading.remove();
			//日期框
			
			$(document).on("focus",".date-picker",function(){
				$(this).datepicker({
					autoclose: true,
					todayHighlight: true
				});			
			});
	
			$.ajax({
				url:'<%=basePath%>/coursemanagement/teacherClass',
				type:"post",
				data:{teacher_id:"08b418184e5044c7b419caa830b834a7"},
				success:function(res){
					console.log(res);
					if(res.data.length>0){
						var _html="";
						$.each(res.data,function(k,v){
							_html+='<li><input type="checkbox" id="class'+k+'" name="className" value="'+v.ID+'"><label for="class'+k+'"></label><span>'+v.CLASS_NAME+'</span><input class="date-picker" type="text" style="width:150px;text-align:center;" placeholder="完成日期" name="lastStart" id="lastStart" data-date-format="yyyy-mm-dd" readonly="readonly" value=""></li>';
							
						});
						$(".classBox ul").html(_html);
					}
				}
			});
			
		});
		</script>
</body>
</html>