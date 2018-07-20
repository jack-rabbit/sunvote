/***********************
*名称：加载等待插件
*日期：2018年7月17日
*用法：此插件依托于jquery插件，所以在使用时，需要在jquery后引入，且此插件需要置入body内。
*      展示loading为loading.show(url),url为loading.gif图片路径。移除loading为loading.remove();
*      可放入$(document).ready()内；
***********************/


var loading={
	show:function(url){
		if(typeof(url) == "undefined"){
			url = '../static/images/loading.gif' ;
		}
		if(window.top!=window.self){
			$("body",top.document).append('<div class="loading" style="background:rgba(0,0,0,0.5);width:100%;height:100%;position:fixed;top:0;display:block;"><img src="'+url+'" width="200px" style="position:absolute;top:0;bottom:0;left:0;right:0;margin:auto;"/></div>');
		}else{
			if($(".loading").length==0)
			{
				//alert($("body").length);
				$("body").append('<div class="loading" style="background:rgba(0,0,0,0.5);width:100%;height:100%;position:fixed;top:0;display:block;"><img src="'+url+'" width="200px" style="position:absolute;top:0;bottom:0;left:0;right:0;margin:auto;"/></div>');
			}
		}
	},
	remove:function(){
		if(window.top!=window.self){
			$(".loading",top.document).remove();
		}else{
			if($(".loading").length>0)
			$(".loading").remove();
		}
			
	}
}