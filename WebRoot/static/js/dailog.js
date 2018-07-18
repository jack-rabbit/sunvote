var modal={
	init:function(obj){
		this.init.title=obj.title;
		this.init.url=obj.url;
		this.init.func = obj.func;
		},
	show:function(){
		if(window.top!=window.self){
			$("body",top.document).append('<div class="mb"><div class="mb_box"><div class="mb_head"><p>'+window.top.init.title+'</p><div class="close"><img src="../static/images/close.png" /></div></div><div class="mb_content"><iframe src="'+window.top.modal.init.url+'"></iframe></div></div></div>');
		}else{
			if($(".loading").length==0)
			{
				$("body").append('<div class="mb"><div class="mb_box"><div class="mb_head"><p>'+window.top.modal.init.title+'</p><div class="close"><img src="../static/images/close.png" /></div></div><div class="mb_content"><iframe src="'+window.top.modal.init.url+'"></iframe></div></div></div>');
			}
		}
		
	},
	remove:function(){
		if(window.top!=window.self){
			$(".mb",top.document).remove();
		}else{
			if($(".mb").length>0)
			$(".mb").remove();
		}
		if(window.top.modal.init.func){
			window.top.modal.init.func();
		}
	}
}
$(document).on("click",".close",function(){
	window.top.modal.remove();
})

