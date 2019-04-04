<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en" >
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->

<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<link href="static/css/teach.css" rel="stylesheet">
</head>
<body class="no-skin">
	<form action="homework/list.do" method="post" name="Form" id="Form">
		<input type="hidden" name="TEACHER_ID" id="TEACHER_ID" value="${pd.TEACHER_ID}"/>
		<div class="head_box">
		<div class="box_header">
			<div class="head_box_l">
				<p>
					<span class="right_b"></span>练习列表
				</p>
			</div>
			<div class="head_box_r">
				<select name="status" id="status" style="width:90px;height:26px;margin-right:5px;padding:0;border-color:#aaa;">
					<option value="0">全部</option>
					<option value="1">完成</option>
					<option value="2">未完成</option>
				</select>
				<input class="date-picker" type="text" placeholder="开始日期" name="StartDate" id="StartDate" data-date-format="yyyy-mm-dd" readonly="readonly" value="${pd.STARTDATE }"/> 
				<input type="text" class="date-picker" placeholder="结束日期" name="EndDate" name="EndDate" data-date-format="yyyy-mm-dd" readonly="readonly" value="${pd.ENDDATE}"/>
				 <a onclick="tosearch();"><img
					src="static/images/search.png" /></a>
			</div>
			<div class="clear"></div>
			</div>
			<div style="padding:0 5%;background:#fff;">
				<table class="table table-striped">
				<col style="width: 10%" />
				<col style="width: 20%" />
				<col style="width: 15%" />
				<col style="width: 15%" />
				<col style="width: 10%" />
				<col style="width: 10%" />
				<col style="width: 10%" />
				<col style="width: 10%" />
				<thead>
					<tr>
						<th><input type="checkbox"  name='ids' id="ids" />序号</th>
						<th>练习标题</th>
						<th>布置时间</th>
						<th>完成时间</th>
						<th>题目数</th>
						<th>完成情况</th>
						<th>总分</th>
						<th>操作</th>
					</tr>
				</thead>
			</table>
			</div>
		</div>
		<div class="table_box">
			<table class="table table-striped">
				<col style="width: 10%" />
				<col style="width: 20%" />
				<col style="width: 15%" />
				<col style="width: 15%" />
				<col style="width: 10%" />
				<col style="width: 10%" />
				<col style="width: 10%" />
				<col style="width: 10%" />
				<tbody>
				<c:choose>
					<c:when test="${not empty varList}">
						<c:forEach items="${varList}" var="var" varStatus="vs">
							<tr>
								<td><input type="checkbox" name='ids' id="ids" value="${var.HOMEWORK_ID}"/>${vs.index+1}</td>
								<td ><a  target="_blank" href="<%=basePath%>homework/goView.do?homework_id=${var.HOMEWORK_ID}">${var.NAME}</a></td>
								<td >${var.CREATE_DATE}</td>
								<td >${var.COMPLETE_DATE}</td>
								<td >${var.QUESTION_COUNT}</td>
								<td >${var.COMPLETE_COUNT == "0" ? "未完成":"已完成"}</td>
								<td >${var.ALL_SCORE}</td>
								<td>
								<c:if test="${var.COMPLETE_COUNT == '0'}">
									<a onclick="edit('${var.HOMEWORK_ID}');"><img src="static/images/eidtor.png" /></a>
								</c:if>
								<a onclick="del('${var.HOMEWORK_ID}');"><img src="static/images/remove.png" /></a>
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
					<input type="button"  onclick="add('${pd.TEACHER_ID}')" value="布置练习" />
				</div>
				<div class="removeAll">
					<input type="button" onclick="del()" value="批量删除" />
				</div>
				<div class="page_box">
					
					<div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div>
				</div>
			</div>
		</div>
	</form>

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		window.top.loading.remove();
		//日期框
		$('.date-picker').datepicker({
			autoclose: true,
			todayHighlight: true
		});
	});
	
	$('#ids').on('click', function(){
		var th_checked = $("#ids").prop('checked');//checkbox inside "TH" table header
		
		$(".table_box .table").find('tbody > tr').each(function(){
			var row = this;
			if(th_checked) $(row).find('input[type=checkbox]').eq(0).prop('checked', true);
			else $(row).find('input[type=checkbox]').eq(0).prop('checked', false);
		});
	});
	
	function tosearch(){
		$("#Form").submit();
	}
	function add(Id){
		var path = '<%=basePath%>homework/goAdd2.do?teacher_id='+Id;
		parent.$("#mainFrame").attr('src',path);
		window.top.loading.show();
	}
	function edit(Id){
		var path = '<%=basePath%>homework/goEdit2.do?school_id=${pd.SCHOOL_ID}&HOMEWORK_ID='+Id;
		parent.$("#mainFrame").attr('src',path);
		window.top.loading.show();
	}
	function del(Id){
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
							url: '<%=basePath%>homework/deleteAll.do?tm='+new Date().getTime(),
					    	data: {DATA_IDS:str},
							dataType:'json',
							//beforeSend: validateData,
							cache: false,
							success: function(data){
								tosearch();
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


</body>
</html>