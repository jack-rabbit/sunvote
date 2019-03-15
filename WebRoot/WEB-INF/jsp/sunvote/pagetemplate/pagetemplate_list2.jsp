<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="myelfun" uri="/WEB-INF/tld/elfun.tld"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<link href="static/css/teach.css" rel="stylesheet">
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">

	<form action="pagetemplate/listcs.do" method="post" name="Form" id="Form">
	<input type="hidden" name="SCHOOL_ID" id="SCHOOL_ID" value="${pd.SCHOOL_ID}"/>
		<div class="head_box">
			<div class="box_header">
				<div class="head_box_l">
					<p>
						<span class="right_b"></span>模板管理
					</p>
				</div>
				<div class="head_box_r"></div>
				<div class="clear"></div>
			</div>
			
			<div style="padding:0 5%;background:#fff;">
				<table class="table table-striped">
					<col style="width: 10%" />
					<col style="width: 15%" />
					<col style="width: 12.5%" />
					<col style="width: 12.5%" />
					<col style="width: 12.5%" />
					<col style="width: 12.5%" />
					<thead>
						<tr>
							<th><input type="checkbox" name='ids' id="ids" />序号</th>
							<th class="center">模板名称</th>
							<th class="center">科目</th>
							<th class="center">年级</th>
							<th class="center">试卷总分</th>
							<th class="center">操作</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
		<div class="table_box" >
			<table class="table table-striped">
					<col style="width: 10%" />
					<col style="width: 15%" />
					<col style="width: 12.5%" />
					<col style="width: 12.5%" />
					<col style="width: 12.5%" />
					<col style="width: 12.5%" />

				<tbody>
					<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>
											<td><input type="checkbox" name='ids' id="ids" value="${var.ID}" />${vs.index+1}</td>											
											<td class='center'>${var.NAME}</td>							
											<td class='center'>${myelfun:findSubjectCName(var.SUBJECT_ID)}</td>
											<td class='center'>${myelfun:findGradeName(var.GRADE_ID)}</td>
											<td class='center'>${var.PAGE_SCORE}</td>
											<td><a onclick="edit('${var.ID}');" style="margin-right:10px;"><img src="static/images/eidtor.png" /></a><a onclick="del('${var.ID}');"><img src="static/images/remove.png" /></a></td>
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
			<div class="footer" style="width:auto">
				<div class="creat">
					<input type="button" onclick="$('.title_time').modal('show');" value="添加模板" />
				</div>
				<div class="removeAll">
					<input type="button" onclick="del()" value="批量删除" />
				</div>
				<div class="page_box">

					<div class="pagination"
						style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div>
				</div>
			</div>
		</div>
	</form>
	<div class="modal fade title_time" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document" style="z-index:1400">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">添加模板</h4>
	      </div>
	      <div class="modal-body">
	        <div class="form-group">
			    <label for="template_name" class="col-sm-4 control-label">模板名称</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="template_name" placeholder="输入模板名称"  maxlength="100" minlength="1">
			    </div>
			    <div class="clearfix"></div>
			</div>
			<div class="form-group">
			    <label for="subject_id" class="col-sm-4 control-label">科目</label>
			    <div class="col-sm-6">
			      <select class="chosen-select form-control" name="subject_id" id="subject_id" data-placeholder="请选择科目">			      		
						<c:forEach items="${subjectList}" var="var" varStatus="vs">			
							<option value="${var.ID}">${var.CNAME}</option>
						</c:forEach>
				  </select>
			    </div>
			    <div class="clearfix"></div>
			</div>	
			<div class="form-group">
			    <label for="grade_id" class="col-sm-4 control-label">年级</label>
			    <div class="col-sm-6">
			      <select class="chosen-select form-control" name="grade_id" id="grade_id" data-placeholder="请选择年级">
			      		<c:forEach items="${gradeList}" var="var" varStatus="vs">			
							<option value="${var.ID}">${var.NAME}</option>
						</c:forEach>
				  </select>
			    </div>
			    <div class="clearfix"></div>
			</div>			
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" id="time_submit">确定</button>
	        <button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

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
	});
	
	$('#ids').on('click', function(){
		var th_checked = $("#ids").prop('checked');//checkbox inside "TH" table header
		
		$(".table_box .table").find('tbody > tr').each(function(){
			var row = this;
			if(th_checked) $(row).find('input[type=checkbox]').eq(0).prop('checked', true);
			else $(row).find('input[type=checkbox]').eq(0).prop('checked', false);
		});
	});
		
	$("#time_submit").click(function(){
		var name = $("#template_name").val();
		var subject_id = $("#subject_id").val();
		var grade_id = $("#grade_id").val();
		
		if(name != null&& name != ''){
			self.location.href = "<%=basePath%>" + "pagetemplate/npaper.do?name=" + name + "&grade_id=" + grade_id +"&subject_id=" + subject_id  ;
			$(".title_time").modal("hide");
		}else{
			alert("请输入正确的模板名称");
		}
		
	});
			
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

		
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>pagetemplate/goAdd.do';
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
								url: '<%=basePath%>pagetemplate/deleteAll.do?tm='+new Date().getTime(),
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
		
		//修改
		function edit(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>pagetemplate/goEdit.do?PAGETEMPLATE_ID='+Id;
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
								url: '<%=basePath%>pagetemplate/deleteAll.do?tm='+new Date().getTime(),
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
		
		//导出excel
		function toExcel(){
			window.location.href='<%=basePath%>pagetemplate/excel.do';
		}
		

	</script>


</body>
</html>