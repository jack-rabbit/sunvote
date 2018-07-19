
var remove={
	init:function(obj){
		this.init.title=obj.title;
		this.init.func = obj.func;
		this.init.msg = obj.msg;
		},
	show:function(){
		if(window.top!=window.self){			
			$("body",top.document).append('<div class="mb remove"><div class="mb_box" ><div class="mb_head"><p>'+window.top.remove.init.title+'</p><div class="close"><img src="../static/images/close.png" /></div></div><div class="mb_content"><div class="mb_content_l"><a href="#" onclick="window.top.remove.init.func(true);window.top.remove.remove();">确认</a></div><div class="mb_content_r"><a href="#" onclick="window.top.remove.remove();window.top.remove.init.func(false);">取消</a></div></div></div></div>');
			console.log(typeof(window.top.remove.init.msg));
			if(typeof(window.top.remove.init.msg) != "undefined"){
				$(".mb_content_l").before('<div class="mb_msg"><p>'+window.top.remove.init.msg+'</p></div>');
			}
		}else{
			if($(".loading").length==0)
			{
				console.log(typeof(window.top.remove.init.msg));
				$("body").append('<div class="mb remove"><div class="mb_box" ><div class="mb_head"><p>'+window.top.remove.init.title+'</p><div class="close"><img src="../static/images/close.png" /></div></div><div class="mb_content"><div class="mb_content_l"><a href="#" onclick="window.top.remove.init.func(true);window.top.remove.remove();">确认</a></div><div class="mb_content_r"><a href="#" onclick="window.top.remove.remove();window.top.remove.init.func(false);">取消</a></div></div></div></div>');
				if(typeof(window.top.remove.init.msg) != "undefined"){
					$(".mb_content_l").before('<div class="mb_msg"><p>'+window.top.remove.init.msg+'</p></div>');
				}
			}
		}
	},
	remove:function(){
		if(window.top!=window.self){
			$(".remove",top.document).remove();
		}else{
			if($(".remove").length>0)
			$(".remove").remove();
		}
			
	}
}