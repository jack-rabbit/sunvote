<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<title>中天电子-教育管理系统</title>
<head>
<base href="<%=basePath%>">
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body class="no-skin">
	<!-- 检索  -->
	<form action="headmaster/listcs.do" method="post" name="Form" id="Form">
		<table style="margin-top:5px;">
		</table>
		<!-- 检索  -->

		<table id="simple-table"
			class="table table-striped table-bordered table-hover"
			style="margin-top:5px;">
			<thead>
				<tr>
					<th class="center" style="width:35px;"><label class="pos-rel"><input
							type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
					</th>
					<th class="center" style="width:50px;">序号</th>
					<th class="center">姓名</th>
					<th class="center">用户名</th>
					<th class="center">密码</th>
					<th class="center">所在学校</th>
					<th class="center">权限</th>
					<th class="center">联系电话</th>
					<th class="center">操作</th>
				</tr>
			</thead>

			<tbody>
				<!-- 开始循环 -->
				<c:choose>
					<c:when test="${not empty varList}">
						<c:forEach items="${varList}" var="var" varStatus="vs">
							<tr>
								<td class='center'><label class="pos-rel"><input
										type='checkbox' name='ids' value="${var.HEADMASTER_ID}"
										class="ace" /><span class="lbl"></span></label></td>
								<td class='center' style="width: 30px;">${vs.index+1}</td>
								<td class='center'>${var.NAME}</td>
								<td class='center'>${var.USERNAME}</td>
								<td class='center'>${var.PASSWORD}</td>
								<td class='center'>${var.SCHOOL_ID}</td>
								<td class='center'>${var.PERMISSION}</td>
								<td class='center'>${var.PHONE}</td>
								<td class="center"><span
									class="label label-large label-grey arrowed-in-right arrowed-in"><i
										class="ace-icon fa fa-lock" title="无权限"></i></span>
									<div class="hidden-sm hidden-xs btn-group">
										<a class="btn btn-xs btn-success" title="编辑"
											onclick="edit('${var.HEADMASTER_ID}');"> <i
											class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑"></i>
										</a> <a class="btn btn-xs btn-danger"
											onclick="del('${var.HEADMASTER_ID}');"> <i
											class="ace-icon fa fa-trash-o bigger-120" title="删除"></i>
										</a>
									</div>
									<div class="hidden-md hidden-lg">
										<div class="inline pos-rel">
											<button class="btn btn-minier btn-primary dropdown-toggle"
												data-toggle="dropdown" data-position="auto">
												<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
											</button>

											<ul
												class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
												<li><a style="cursor:pointer;"
													onclick="edit('${var.HEADMASTER_ID}');"
													class="tooltip-success" data-rel="tooltip" title="修改">
														<span class="green"> <i
															class="ace-icon fa fa-pencil-square-o bigger-120"></i>
													</span>
												</a></li>
												<li><a style="cursor:pointer;"
													onclick="del('${var.HEADMASTER_ID}');"
													class="tooltip-error" data-rel="tooltip" title="删除"> <span
														class="red"> <i
															class="ace-icon fa fa-trash-o bigger-120"></i>
													</span>
												</a></li>
											</ul>
										</div>
									</div></td>
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
		<div class="page-header position-relative">
			<table style="width:100%;">
				<tr>
					<td style="vertical-align:top;"><c:if test="${QX.add == 1 }">
							<a class="btn btn-mini btn-success" onclick="add();">新增</a>
						</c:if> <c:if test="${QX.del == 1 }">
							<a class="btn btn-mini btn-danger"
								onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除"><i
								class='ace-icon fa fa-trash-o bigger-120'></i></a>
						</c:if></td>
					<td style="vertical-align:top;"><div class="pagination"
							style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
				</tr>
			</table>
		</div>
	</form>
	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>

	<script type="text/javascript">
		window.top.loading.remove();
		//检索
		function tosearch(){
			$("#Form").submit();
		}
		$(function() {
		
			//日期框
			$('.date-picker').datepicker({
				autoclose: true,
				todayHighlight: true
			});
			
			//下拉框
			if(!ace.vars['touch']) {
				$('.chosen-select').chosen({allow_single_deselect:true}); 
				$(window)
				.off('resize.chosen')
				.on('resize.chosen', function() {
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				}).trigger('resize.chosen');
				$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
					if(event_name != 'sidebar_collapsed') return;
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				});
				$('#chosen-multiple-style .btn').on('click', function(e){
					var target = $(this).find('input[type=radio]');
					var which = parseInt(target.val());
					if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
					 else $('#form-field-select-4').removeClass('tag-input-style');
				});
			}
			
			
			//复选框全选控制
			var active_class = 'active';
			$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
				var th_checked = this.checked;//checkbox inside "TH" table header
				$(this).closest('table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
			});
		});
		
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>headmaster/goAdd.do';
			 diag.Width = 450;
			 diag.Height = 355;
			 diag.Modal = true;				//有无遮罩窗口
			 diag. ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 tosearch();
					 }else{
						 tosearch();
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function del(Id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>headmaster/delete.do?HEADMASTER_ID="+Id+"&tm="+new Date().getTime();
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
			 diag.URL = '<%=basePath%>headmaster/goEdit.do?HEADMASTER_ID='+Id;
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
								url: '<%=basePath%>headmaster/deleteAll.do?tm='+ new Date().getTime(),
														data : {
															DATA_IDS : str
														},
														dataType : 'json',
														//beforeSend: validateData,
														cache : false,
														success : function(data) {
															$
																	.each(
																			data.list,
																			function(
																					i,
																					list) {
																				tosearch();
																			});
														}
													});
										}
									}
								}
							});
		};

		//导出excel
		function toExcel() {
			window.location.href = '<%=basePath%>headmaster/excel.do';
		}
	</script>


</body>
</html>