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
					
					<form action="firmware/${msg }.do" name="Form" id="Form" method="post"  enctype="multipart/form-data">
						<input type="hidden" name="FIRMWARE_ID" id="FIRMWARE_ID" value="${pd.FIRMWARE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">产品名称:</td>
								<td><input type="text" name="PRODUCT_NAME" id="PRODUCT_NAME" value="${pd.PRODUCT_NAME}" maxlength="255" placeholder="这里输入产品名称" title="产品名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">货品编号:</td>
								<td><input type="text" name="PRODUCT_NO" id="PRODUCT_NO" value="${pd.PRODUCT_NO}" maxlength="255" placeholder="这里输入货品编号" title="货品编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">应用行业:</td>
								<td>
								<select class="chosen-select form-control" name="INDUSTRY" id="INDUSTRY" data-placeholder="请选择" style="vertical-align:top;width:98%;">
									<option value="教育" <c:if test="${pd.INDUSTRY eq '教育'}">selected="true"</c:if>>教育</option>
									<option value="企业" <c:if test="${pd.INDUSTRY eq '企业'}">selected="true"</c:if>>企业</option>
									<option value="政府" <c:if test="${pd.INDUSTRY eq '政府'}">selected="true"</c:if>>政府</option>
									<option value="其他" <c:if test="${pd.INDUSTRY eq '其他'}">selected="true"</c:if>>其他</option>
								  	</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">产品状态:</td>
								<td>
								<select class="chosen-select form-control" name="PRODUCT_STATE" id="PRODUCT_STATE" data-placeholder="请选择" style="vertical-align:top;width:98%;">
									<option value="产品销售" <c:if test="${pd.PRODUCT_STATE eq '产品销售'}">selected="true"</c:if>>产品销售</option>
									<option value="产品发布" <c:if test="${pd.PRODUCT_STATE eq '产品发布'}">selected="true"</c:if>>产品发布</option>
									<option value="产品研制" <c:if test="${pd.PRODUCT_STATE eq '产品研制'}">selected="true"</c:if>>产品研制</option>
									<option value="其他" <c:if test="${pd.PRODUCT_STATE eq '其他'}">selected="true"</c:if>>其他</option>
							  	</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">产品规格:</td>
								<td><input type="text" name="PRODUCT_SPEC" id="PRODUCT_SPEC" value="${pd.PRODUCT_SPEC}" maxlength="255" placeholder="这里输入产品规格" title="产品规格" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">产品功能:</td>
								<td><textarea rows="3" cols="100" name="PRODUCT_FUNC" id="PRODUCT_FUNC" value="${pd.PRODUCT_FUNC}" maxlength="1000" placeholder="这里输入产品功能" title="产品功能" style="width:98%;">${pd.PRODUCT_FUNC}</textarea></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">产品性能:</td>
								<td><textarea rows="3" cols="100" name="PRODUCT_PERF" id="PRODUCT_PERF" value="${pd.PRODUCT_PERF}" maxlength="255" placeholder="这里输入产品性能" title="产品性能" style="width:98%;">${pd.PRODUCT_PERF}</textarea></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">适配硬件:</td>
								<td><textarea rows="3" cols="100" name="ADAPTABLE_HARDWARE" id="ADAPTABLE_HARDWARE" value="${pd.ADAPTABLE_HARDWARE}" maxlength="500" placeholder="这里输入适配硬件" title="适配硬件" style="width:98%;">${pd.ADAPTABLE_HARDWARE}</textarea></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">适配软件:</td>
								<td><textarea rows="3" cols="100" name="ADAPTABLE_SOFTWARE" id="ADAPTABLE_SOFTWARE" value="${pd.ADAPTABLE_SOFTWARE}" maxlength="255" placeholder="这里输入适配软件" title="适配软件" style="width:98%;">${pd.ADAPTABLE_SOFTWARE}</textarea></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">产品认证:</td>
								<td><textarea rows="3" cols="100" name="PRODUCT_CERT" id="PRODUCT_CERT" value="${pd.PRODUCT_CERT}" maxlength="255" placeholder="这里输入产品认证" title="产品认证" style="width:98%;">${pd.PRODUCT_CERT}</textarea></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">注意事项:</td>
								<td><textarea rows="3" cols="100" name="REMARK" id="REMARK" value="${pd.REMARK}" maxlength="255" placeholder="这里输入注意事项" title="注意事项" style="width:98%;">${pd.REMARK}</textarea>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">照片1:</td>
								<td>
								<input type="file" name="PRODUCT_IMAGE" id="PRODUCT_IMAGE" value="${pd.PRODUCT_IMAGE[0]}"/>${pd.PRODUCT_IMAGE[0]}
								<input type="hidden" name="PRODUCT_IMAGE0" id="PRODUCT_IMAGE0" value="${pd.PRODUCT_IMAGE[0]}"/>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">照片2:</td>
								<td>
								<input type="file" name="PRODUCT_IMAGE" id="PRODUCT_IMAGE"  value="${pd.PRODUCT_IMAGE[1]}"/>${pd.PRODUCT_IMAGE[1]}
								<input type="hidden" name="PRODUCT_IMAGE1" id="PRODUCT_IMAGE1" value="${pd.PRODUCT_IMAGE[1]}"/>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">照片3:</td>
								<td>
								<input type="file" name="PRODUCT_IMAGE" id="PRODUCT_IMAGE"  value="${pd.PRODUCT_IMAGE[2]}"/>${pd.PRODUCT_IMAGE[2]}
								<input type="hidden" name="PRODUCT_IMAGE2" id="PRODUCT_IMAGE2" value="${pd.PRODUCT_IMAGE[2]}"/>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">照片4:</td>
								<td>
								<input type="file" name="PRODUCT_IMAGE" id="PRODUCT_IMAGE"  value="${pd.PRODUCT_IMAGE[3]}"/>${pd.PRODUCT_IMAGE[3]}
								<input type="hidden" name="PRODUCT_IMAGE3" id="PRODUCT_IMAGE3" value="${pd.PRODUCT_IMAGE[3]}"/>
								</td>
								
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">照片5:</td>
								<td>
								<input type="file" name="PRODUCT_IMAGE" id="PRODUCT_IMAGE"  value="${pd.PRODUCT_IMAGE[4]}"/>${pd.PRODUCT_IMAGE[4]}
								<input type="hidden" name="PRODUCT_IMAGE4" id="PRODUCT_IMAGE4" value="${pd.PRODUCT_IMAGE[4]}"/>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">照片6:</td>
								<td>
								<input type="file" name="PRODUCT_IMAGE" id="PRODUCT_IMAGE"  value="${pd.PRODUCT_IMAGE[5]}"/>${pd.PRODUCT_IMAGE[5]}
								<input type="hidden" name="PRODUCT_IMAGE5" id="PRODUCT_IMAGE5" value="${pd.PRODUCT_IMAGE[5]}"/>
								</td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
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