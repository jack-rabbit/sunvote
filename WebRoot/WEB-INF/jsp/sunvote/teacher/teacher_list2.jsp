<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!-- jsp文件头和头部 -->

<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<link href="static/css/teach.css" rel="stylesheet">
</head>
<body class="no-skin">

	<form action="teacher/listcs.do" method="post" name="Form" id="Form">
		<div class="head_box">
			<div class="box_header">
				<div class="head_box_l">
					<p>
						<span class="right_b"></span>教师管理
					</p>
				</div>
				<div class="head_box_r"></div>
				<div class="clear"></div>
			</div>
			<div style="padding:0 5%;background:#fff;">
				<table class="table table-striped">
					<col style="width: 8%" />
					<col style="width: 10%" />
					<col style="width: 10%" />
					<col style="width: 10%" />
					<col style="width: 15%" />
					<col style="width: 15%" />
					<col style="width: 7%" />
					<col style="width: 15%" />
					<col style="width: 9%" />
					<thead>
						<tr>
							<th><input type="checkbox" value="0" name='ids' id="ids" />序号</th>
							<th class="center">姓名</th>
							<th class="center">电话</th>
							<th class="center">座机电话</th>
							<th class="center">证件号</th>
							<th class="center">账号</th>
							<th class="center">性别</th>
							<th class="center">教师卡编号</th>
							<th class="center">操作</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
		<div class="table_box">
					<table class="table table-striped">
						<col style="width: 8%" />
						<col style="width: 10%" />
						<col style="width: 10%" />
						<col style="width: 10%" />
						<col style="width: 15%" />
						<col style="width: 15%" />
						<col style="width: 7%" />
						<col style="width: 15%" />
						<col style="width: 9%" />
						<tbody>
							<!-- 开始循环 -->
							<c:choose>
								<c:when test="${not empty varList}">
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>
											<td><input type="checkbox" name='ids' id="ids" value="${var.ID}" />${vs.index+1}</td>
											<td class='center'>${var.NAME}</td>
											<td class='center'>${var.PHONE}</td>
											<td class='center'>${var.SEAT_PHONE}</td>
											<td class='center'>${var.CARD_NO}</td>
											<td class='center'>${var.ACCOUT}</td>
											<td class='center'>${var.SEX == 1? "男":"女"}</td>
											<td class='center'>${var.KEYPAD_ID}</td>
											<td><a onclick="edit('${var.ID}');" style="margin-right:10px;"><img src="static/images/eidtor.png" /></a><a onclick="del('${var.ID}');"><img src="static/images/remove.png" /></a></td>
								
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
					<div class="footer" style="width:auto">
				<div class="creat">
					<input type="button"  onclick="add();" value="添加老师" />
				</div>
				<div class="removeAll">
					<input type="button" onclick="deleteAll()" value="删除" />
				</div>
				<div class="page_box">
					<div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div>
				</div>
			</div>
		</div>
	</form>

	<div class="modal fade title_time" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document" style="z-index:1400">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">添加老师</h4>
	      </div>
	      <div class="modal-body">
	        <div class="form-group">
			    <label for="enter_title" class="col-sm-4 control-label">姓名</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="enter_title" placeholder="输入姓名"  maxlength="100" minlength="1">
			    </div>
			    <div class="clearfix"></div>
			</div>
	       
	        <div class="form-group">
			    <label for="enter_time" class="col-sm-4 control-label">电话</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="enter_time" placeholder="输入电话" maxlength="11" oninput="value=value.replace(/[^\d]/g,'')" >
			    </div>
			    <div class="clearfix"></div>
			</div>
			<div class="form-group">
			    <label for="enter_time" class="col-sm-4 control-label">座机电话</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="enter_time" placeholder="输入座机电话" maxlength="20" oninput="value=value.replace(/[^\d]/g,'')">
			    </div>
			    <div class="clearfix"></div>
			</div>
			<div class="form-group">
			    <label for="enter_time" class="col-sm-4 control-label">证件号</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="enter_time" placeholder="输入证件号" />
			    </div>
			    <div class="clearfix"></div>
			</div>
			<div class="form-group">
			    <label for="enter_time" class="col-sm-4 control-label">帐号</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="enter_time" placeholder="输入帐号" />
			    </div>
			    <div class="clearfix"></div>
			</div>
			<div class="form-group">
			    <label for="enter_time" class="col-sm-4 control-label">性别</label>
			    <div class="col-sm-6">
			      <select class="chosen-select form-control" name="TEMPLATE_ID" id="TEMPLATE_ID" data-placeholder="请选择您的性别">
			      		<option value="1">男</option>
						<option value="2">女</option>
				  </select>
			    </div>
			    <div class="clearfix"></div>
			</div>
			<div class="form-group">
			    <label for="enter_time" class="col-sm-4 control-label">教师卡编号</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="enter_time" placeholder="输入教师卡编号" />
			    </div>
			    <div class="clearfix"></div>
			</div>
			
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" id="time_submit" onclick="save()">确定</button>
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
		
		function edit(Id){
			window.top.modal.init({
			'title':'修改信息',
			'url':'<%=basePath%>teacher/goEdit2.do?school_id=${pd.SCHOOL_ID}&ID='+Id,
			func:function() {
				tosearch();
			}
			});
			window.top.modal.show();
		}
		
		function add(){
			window.top.modal.init({
			'title':'添加教师',
			'url':'<%=basePath%>teacher/goAdd2.do?school_id=${pd.SCHOOL_ID}',
			func:function() {
				tosearch();
			}
			});
			window.top.modal.show();
		}
		
		function save(){
			
		}
	</script>


</body>
</html>