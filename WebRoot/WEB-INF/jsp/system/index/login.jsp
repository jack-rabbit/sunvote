﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<title>中天电子-教育管理系统</title>

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
	if(lang() != 'zh'){
		
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
			<img src="static/login/title.png" alt="SunVote" />
		</div>
		<div class="content_b">
			<div class="form_box">
				<form action="" method="post" name="loginbox" id="loginbox" >
					<div class="name_box">
						<input type="text" name="loginname" id="loginname" value="" placeholder="用户名"  autoComplete="off"/>
						<svg t="1554790328236" class="icon_down" style="" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2161" xmlns:xlink="http://www.w3.org/1999/xlink" width="32" height="32"><defs><style type="text/css"></style></defs><path d="M863.321996 251.674996 194.108395 251.674996 528.677333 621.186771Z" p-id="2162" fill="#333333"></path></svg>
					</div>
					<div class="psw_box">
						<input type="password" name="password" id="password" placeholder="密   码" value="" autoComplete="off"/>
						<div class="rember">
							<input type="checkbox" id="rem_flag"/>
							<span>记住密码</span>
						</div>
					</div>
					<a href="#" onclick="severCheck();" class="login_btn">登录</a>
					
					<div class="history">
						<ul>

						</ul>
					</div>
				</form>

			</div>
		</div>
		<div class="div_foot">
			&copy;长沙中天电子设计开发有限公司版权所有. 备案许可证号： <a target= "_blank" href="http://www.miitbeian.gov.cn/">湘ICP备09025927号-10</a>
		</div>
		<script type="text/javascript">
   
   		if(window.top != window.self){
	   		window.top.location.href = "<%=basePath%>";
   		}
   		
   		document.onkeydown = function (e) { // 回车提交表单
   		// 兼容FF和IE和Opera
   		    var theEvent = window.event || e;
   		    var code = theEvent.keyCode || theEvent.which || theEvent.charCode;
   		    if (code == 13) {
   		    	severCheck();
   		    }
   		}
   		
   		$(".icon_down").click(function(){
   			$("#loginname").focus();
   			
   		});
   		$("#loginname").focus(function(){
   			var _html="";
   			var u_list=JSON.parse(storage.getItem('userNameList'));
   			for(var i=0;i<u_list.length;i++){
   				_html+='<li>'+u_list[i]+'</li>';
   			}
   			$(".history ul").html(_html);
   			$(".history").toggle();
   		});
   		
   		
   		$(document).on('hover','.history li',function(){
   			var p_list=JSON.parse(storage.getItem('passWordList'));
   			$("#loginname").val($(this).text());
   			$("#password").val(p_list[$(this).index()]);
   			//$(".history").hide();
   		})
   		$("#loginname").blur(function(){
   			$(".history").hide();
   		})

   		
   		//客户端校验
		function check() {

			if ($("#loginname").val() == "") {
				$("#loginname").tips({
					side : 2,
					msg : '用户名不得为空',
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
					msg : '密码不得为空',
					bg : '#AE81FF',
					time : 3
				});
				showfh();
				$("#password").focus();
				return false;
			}
			
			 $("#loginbox").tips({
				side : 1,
				msg : '正在登录 , 请稍后 ...',
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
							if($("#rem_flag").prop("checked"))   //如果选择了记住密码
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
								msg : "用户名或密码有误",
								bg : '#FF5080',
								time : 15
							});
							showfh();
							$("#loginname").focus();
						}else if("codeerror" == data.result){
							$("#code").tips({
								side : 1,
								msg : "验证码输入有误",
								bg : '#FF5080',
								time : 15
							});
							showfh();
							$("#code").focus();
						}else{
							$("#loginname").tips({
								side : 1,
								msg : "缺少参数",
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
		
		var storage=window.localStorage;
		var userNameList=[];
		var passWordList=[];
		
		//console.log(JSON.parse(storage.getItem('userNameList')));
		
		function saveCookie() {
			if(!window.localStorage){
	            alert("浏览器不支持localstorage");
	            
	        }else{
	            //主逻辑业务
	        	
	            userNameList=JSON.parse(storage.getItem('userNameList'));
	            passWordList=JSON.parse(storage.getItem('passWordList'));
	            
	           
	            if(userNameList==null){
	            	var userNameList=[];
	        		var passWordList=[];
	            	userNameList.push($("#loginname").val());
	            	passWordList.push($("#password").val());
	            	
	            	storage.setItem('userNameList',JSON.stringify(userNameList));
	            	storage.setItem('passWordList',JSON.stringify(passWordList));
	            }else{
	            	
	            	if(userNameList.indexOf($("#loginname").val())>-1){
		            	return false;
		            }else{	            	
		            	userNameList.push($("#loginname").val());
		            	passWordList.push($("#password").val());
		            	storage.setItem('userNameList',JSON.stringify(userNameList));
		            	storage.setItem('passWordList',JSON.stringify(passWordList));
		            }
	            }
	            
	           
	            
	            //console.log(userNameList);
	            
	            
	            
	        }
			
				/*$.cookie('loginname', $("#loginname").val(), {
					expires : 7
				});
				$.cookie('password', $("#password").val(), {
					expires : 7
				});*/
			
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