<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html xmlns="http://www.w3.org/1999/xhtml">  
<head>  
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
<title>班级-测试名单</title> 
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/twitter-bootstrap/4.0.0-alpha.2/js/bootstrap.min.js"></script>
<link href="http://cdn.staticfile.org/twitter-bootstrap/4.0.0-alpha.2/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />   
<link href="../static/css/jquery.circliful.css" rel="stylesheet" type="text/css" />
<link href="../static/css/style1.css" rel="stylesheet" type="text/css" />
<script src="../static/laydate/laydate.js"></script> <!-- 改成你的路径 -->
<script src="../static/js/jquery.circliful.min.js"></script>
<script src="../static/js/echars.js"></script>
<script>
    lay('#version').html('-v'+ laydate.v);
	//日期范围
    laydate.render({
      elem: '#test6'
      ,range: true
    });
</script>
<style>
	body { padding-top: 70px; }
	li{list-style:none;}
</style>
 </head>  
 <body>  
	<div class="header">
		<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
		<input type="text" class="demo-input" placeholder="开始日期" name="starDate" id="test6">
		<input type="text" class="demo-input" placeholder="结束日期" name="endDate" id="test6">
		<input type="button" value="查询" id="search"/>
		 </div>
</nav>
	</div>
	<div class="content row">
		<div class="content_l col-md-2">
			<ul>
				
			</ul>
		</div>
		<div class="content_r col-md-10">
			<div class="tabel_t">
				<div class="name"><h1></h1></div>
				<div class="circle row">
					<div class="col-md-6">
						<!-- <div id="myStathalf" data-dimension="350" data-text="9/19" data-info="参与测试" data-width="10" data-fontsize="38" data-percent="35" data-fgcolor="#8ad254" data-bgcolor="#a9f9ff" data-type="half" data-fill="#50b5c9"></div> -->
						
					</div>
					<div class="col-md-6">
						<!-- <div id="myStathalf1" data-dimension="350" data-text="36%" data-info="个人平均得分率" data-width="10" data-fontsize="38" data-percent="35" data-fgcolor="#8ad254" data-bgcolor="#a9f9ff" data-type="half" data-fill="#50b5c9"></div> -->
						
					</div>
				</div>
				<div class="info row">
					<div class="col-md-6">
						<p>班级平均得分率<span id="class_avg">0.0</span>%</p>
					</div>
					<div class="col-md-6">
						<p>班级最高得分率<span id="class_max">0.0</span>%</p>
					</div>
				</div>
				<div class="prev"></div>
				<div class="next"></div>
			</div>
			<div class="tabel_b">
				<div class="tab_top row">
					<div class="col-md-3">正确率走势对比图</div>
					<div class="col-md-9">
						<div class="color">
							<ul>
								<li><span class="green"></span>班级平均</li>
								<li><span class="blue"></span>学生个人</li>
								<li><span class="yellow"></span>班级最好成绩</li>
								<div class="clear"></div>
							</ul>
						</div>
						<div class="check_box">
							<input type="radio"  checked value="1" name="check" id="check1" />
							<label for="check1">按得分率</label>
							<input type="radio"  value="2" name="check" id="check2" />
							<label for="check2">按分数</label>
						</div>
					</div>
				</div>
				<div class="tabel_content">
					<div id="main" style="width: 100%;height:400px;"></div>
				</div>
			</div>
		</div>
	</div>
	<script type="">
		var URL = '<%=basePath%>${URL}';
	</script>
	<script src="../static/js/control1.js"></script>
 </body>  
</html>  