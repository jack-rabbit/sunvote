$(".tab1").click(function(){
	var _this=$(this);
	_this.find("ul").slideToggle(function(){
		if(_this.find("ul").css("display")=="block")
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