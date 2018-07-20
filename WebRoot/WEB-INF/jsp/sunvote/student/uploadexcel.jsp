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


<style>

.ace-file-input .ace-file-container{
display: block;
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 40px;
    background-color: #ffffff;
    border: 1px solid #d5d5d5;
    cursor: pointer;
    -webkit-box-shadow: none;
    box-shadow: none;
    -webkit-transition: all 0.15s;
    -o-transition: all 0.15s;
    transition: all 0.15s;
}
.ace-file-input .ace-file-container:before{
    display: inline-block;
    content: attr(data-title);
    position: absolute;
    right: 0;
    top: 0;
    bottom: 0;
    line-height: 34px;
    text-align: center;
    padding: 0 8px;
    background-color: #3bc2d6;
    color: #FFF;
    font-size: 11px;
    font-weight: bold;
    border: 2px solid #FFF;
    border-left-width: 4px;
    -webkit-transition: all 0.3s;
    -o-transition: all 0.3s;
    transition: all 0.3s;
}
.ace-file-input .ace-file-container .ace-file-name {
    display: inline-block;
    height: 38px;
    max-width: 80%;
    white-space: nowrap;
    overflow: hidden;
    line-height: 38px;
    color: #888888;
    font-size: 13px;
    vertical-align: top;
    position: static;
    padding-left: 36px;
    }
    
    .ace-file-input .ace-file-container .ace-icon {
    display: inline-block;
    position: absolute;
    left: 0;
    top: 0;
    bottom: 0;
    line-height: 34px;
    width: 36px;
    text-align: center;
    font-family: FontAwesome;
    font-size: 13px;
    border: 2px solid #FFF;
    color: #FFF;
    -webkit-transition: all 0.1s;
    -o-transition: all 0.1s;
    transition: all 0.1s;
    background-color: #3bc2d6;
    }
    
    .ace-file-input .ace-file-container .ace-file-name:after {
    display: inline-block;
    content: attr(data-title);
}


</style>

</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<form action="student/readExcel.do?CLASS_ID=${pd.CLASS_ID}&TERM_ID=${pd.TERM_ID}" name="Form" id="Form" method="post" enctype="multipart/form-data">
								<div id="zhongxin">
									<input type="hidden" name="CLASS_ID" id="CLASS_ID" value="${pd.CLASS_ID}"/>
									<input type="hidden" name="TERM_ID" id="TERM_ID" value="${pd.TERM_ID}"/>
								<table style="width:95%;" >
									<tr>
										<td style="padding-top: 20px;"><input type="file" id="excel" name="excel" style="width:50px;" onchange="fileType(this)" /></td>
									</tr>
									<tr>
										<td style="text-align: center;padding-top: 10px;">
											<a class="btn btn-mini btn-primary" style="background-color:#3bc2d6 !important;border-color:#3bc2d6 !important;width:300px; height:50px;line-height:50px;font-size:18px;margin-top:5%;padding:0"  onclick="save();">导入</a>
										</td>
									</tr>
								</table>
								</div>
								<div id="zhongxin2" class="center" style="display:none"><br/><img src="static/images/jzx.gif" /><br/><h4 class="lighter block green"></h4></div>
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

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 上传控件 -->
	<script src="static/ace/js/ace/elements.fileinput.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(function() {
			//上传
			$('#excel').ace_file_input({
				no_file:'请选择EXCEL ...',
				btn_choose:'选择',
				btn_change:'更改',
				droppable:false,
				onchange:null,
				thumbnail:false, //| true | large
				whitelist:'xls|xls',
				blacklist:'gif|png|jpg|jpeg'
				//onchange:''
			});
		});
		
		//保存
		function save(){
			if($("#excel").val()=="" || document.getElementById("excel").files[0] =='请选择xls格式的文件'){
				
				$("#excel").tips({
					side:3,
		            msg:'请选择文件',
		            bg:'#AE81FF',
		            time:3
		        });
				return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		function fileType(obj){
			var fileType=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
		    if(fileType != '.xls'){
		    	$("#excel").tips({
					side:3,
		            msg:'请上传xls格式的文件',
		            bg:'#AE81FF',
		            time:3
		        });
		    	$("#excel").val('');
		    	document.getElementById("excel").files[0] = '请选择xls格式的文件';
		    }
		}
	</script>


</body>
</html>