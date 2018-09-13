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
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>首页</title>
    <link rel="stylesheet" href="http://lib.sinaapp.com/js/bootstrap/3.0.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/style.css" />
    <style>
    body{ background-color: #fff }
    .title{padding:15px;}
    .question{overflow: hidden;text-overflow: ellipsis;white-space: nowrap;width: 200px;}
	.erro_list table{display:inline;}
    </style>
    <!--[if IE]>
        <script src="http://libs.baidu.com/html5shiv/3.7/html5shiv.min.js"></script>
    <![endif]-->
    <script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
	<div class="container content">
    <p class="bg-primary title" style="margin-top:20px">考试</p>
    <table class="table table-hover">
      <thead>
      <col width="10%" />
	  <col width="20%" />
	  <col width="10%" />
	  <col width="10%" />
	  <col width="10%" />
	  <col width="10%" />
	  <col width="20%" />
	  <col width="10%" />
        <tr>
          <th>序号</th>
          <th>测验标题</th>
          <th>班级</th>
          <th>班级平均分</th>
          <th>测验总分</th>
          <th>得分率</th>
          <th>测验时间</th>
          <th>操作</th>
        </tr>
      </thead>  
      <tbody class="test_list">
        <!--测验列表-->
      </tbody>
    </table>
    <p class="bg-primary title">错题</p>
    <table class="table table-hover">
      <thead>
	  <col width="10%" />
	  <col width="20%" />
	  <col width="20%" />
	  <col width="20%" />
	  <col width="20%" />
	  <col width="10%" />
        <tr>
          <th>序号</th>
          <th>题目</th>
          <th>错误率</th>
          <th>测试名称</th>
          <th>测试时间</th>
          <th>操作</th>
        </tr>
      </thead>  
      <tbody class="erro_list">
        <!--错题列表-->
      </tbody>
    </table>
	</div>
    <script>
    $(document).ready(function(){
        var test_html="";
        var erro_html="";
        $.ajax({
            url:"/SunvoteEducation/api/v1/testpaper",
            async : false,
            type:"post",
            data:{user_id:"8dbef15bb6d043ec94b719ede583b033"},
            success:function(data){
                for(var i=0;i<5;i++){
                    if(data.data[i].avgScore=="")
                        var avgScore=0;
                    else
                        var avgScore=parseInt(data.data[i].avgScore);
                    if(data.data[i].totalScore==null||data.data[i].totalScore==0){
                        var totalScore=0;
                        var scoringRate=0;
                    }
                    else{
                        var totalScore=parseInt(data.data[i].totalScore);
                        var scoringRate=avgScore/totalScore;
                    }
                    test_html+='<tr><td>'+(i+1)+'</td><td>'+data.data[i].name+'</td><td>'+getClassName(data.data[i].classId)+'</td><td>'+avgScore+'</td><td>'+totalScore+'</td><td>'+scoringRate+'</td><td>'+data.data[i].createDate+'</td><td><a href="#">查看</a></td></tr>';
                }
                $(".test_list").html(test_html);
            }
        });
        $.ajax({
            url:"/SunvoteEducation/api/v1/wrongquestion",
            async : false,
            type:"post",
            data:{start_date:"",end_date:"",count:"5"},
            success:function(data){
                for(var i=0;i<5;i++){
                    erro_html+='<tr><td>'+(i+1)+'</td><td><div class="question">'+data.data[i].CONTENT+'</div></td><td>'+data.data[i].WRONG_NUM+'</td><td>'+data.data[i].NAME+'</td><td>'+data.data[i].CREATE_DATE+'</td><td><a href="#">查看</a></td></tr>';
                }
                $(".erro_list").html(erro_html);
                $(".erro_list img").remove();
				$(".erro_list table").remove();
            }
        })
    })
    function getClassName(id) { // 获取班级中文名
        var className = "";
        $.ajax({
            url : "/SunvoteEducation/api/v1/classname",
            async : false,
            type : "post",
            data : {
                id : id
            },
            success : function(data) {
                className = data.data;
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                    // 错误信息   
                    alert("状态码："+XMLHttpRequest.status+"状态："+XMLHttpRequest.readyState+"错误信息："+textStatus+"");
                    window.top.loading.remove();
                }
        })
        return className;
    }
        
    </script>
</body>
</html>