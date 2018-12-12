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
<link href="static/login/style_login.css" rel="stylesheet">

<script src="static/js/jquery-1.7.2.js"></script>
<script src="static/login/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="static/js/jQuery.md5.js"></script>
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
<script type="text/javascript" src="static/js/lang.js"></script>
<script type="text/javascript" >
	if(lang() != 'en'){
		
	}
</script>
<style type="text/css">
.div_foot {
	height: 30px;
	line-height: 35px;
	position: fixed;
	bottom: 0;
	width: 100%;
	text-align: center;
	font-family: Arial;
	font-size: 14px;
	letter-spacing: 1px;
}
</style>

<!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
<!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div class="content">
		<div class="content_t">
			<img src="static/login/en_title.png" alt="SunVote" />
		</div>
		<div class="content_b">
			<div class="form_box">
				<form action="" method="post" name="loginbox" id="loginbox">
					<input type="text" name="loginname" id="loginname" value=""
						placeholder="Username" /> <input type="password" name="password"
						id="password" placeholder="Password" value="" /> <a href="#"
						onclick="severCheck();" class="login_btn">Login</a>
				</form>

			</div>
		</div>
		<div class="div_foot">
			&copy;Changsha SunVote Limited. All rights reserved. Record License No. <a target= "_blank" href="http://www.miitbeian.gov.cn/">湘ICP备09025927号-10</a>
		</div>
		<script type="text/javascript">
   
   		if(window.top != window.self){
	   		window.top.location.href = "<%=basePath%>";
   		}
   		//客户端校验
		function check() {

			if ($("#loginname").val() == "") {
				$("#loginname").tips({
					side : 2,
					msg : 'User name cannot be empty',
					bg : '#AE81FF',
					time : 3
				});
				showfh();
				$("#loginname").focus();
				return false;
			} else {
				$("#loginname").val(jQuery.trim($('#loginname').val()));
			}
			if ($("#password").val() == "") {
				$("#password").tips({
					side : 2,
					msg : 'Password cannot be empty',
					bg : '#AE81FF',
					time : 3
				});
				showfh();
				$("#password").focus();
				return false;
			}
			
			 $("#loginbox").tips({
				side : 1,
				msg : 'Logining, please wait...',
				bg : '#68B500',
				time : 10
			}); 

			return true;
		}
		
		//服务器校验
		function severCheck(){
			if(check()){
				var loginname = $("#loginname").val();
				var password = $("#password").val();
				var code = loginname+";;;"+password+";;;" + $("#code").val();
				$.ajax({
					type: "POST",
					url: 'login_login',
			    	data: {KEYDATA:code,tm:new Date().getTime()},
					dataType:'json',
					cache: false,
					success: function(data){
						if("success" == data.result){
							saveCookie();
							if(data.teacher != null){
								window.location.href="main/teacher";
							}else if(data.admin != null){
								window.location.href="main/admin";
							}else{
								window.location.href="main/index";
							}
						}else if("usererror" == data.result){
							$("#loginname").tips({
								side : 1,
								msg : "Incorrect user name or password",
								bg : '#FF5080',
								time : 15
							});
							showfh();
							$("#loginname").focus();
						}else if("codeerror" == data.result){
							$("#code").tips({
								side : 1,
								msg : "Incorrect captcha input",
								bg : '#FF5080',
								time : 15
							});
							showfh();
							$("#code").focus();
						}else{
							$("#loginname").tips({
								side : 1,
								msg : "Missing parameters",
								bg : '#FF5080',
								time : 15
							});
							showfh();
							$("#loginname").focus();
						}
					}
				});
			}
		}
		
		function saveCookie() {
			if ($("#saveid").attr("checked")) {
				$.cookie('loginname', $("#loginname").val(), {
					expires : 7
				});
				$.cookie('password', $("#password").val(), {
					expires : 7
				});
			}
		}
	</script>
		<script type="text/javascript"
			src="static/login/js/jquery-1.5.1.min.js"></script>
		<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
		<script
			src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="static/login/js/bootstrap.min.js"></script>
		<script src="static/js/jquery-1.7.2.js"></script>
		<script src="static/login/js/jquery.easing.1.3.js"></script>
		<script src="static/login/js/jquery.mobile.customized.min.js"></script>
		<script src="static/login/js/camera.min.js"></script>
		<script src="static/login/js/templatemo_script.js"></script>
		<script type="text/javascript" src="static/js/jQuery.md5.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript" src="static/js/jquery.cookie.js"></script>

		<!-- 软键盘控件start -->
		<script type="text/javascript"
			src="static/login/keypad/js/form/keypad.js"></script>
		<script type="text/javascript"
			src="static/login/keypad/js/framework.js"></script>
</body>
</html>