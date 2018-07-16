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
				<input type="text" value="" placeholder="开始日期" /> <input type="text"
					value="" placeholder="结束日期" /> <a href="#"><img
					src="../static/images/search.png" /></a>
			</div>
			<div class="clear"></div>
		</div>
		<div class="table_box">
			<table class="table table-striped">
				<thead>
					<tr>
						<th><input type="checkbox" value="0" name="choose"
							id="chooseAll" />序号</th>
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
								<td><input type="checkbox" value="1" name="choose" />${vs.index+1}</td>
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
					<input type="button" value="批量删除" />
				</div>
				<div class="page_box">
					
					<div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div>
					
					 <!-- <nav aria-label="Page navigation">
	
						<ul class="pagination">
							<li><span>共5条</span></li>
							<li><span class="enter"><input type="number" value="" /></span></li>
							<li><a href="#" class="jump_btn">跳转</a></li>
							<li><a href="#">首页</a></li>
							<li><a href="#" aria-label="Previous"> <span
									aria-hidden="true">上一页</span>
							</a></li>
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#" aria-label="Next"> <span
									aria-hidden="true">下一页</span>
							</a></li>
							<li><a href="#">尾页</a></li>
							<li><span class="enter"><select title="显示条数"
									style="width:55px;height:32px;float:left;border:0;color:#000;"
									onchange="changeCount(this.value)">
										<option value="10">10</option>
										<option value="20">20</option>
										<option value="30">30</option>
										<option value="40">40</option>
										<option value="50">50</option>
										<option value="60">60</option>
										<option value="70">70</option>
										<option value="80">80</option>
										<option value="90">90</option>
										<option value="99">99</option>
								</select></span></li>
						</ul>
					</nav>  -->
				</div>
			</div>
		</div>
	</form>
</body>

<%@ include file="../../system/index/foot.jsp"%>
<script type="text/javascript">

//删除
		function del(Id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>paper/delete.do?PAPER_ID="+Id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						tosearch();
					});
				}
			});
		}
		
		//修改
		function edit(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>paper/goEdit.do?PAPER_ID='+Id;
			 diag.Width = 450;
			 diag.Height = 355;
			 diag.Modal = true;				//有无遮罩窗口
			 diag. ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮 
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 tosearch();
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++){
					  if(document.getElementsByName('ids')[i].checked){
					  	if(str=='') str += document.getElementsByName('ids')[i].value;
					  	else str += ',' + document.getElementsByName('ids')[i].value;
					  }
					}
					if(str==''){
						bootbox.dialog({
							message: "<span class='bigger-110'>您没有选择任何内容!</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
						$("#zcheckbox").tips({
							side:1,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
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
				}
			});
		};
		
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
</script>
</html>