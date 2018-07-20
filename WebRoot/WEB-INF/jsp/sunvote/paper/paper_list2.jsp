<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>中天电子-教育管理系统</title>

<!-- Bootstrap -->
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../static/css/teach.css" rel="stylesheet">
<link rel="stylesheet" href="../static/ace/css/datepicker.css" />
<script src="../static/js/loading.js"></script>
<script src="../static/js/remove.js?a=1"></script>
<script src="../static/js/dailog.js"></script>

<!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
<!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

	<form action="../paper/list2.do" method="post" name="Form" id="Form">
		<div class="head_box">
			<div class="head_box_l">
				<p>
					<span class="right_b"></span>试卷管理
				</p>
			</div>
			<div class="head_box_r">
				<input class="date-picker" type="text" value="" placeholder="开始日期" name="lastStart" id="lastStart" data-date-format="yyyy-mm-dd" readonly="readonly" /> 
				<input type="text" class="date-picker"	value="" placeholder="结束日期" name="lastEnd" name="lastEnd" data-date-format="yyyy-mm-dd" readonly="readonly" />
				 <a href="#" onclick="tosearch();"><img
					src="../static/images/search.png" /></a>
			</div>
			<div class="clear"></div>
		</div>
		<div class="table_box">
			<table class="table table-striped">
				<thead>
					<tr>
						<th><input type="checkbox"  name='ids' />序号</th>
						<th>测验标题</th>
						<th>创建时间</th>
						<th>建议考试时长</th>
						<th>总分</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${not empty varList}">
						<c:forEach items="${varList}" var="var" varStatus="vs">
							<tr>
								<td><input type="checkbox" name='ids' id="ids" value="${var.PAPER_ID}"/>${vs.index+1}</td>
								<td ><a  target="_blank" href="<%=basePath%>paper/iteminfo.do?paper_id=${var.PAPER_ID}">${var.TITLE}</a></td>
								<td >${var.CREATE_DATE}</td>
								<td >${var.EXAM_TIME}</td>
								<td >${var.SCORE}</td>
								<td>
								<a href="#" onclick="del('${var.PAPER_ID}');"><img src="../static/images/remove.png" /></a>
								</td>
							</tr>
						
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr class="main_info">
							<td colspan="100" class="center" >没有相关数据</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
	
	
			<div class="footer">
				<div class="creat">
					<input type="button"  onclick="parent.$('.title_time').modal('show');" value="新建试卷" />
				</div>
				<div class="removeAll">
					<input type="button" onclick="deleteAll()" value="批量删除" />
				</div>
				<div class="page_box">
					
					<div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div>
				</div>
			</div>
		</div>
	</form>
</body>

<%@ include file="../../system/index/foot2.jsp"%>
<script src="../static/ace/js/date-time/bootstrap-datepicker.js"></script>
<script type="text/javascript">
		
		$(document).ready(function(){
			window.top.loading.remove();
		});
		
		function tosearch(){
			window.top.loading.remove();
			$("#Form").submit();
		}
		
		$('.table_box > .table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
				var th_checked = this.checked;//checkbox inside "TH" table header
				$(this).closest('table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
		});
		
		function del(Id){
			//var remove = new remove();
			window.top.remove.init({"title":"删除","func":function(success){
				if(success){
					var url = "<%=basePath%>paper/delete.do?PAPER_ID="+Id+"&tm="+new Date().getTime();
					window.top.loading.show();
					$.get(url,function(data){
						tosearch();
					});
				}
				else{
					console.log("false");
				}
			}});
			remove.show();
		}
		
		$(function() {
		
			//日期框
			$('.date-picker').datepicker({
				autoclose: true,
				todayHighlight: true
			});
		
		});
		
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