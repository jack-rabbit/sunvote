
var remove={
	init:function(obj){
		this.init.title=obj.title;
		this.init.func = obj.func;
		},
	show:function(){
		if(window.top!=window.self){
			$("body",top.document).append('<div class="mb remove"><div class="mb_box" ><div class="mb_head"><p>'+window.top.remove.init.title+'</p><div class="close"><img src="../static/images/close.png" /></div></div><div class="mb_content"><div class="mb_content_l"><a href="#" onclick="window.top.remove.init.func(true);window.top.remove.remove();">确认</a></div><div class="mb_content_r"><a href="#" onclick="window.top.remove.remove();window.top.remove.init.func(false);">取消</a></div></div></div></div>');
		}else{
			if($(".loading").length==0)
			{
				$("body").append('<div class="mb remove"><div class="mb_box" ><div class="mb_head"><p>'+window.top.remove.init.title+'</p><div class="close"><img src="../static/images/close.png" /></div></div><div class="mb_content"><div class="mb_content_l"><a href="#" onclick="window.top.remove.init.func(true);window.top.remove.remove();">确认</a></div><div class="mb_content_r"><a href="#" onclick="window.top.remove.remove();window.top.remove.init.func(false);">取消</a></div></div></div></div>');
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