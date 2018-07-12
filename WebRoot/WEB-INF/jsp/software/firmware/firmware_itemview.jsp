<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<title>${pd.PRODUCT_NAME}详细信息</title>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
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
					<div style="text-align:center;font:50px bolder;">${pd.PRODUCT_NAME}详细信息</div>
					</br></br></br>
					<div><center>
					<img style="width:15%" src="<%=basePath%>/uploadFiles/uploadFile/${pd.PRODUCT_IMAGE[0]}"/>
					<img style="width:15%" src="<%=basePath%>/uploadFiles/uploadFile/${pd.PRODUCT_IMAGE[1]}"/>
					<img style="width:15%" src="<%=basePath%>/uploadFiles/uploadFile/${pd.PRODUCT_IMAGE[2]}"/>
					<img style="width:15%" src="<%=basePath%>/uploadFiles/uploadFile/${pd.PRODUCT_IMAGE[3]}"/>
					<img style="width:15%" src="<%=basePath%>/uploadFiles/uploadFile/${pd.PRODUCT_IMAGE[4]}"/>
					<img style="width:15%" src="<%=basePath%>/uploadFiles/uploadFile/${pd.PRODUCT_IMAGE[5]}"/>
					</center></div>
					</br></br></br>
					<center>
					<table id="table_report"  >
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">货品编号:</td>
								<td style="width:75px;text-align: left;padding-top: 13px;">${pd.PRODUCT_NO}</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">应用行业:</td>
								<td style="width:75px;text-align: left;padding-top: 13px;">${pd.INDUSTRY}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">产品状态:</td>
								<td style="width:75px;text-align: left;padding-top: 13px;">${pd.PRODUCT_STATE}</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">产品规格:</td>
								<td style="width:75px;text-align: left;padding-top: 13px;">${pd.PRODUCT_SPEC}</td>
							</tr>
					</table>
					</center></br></br></br>
					<div style="margin-left:100px;margin-right:100px;">
						<div>产品功能:${pd.PRODUCT_FUNC}</div></br>
						<div>产品性能:${pd.PRODUCT_PERF}</div></br>
						<div>适配硬件:${pd.ADAPTABLE_HARDWARE}</div></br>
						<div>适配软件:${pd.ADAPTABLE_SOFTWARE}</div></br>
						<div>产品认证:${pd.PRODUCT_CERT}</div></br>
						<div>注意事项:${pd.REMARK}</div></br>
					</div>
						</div>
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


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#PRODUCT_NAME").val()==""){
				$("#PRODUCT_NAME").tips({
					side:3,
		            msg:'请输入产品名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PRODUCT_NAME").focus();
			return false;
			}
			if($("#PRODUCT_NO").val()==""){
				$("#PRODUCT_NO").tips({
					side:3,
		            msg:'请输入货品编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PRODUCT_NO").focus();
			return false;
			}
			if($("#INDUSTRY").val()==""){
				$("#INDUSTRY").tips({
					side:3,
		            msg:'请输入应用行业',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#INDUSTRY").focus();
			return false;
			}
			if($("#PRODUCT_STATE").val()==""){
				$("#PRODUCT_STATE").tips({
					side:3,
		            msg:'请输入产品状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PRODUCT_STATE").focus();
			return false;
			}
			if($("#PRODUCT_SPEC").val()==""){
				$("#PRODUCT_SPEC").tips({
					side:3,
		            msg:'请输入产品规格',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PRODUCT_SPEC").focus();
			return false;
			}
			if($("#PRODUCT_FUNC").val()==""){
				$("#PRODUCT_FUNC").tips({
					side:3,
		            msg:'请输入产品功能',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PRODUCT_FUNC").focus();
			return false;
			}
			if($("#PRODUCT_PERF").val()==""){
				$("#PRODUCT_PERF").tips({
					side:3,
		            msg:'请输入产品性能',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PRODUCT_PERF").focus();
			return false;
			}
			if($("#ADAPTABLE_HARDWARE").val()==""){
				$("#ADAPTABLE_HARDWARE").tips({
					side:3,
		            msg:'请输入适配硬件',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ADAPTABLE_HARDWARE").focus();
			return false;
			}
			if($("#ADAPTABLE_SOFTWARE").val()==""){
				$("#ADAPTABLE_SOFTWARE").tips({
					side:3,
		            msg:'请输入适配软件',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ADAPTABLE_SOFTWARE").focus();
			return false;
			}
			if($("#PRODUCT_CERT").val()==""){
				$("#PRODUCT_CERT").tips({
					side:3,
		            msg:'请输入产品认证',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PRODUCT_CERT").focus();
			return false;
			}
			if($("#REMARK").val()==""){
				$("#REMARK").tips({
					side:3,
		            msg:'请输入注意事项',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REMARK").focus();
			return false;
			}
			
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>