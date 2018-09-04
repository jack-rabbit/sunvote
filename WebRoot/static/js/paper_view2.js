var url="";
	var question_box=[];
	function slide(obj){                      //查看解析
		obj.closest(".star_box").siblings(".resolve").slideToggle(function(){
			if($(".resolve").css("display") == "none")
				obj.text("查看解析");
			else
				obj.text("收起解析");
		});
	}
			
function getQueryString(name) {
	  var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
	  var r = window.location.search.substr(1).match(reg);
	  if (r != null) return unescape(r[2]); return null;
  	}
	var PAPER_ID=getQueryString("PAPER_ID");
	var classId=getQueryString("classId");
	var userid=getQueryString("userid");
	
	var _html="";
	$(document).ready(function(){
		window.top.loading.remove();
		$.ajax({
			url:url+"/SunvoteEducation/api/v1/paperinfo",
			async:false,
			type:"post",
			data:{PAPER_ID:PAPER_ID},
			success:function(data){
				console.log(data);
				$("#paper_title").html(data.data.title);
				$("#time").html(data.data.exam_time);
				if(data.data.questions.length>0){				
					for(var i=0;i<data.data.questions.length;i++){
						_html += '<li class="question_li" data-id="'+data.data.questions[i].question_id+'"><div class="stem"></div><div class="option"><ul></ul><div class="clearfix"></div></div><div class="resolve"><div class="resolve_box"><p>【答案】 '+data.data.questions[i].answer+'</p><p><span>【解析】</span>'+data.data.questions[i].analysis+'</p></div><div class="clearfix"></div></div><div class="star_box"><div class="col-md-6"><div class="star"><span style="float:left;">难度</span></div><div class="resolve_click"><a  onclick="slide($(this))">查看解析</a></div></div><div class="clearfix"></div></div></li>';
					}
					console.log(_html);
					$(".analysis ul").html(_html);
					for(var j=0;j<data.data.questions.length;j++){
						var option_html="";
						var sum=0;
						var right_num=0;
						var answer="";
						$(".analysis li .stem").eq(j).append('<span class="li_index">'+(j+1)+'</span>、'+data.data.questions[j].content);
						var arry_option=data.data.questions[j].option_content;
						arry_option=arry_option.replace("[","");
						arry_option=arry_option.replace("]","");
						arry_option=arry_option.split(",");

						for(var x=0;x<arry_option.length;x++){
							option_html += '<li><span>'+String.fromCharCode(64 + parseInt(x+1))+'.</span>'+arry_option[x]+'</li>';
						}
						$(".option").eq(j).html(option_html);
						star(j,parseInt(data.data.questions[j].difficulty));
					}
				}
				window.top.loading.remove();
			},
			error: function (XMLHttpRequest, textStatus, errorThrown) {
				// 错误信息   
				alert("状态码："+XMLHttpRequest.status+"状态："+XMLHttpRequest.readyState+"错误信息："+textStatus+"");
				window.top.loading.remove();
			}
		})
	})
	function star(index,num){                //难度星级
			$(".star").eq(index).append('<ul></ul>');
			var li_html="";
			for(var i=1;i<=num;i++){
				li_html +='<li class="on"></li>';
			}
			for(var j=num;j<5;j++){
				li_html += '<li class="off"></li>';
			}
			
			$(".star").eq(index).find("ul").html(li_html);
		}
	