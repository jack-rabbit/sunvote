var modal={
	init:function(obj){
		this.init.title=obj.title;
		this.init.url=obj.url;
		this.init.func = obj.func;
		this.init.width = obj.width;
		this.init.height = obj.height;
		},
	show:function(){
		if(window.top!=window.self){
			$("body",top.document).append('<div class="mb"><div class="mb_box"><div class="mb_head"><p>'+window.top.init.title+'</p><div class="close"><img src="../static/images/close.png" /></div></div><div class="mb_content"><iframe src="'+window.top.modal.init.url+'"></iframe></div></div></div>');
			if(window.top.init.width){
				var w=(window.top.init.width>window.document.body.clientWidth)?window.document.body.clientWidth:window.top.init.width;
				$(".mb_box",top.document).css("width",w);
			}
			if(window.top.init.height){
				var h=(window.top.init.height>window.document.body.clientHeight)?window.document.body.clientHeight:window.top.init.height;
				$(".mb_box",top.document).css("height",h);
			}
		}else{
			if($(".loading").length==0)
			{
				$("body").append('<div class="mb"><div class="mb_box"><div class="mb_head"><p>'+window.top.modal.init.title+'</p><div class="close"><img src="../static/images/close.png" /></div></div><div class="mb_content"><iframe src="'+window.top.modal.init.url+'"></iframe></div></div></div>');
				if(window.top.modal.init.width){
					var w=(window.top.modal.init.width>window.document.body.clientWidth)?window.document.body.clientWidth:window.top.modal.init.width;
					$(".mb_box").css("width",w);
				}
				if(window.top.modal.init.height){
					var h=(window.top.modal.init.height>window.document.body.clientHeight)?window.document.body.clientHeight:window.top.modal.init.height;
					$(".mb_box").css("height",h);
				}
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

