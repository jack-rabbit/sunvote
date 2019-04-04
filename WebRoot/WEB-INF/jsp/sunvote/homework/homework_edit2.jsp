<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="myelfun" uri="/WEB-INF/tld/elfun.tld"%>

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
								<td><input type="text" name="NAME" class="form-control" id="NAME" value="${pd.NAME}" maxlength="255" placeholder="输入练习标题，不超过20个汉字" title="作业代码" /></td>
							</tr>
							<tr>
								<td style="width:95px;text-align: right;padding-top: 13px;">练习说明</td>
								<td><input type="text" name=HOMEWORK_DESC class="form-control" id="HOMEWORK_DESC" value="${pd.HOMEWORK_DESC}" maxlength="255" placeholder="输入题目说明，如教材第12页1-5题，教辅第5页1-3题，尽量精简，不超过100个汉字" title="作业名称" /></td>
							</tr>
							<tr>
								<td style="width:95px;text-align: right;padding-top: 13px;">指定班级完成时间</td>
								<td>
									<div class="classBox">
										<ul>
											<c:if test="${pd.CLASS_ID != null}">
												<li class="checked">
													<input type="checkbox" checked="true" id="class0" name="className" value="${pd.CLASS_ID}"  />
													<label for="class0"></label>
													 <span>${myelfun:findClassName(pd.CLASS_ID)}</span> 
													 <input class="date-picker" type="text" class="form-control" style="width:150px;text-align:center;" placeholder="完成日期" name="lastStart" id="lastStart" data-date-format="yyyy-mm-dd" readonly="readonly" value="${pd.COMPLETE_DATE}"/>
												</li>
											</c:if>
											<!-- <li>
												
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
											</li> -->
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
										<th style="text-align:left;"><span>题目数量</span><span class="add">+</span><input type="number" class="w_100" id="que_num" value="${pd.QUESTION_COUNT==null?0:pd.QUESTION_COUNT}"/><span class="redu">-</span></th>
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
									<c:choose>
										<c:when test="${not empty pd.QUESTIONS}">
											<c:forEach items="${pd.QUESTIONS}" var="var" varStatus="vs">
												<tr>
													<td class="first">${var.RANK}</td>
													<td class="middle">
														<div class="question question${var.RANK}">
															<ul>
																<c:forEach var="i" begin="1" end="${var.OPTION_NUM}">
																	<c:set var="a" value="${fn:substring('ABCDEFGHI',i-1,i)}"/>
																	
																	<li class="btn btn-default <c:if test="${fn:contains(var.RIGHT_ANSWER, a)}"> on </c:if>">${a}</li>
																</c:forEach>
																
															</ul>
														</div>
														
													</td>
													<td class="middle"><span>选项个数</span><span class="add">+</span><input type="number" class="w_100 ans_num" value="${var.OPTION_NUM}"/><span class="redu">-</span></td>
													<td class="middle"><span>分值</span><span class="add">+</span><input type="number" class="w_100 score" value="${var.SCORE}"/><span class="redu">-</span></td>
													<td class="last"><a class="remove"><img src="static/images/remove.png" /></a></td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr class="main_info">
												<td colspan="100" class="center">没有相关数据</td>
											</tr>
										</c:otherwise>
									</c:choose>									
									
								</tbody>
							</table>
						</div>
						<hr />
						<div>
							<div style="text-align: center;" colspan="10">
								
								<a class="btn btn-mini btn-primary" onclick="save();">确定布置</a>
								<a class="btn btn-mini btn-danger" onclick="back()">取消</a>
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
	<!--页面交互-->
	<script src="static/js/control_homework.js?t=1"></script>
	<script>
	var homework_id="${pd.HOMEWORK_ID}";
	
	$(function() {
		window.top.loading.remove();
		work.que_num=parseInt($("#que_num").val());
		//日期框
		$(document).on("focus",".date-picker",function(){
			$(this).datepicker({
				autoclose: true,
				todayHighlight: true
			});			
		});
	if(${pd.CLASS_ID==null}==true){
		$.ajax({         //获取该名教师下的班级信息
			url:'<%=basePath%>coursemanagement/teacherClass',
			type:"get",
			data:{teacher_id:"${pd.TEACHER_ID}"},
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
	}
		
		
	});
	function back(){
		var path = '<%=basePath%>homework/list.do?teacher_id=${pd.TEACHER_ID}';
		parent.$("#mainFrame").attr('src',path);
		window.top.loading.show();
	}
	function save_data(data){
		$.ajax({         //获取该名教师下的班级信息
			url:'<%=basePath%>homework/uploadHomework',
			type:"post",
			dataType:"text",
			data:{"JSON":data},
			success:function(res){
				var res=JSON.parse(res);
				if(res.message=="success"){
					alert(res.message);
					console.log(res);
					
					var path = '<%=basePath%>homework/list.do?teacher_id=${pd.TEACHER_ID}';
					parent.$("#mainFrame").attr('src',path);
					window.top.loading.show();
				}
				
			}
		});
	}
	function up_data(data){
		$.ajax({         //获取该名教师下的班级信息
			url:'<%=basePath%>homework/updateHomework',
			type:"post",
			dataType:"text",
			data:{"JSON":data},
			success:function(res){
				var res=JSON.parse(res);
				if(res.message=="success"){
					alert(res.message);
					console.log(res);
					
					var path = '<%=basePath%>homework/list.do?teacher_id=${pd.TEACHER_ID}';
					parent.$("#mainFrame").attr('src',path);
					window.top.loading.show();
					
				}
			}
		});
	}
	
	</script>
</body>
</html>