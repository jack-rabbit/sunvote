$(".tab1").click(function(){
	var _this=$(this);
	_this.children("ul").slideToggle(function(){
		if(_this.children("ul").css("display")=="block")
			_this.find(".right").attr("class","down jiao");
		else
			_this.find(".down").attr("class","right jiao");
	});
})
$(".menu_1 li").click(function(event){
	event.stopPropagation();
	var _this=$(this);
	_this.children("ul").slideToggle(function(){
		if(_this.children("ul").css("display")=="block")
			_this.find(".right").attr("class","down jiao");
		else
			_this.find(".down").attr("class","right jiao");
	});
})
$("#chooseAll").click(function(){
	if(this.checked)
		$("input[name='choose']").prop("checked", true);
	else
		$("input[name='choose']").prop("checked", false);
})