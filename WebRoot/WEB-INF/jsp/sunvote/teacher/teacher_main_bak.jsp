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
<head>
<base href="<%=basePath%>">

<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<style type="text/css">
.content_l{width:30%;min-width:300px;height:100%;background:#fff;float:left;}
.info_box{width:100%;height:300px;background:#36c345;color:#fff;position:relative;}
.info{display:table;width:70%;position:absolute;top:0;bottom:0;left:0;right:0;margin:auto;}
.info_l{width:120px;height:120px;float:left;border-radius:100px;overflow:hidden;position:relative;}
.info_l img{width:100%;position:absolute;top:0;min-height:100%;}
.info_r{margin-left:150px;}
.info_r p{width:100%;text-align:left;}
.info_r p:first-child{font-size:24px;}
.class{background:#36c333;color:#fff;margin-top:12px;}
.class p{margin:0;line-height:3em;box-sizing:border-box;padding-left:3em;font-size:20px;}
.test{background:#36b733;font-size:32px;text-align:center;color:#fff;padding:3% 0;letter-spacing:1em;margin-top:12px;}
.analysis{background:#36a733;font-size:32px;text-align:center;color:#fff;padding:3% 0;letter-spacing:1em;margin-top:12px;}
.commitopacity {
	position: absolute;
	width: 100%;
	height: 100px;
	background: #7f7f7f;
	filter: alpha(opacity = 50);
	-moz-opacity: 0.8;
	-khtml-opacity: 0.5;
	opacity: 0.5;
	top: 0px;
	z-index: 99999;
}

.jzts {
	position: fixed;
	left: 50%;
	top: 50%;
	width: 100%;
	height: 200px;
	margin: -45px 190px 0px 0px;
}
</style>

<!-- 即时通讯 -->
<link rel="stylesheet" type="text/css"
	href="plugins/websocketInstantMsg/ext4/resources/css/ext-all.css">
<link rel="stylesheet" type="text/css"
	href="plugins/websocketInstantMsg/css/websocket.css" />
<script type="text/javascript"
	src="plugins/websocketInstantMsg/ext4/ext-all-debug.js"></script>
<script type="text/javascript"
	src="plugins/websocketInstantMsg/websocket.js"></script>
<!-- 即时通讯 -->
<!-- 
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 <script type="text/javascript" src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
 -->




</head>
<body class="no-skin">
	<!-- #section:basics/navbar.layout -->

	<!-- 页面顶部¨ -->
	

	<div style="width:1360px;margin:0 auto;">
	<%@ include file="../../system/index/head.jsp"%>
	<div class="content_l">
	
		<div class="info_box">
			<div class="info">
				<div class="info_l">
					<img src="static/ace/avatars/user.jpg" />
				</div>
				<div class="info_r">
					<p>${pd.TEACHER[0].TEACHER_NAME }</p>
					<p>${pd.TEACHER[0].SCHOOL_NAME }</p>
				</div>
			</div>
		</div>
		<c:forEach items="${pd.TEACHER}" var="var" varStatus="vs">
			<div class="class">
				<p><a  href="javascript:chooseClass('${var.CLASS_ID}','${var.TERM_ID}');">${var.GRADE_NAME}${var.SUBJECT_NAME} <span>${var.CLASS_NAME}</span></a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a  href="javascript:report('${var.CLASS_ID}');">成绩</a></p>
			</div>
		</c:forEach>
		<div class="class" id="test"><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:;">试卷</a></p></div>
		<!-- <div class="analysis">分析</div> -->
	</div>
	<div style="width:70%;height:100%;margin-left:30%;" class="content_r">
		<iframe name="mainFrame" id="mainFrame" frameborder="0" src="paper/list2.do?" ></iframe>
	</div>
</div>



	<%@ include file="../../system/index/foot.jsp"%>

	<!-- page specific plugin scripts -->

	<!-- ace scripts -->
	<script src="static/ace/js/ace/elements.scroller.js"></script>
	<script src="static/ace/js/ace/elements.colorpicker.js"></script>
	<script src="static/ace/js/ace/elements.fileinput.js"></script>
	<script src="static/ace/js/ace/elements.typeahead.js"></script>
	<script src="static/ace/js/ace/elements.wysiwyg.js"></script>
	<script src="static/ace/js/ace/elements.spinner.js"></script>
	<script src="static/ace/js/ace/elements.treeview.js"></script>
	<script src="static/ace/js/ace/elements.wizard.js"></script>
	<script src="static/ace/js/ace/elements.aside.js"></script>
	<script src="static/ace/js/ace/ace.js"></script>
	<script src="static/ace/js/ace/ace.ajax-content.js"></script>
	<script src="static/ace/js/ace/ace.touch-drag.js"></script>
	<script src="static/ace/js/ace/ace.sidebar.js"></script>
	<script src="static/ace/js/ace/ace.sidebar-scroll-1.js"></script>
	<script src="static/ace/js/ace/ace.submenu-hover.js"></script>
	<script src="static/ace/js/ace/ace.widget-box.js"></script>
	<script src="static/ace/js/ace/ace.settings.js"></script>
	<script src="static/ace/js/ace/ace.settings-rtl.js"></script>
	<script src="static/ace/js/ace/ace.settings-skin.js"></script>
	<script src="static/ace/js/ace/ace.widget-on-reload.js"></script>
	<script src="static/ace/js/ace/ace.searchbox-autocomplete.js"></script>
	<!-- inline scripts related to this page -->

	<!-- the following scripts are used in demo only for onpage help and you don't need them -->
	<link rel="stylesheet" href="static/ace/css/ace.onpage-help.css" />

	<script type="text/javascript"> ace.vars['base'] = '..'; </script>
	<script src="static/ace/js/ace/elements.onpage-help.js"></script>
	<script src="static/ace/js/ace/ace.onpage-help.js"></script>

	<!--引入属于此页面的js -->
	<script type="text/javascript" src="static/js/myjs/head.js"></script>
	<!--引入属于此页面的js -->
	<script type="text/javascript" src="static/js/myjs/index.js"></script>

	<!--引入弹窗组件1start-->
	<!--<script type="text/javascript" src="plugins/attention/zDialog/zDrag.js"></script>-->
	<!--<script type="text/javascript" src="plugins/attention/zDialog/zDialog.js"></script>-->
	<!--引入弹窗组件1end-->

	<!--引入弹窗组件2start-->
	<script type="text/javascript" src="plugins/attention/drag/drag.js"></script>
	<script type="text/javascript" src="plugins/attention/drag/dialog.js"></script>
	<link type="text/css" rel="stylesheet"
		href="plugins/attention/drag/style.css" />
	<!--引入弹窗组件2end-->

	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script>
		$(".content_l").height($("#mainFrame").height());
	</script>
	<!-- 考试时间 -->
	<div class="modal fade title_time" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document" style="z-index:1400">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">新建试卷</h4>
	      </div>
	      <div class="modal-body">
	        <div class="form-group">
			    <label for="enter_title" class="col-sm-4 control-label">测验标题</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="enter_title" placeholder="输入测验标题">
			    </div>
			    <div class="clearfix"></div>
			</div>
	        <div class="form-group">
			    <label for="enter_time" class="col-sm-4 control-label">测验时长（分钟）</label>
			    <div class="col-sm-6">
			      <input type="number" class="form-control" id="enter_time" placeholder="输入测验时长">
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
	<script>
		$("#time_submit").click(function(){
			var name = $("#enter_title").val();
			var time = $("#enter_time").val();
			if(name != null&& name != '' && time != null && time != ''){
				self.location.href = "<%=basePath%>" + "paper/npaper.do?" + "name=" + name + "&time=" + time ;
				$(".title_time").modal("hide");
			}
			//window.open("<%=basePath%>" + "paper/npaper.do?" + "name=" + name + "&time=" + time);
		});
		$("#test").click(function(){
			$(".content_r").html('<iframe name="mainFrame" id="mainFrame" frameborder="0" src="paper/list2.do?" style="width:100%;height:'+$(".content_l").height()+'px;"></iframe>');
		})
		
		function chooseClass(classID,termID){
			var path = "student/listcs.do?class_id=" + classID + "&term_id=" + termID ;
			$(".content_r").html('<iframe name="mainFrame" id="mainFrame" frameborder="0" style="width:100%;height:'+$(".content_l").height()+'px;" src=' + path + '></iframe>');
		}
		
		function report(classId){
			window.open('<%=basePath%>report/report.do?classid=' + classId);
		}
		/* $(".analysis").click(function(){
			$(".content_r").html('<img src="static/images/analysis.png" width="100%" />');
		}) */
	</script>
	
</body>
</html>