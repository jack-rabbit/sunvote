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
<script src="../static/js/loading.js"></script>
<script src="../static/js/remove.js"></script>
<script src="../static/js/dailog.js"></script>

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
			<div class="head_box_l">
				<p>
					<span class="right_b"></span>学生管理
				</p>
			</div>
			
		</div>
		<div class="table_box">
			<table class="table table-striped">
				<thead>
					<tr>
						<th><input type="checkbox" value="0" name="choose"
							id="chooseAll" />序号</th>
						<th>姓名</th>
						<th>学号</th>
						<th>键盘ID</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${not empty varList}">
						<c:forEach items="${varList}" var="var" varStatus="vs">
							<tr>
								<td><input type="checkbox" value="1" name="choose" />${vs.index+1}</td>
									<td class='center'>${var.NAME}</td>
											<td>${var.SNO}</td>
											<td>${var.KEYPAD_ID}</td>
											<td><a href="#" onclick="del('${var.ID}');"><img src="../static/images/remove.png" /></a></td>
								
								
											
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
					<input type="button" onclick="add();" value="添加学生" />
				</div>
				<div class="removeAll" >
					<input type="button" onclick="deleteAll();" value="批量删除" />
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
		window.top.loading.remove();
		function tosearch(){
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
			window.top.remove.init({"title":"删除","func":function(success){
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
			remove.show();
		}
		
		function add(){
			window.top.modal.init({
			'title':'添加学生',
			'url':'<%=basePath%>student/goAdd2.do?class_id=${pd.CLASS_ID}&term_id=${pd.TERM_ID}',
			func:function() {
				tosearch();
			}
			});
			window.top.modal.show();
		}
		
		function deleteAll(){
		
		}
		
		
</script>
</html>