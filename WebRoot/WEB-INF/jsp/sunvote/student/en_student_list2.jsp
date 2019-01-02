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
<title>SunVote-Education Management System</title>

<!-- Bootstrap -->
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../static/css/teach.css" rel="stylesheet">

<!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
<!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<form action="../student/listcs.do" method="post" name="Form" id="Form">
		<input type="hidden" name="CLASS_ID" id="CLASS_ID" value="${pd.CLASS_ID}"/>
		<input type="hidden" name="TERM_ID" id="TERM_ID" value="${pd.TERM_ID}"/>
		<div class="head_box">
			<div class="box_header">
			<div class="head_box_l">
				<p>
					<span class="right_b"></span>Student Management
				</p>
				</div><div class="clearfix"></div>
				</div>
			<div style="padding:0 5%;background:#fff;">
			<table class="table table-striped">
				<col style="width: 10%" />
				<col style="width: 22%" />
				<col style="width: 22%" />
				<col style="width: 23%" />
				<col style="width: 23%" />
				<thead>
					<tr>
						<th><input type="checkbox" value="0" name='ids' id="ids"  />Serial No.</th>
						<th>Name</th>
						<th>Student ID</th>
						<th>Keypad ID</th>
						<th>Operation</th>
					</tr>
				</thead>
			</table></div>
			
			<div class="clearfix"></div>
		</div>
		<div class="table_box">
			<table class="table table-striped">
				<col style="width: 10%" />
				<col style="width: 22%" />
				<col style="width: 22%" />
				<col style="width: 23%" />
				<col style="width: 23%" />
				<tbody>
				<c:choose>
					<c:when test="${not empty varList}">
						<c:forEach items="${varList}" var="var" varStatus="vs">
							<tr>
								<td><input type="checkbox" name='ids' id="ids"  value="${var.ID}" />${vs.index+1}</td>
									<td class='center'>${var.NAME}</td>
											<td>${var.NUMBER}</td>
											<td>${var.KEYPAD_ID}</td>
											<td><a href="#" onclick="edit('${var.ID}');" style="margin-right:10px;"><img src="../static/images/eidtor.png" /></a><a href="#" onclick="del('${var.ID}');"><img src="../static/images/remove.png" /></a></td>
							</tr>
						
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr class="main_info">
							<td colspan="100" class="center" >No Data</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
	
	
			<div class="footer">
				<div class="creat">
					<input type="button" onclick="add();" value="Add Student" />
				</div>
				<div class="creat">
					<input type="button" onclick="upload();" value="Batch Import" />
				</div>
				<div class="removeAll" >
					<input type="button" onclick="deleteAll();" value="Batch Delete" />
				</div>
				<div class="page_box">
					<div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div>
				</div>
			</div>
		</div>
	</form>
</body>

<%@ include file="../../system/index/foot2.jsp"%>
<script type="text/javascript">
		$(document).ready(function(){
			window.top.loading.remove();
			$(".table_box").css("margin-top",$(".head_box").height() - 143);
		});
		function tosearch(){
			$("#Form").submit();
		}
		
		$('#ids').on('click', function(){
				var th_checked = $("#ids").prop('checked');//checkbox inside "TH" table header
				
				$(".table_box .table").find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
		});
		
		function del(Id){
			window.top.remove.init({"title":"Delete","ok":"Ok","cancel":"Cancel","func":function(success){
				if(success){
					var url = "<%=basePath%>student/delete.do?ID="+Id+"&tm="+new Date().getTime();
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
		
		function add(){
			window.top.modal.init({
			'title':'Add Student',
			'url':'<%=basePath%>student/goAdd2.do?class_id=${pd.CLASS_ID}&term_id=${pd.TERM_ID}',
			func:function() {
				tosearch();
			}
			});
			window.top.modal.show();
		}
		
		function edit(Id){
			window.top.modal.init({
			'title':'Add Student',
			'url':'<%=basePath%>student/goEdit2.do?ID='+Id,
			func:function() {
				tosearch();
			}
			});
			window.top.modal.show();
		}
		
		function deleteAll(){
			window.top.remove.init({"title":"Delete","ok":"OK","cancel":"Cancel","func":function(success){
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
								url: '<%=basePath%>student/deleteAll.do?tm='+new Date().getTime(),
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
		
		function upload(){
			 window.top.modal.init({
			'title':'Import excel student name list',
			'url':'<%=basePath%>student/goUploadExcel.do?class_id=${pd.CLASS_ID}&term_id=${pd.TERM_ID}',
			func:function() {
				tosearch();
			}
			});
			window.top.modal.show();
		}
		
</script>
</html>