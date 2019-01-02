var url="";
	var question_box=[];
	function slide(obj){                      //查看解析
		obj.closest(".star_box").siblings(".resolve").slideToggle(function(){
			if($(".resolve").css("display") == "none")
				obj.text("View Analysis");
			else
				obj.text("Hide analysis");
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
	
	var gradleId =  getQueryString("gradleid");
	
	var _html="";
	var question_id_arry="";
	$(document).ready(function(){
		window.top.loading.remove();
			var data=JSON.parse(sessionStorage.getItem("data")); 
				console.log(data);
				$("#paper_title").html(data.title);
				$("#time").html(data.exam_time);
				if(data.questions.length>0){
					for(var i=0;i<data.questions.length;i++){
						question_id_arry+=data.questions[i].question_id+',';
					}
					getQuestionInfo(question_id_arry,data.questions);
				}
		
	})
	function getQuestionInfo(id,knowledge_ids){      //获取试题详情
		$.ajax({
			url:url+"/SunvoteEducation/api/v1/question",
			async:true,
			type:"post",
			data:{ID:id},
			success:function(data){
				console.log(data);
				if(data.data.length>0){				
					for(var i=0;i<data.data.length;i++){
						_html += '<li class="question_li" data-id="'+data.data[i].QUESTION_ID+'" data-knowledge="' +getknowledgeid(data.data[i].QUESTION_ID,knowledge_ids) + '"><div class="stem"></div><div class="option"><ul></ul><div class="clearfix"></div></div><div class="resolve"><div class="resolve_box"><p>【Answer】 '+data.data[i].ANSWER+'</p><p><span>【Analysis】</span>'+data.data[i].ANALYSIS+'</p></div><div class="clearfix"></div></div><div class="star_box"><div class="col-md-6 move"><img src="../static/images/up_ico.png" class="up"/><img src="../static/images/down_ico.png" class="down"/></div><div class="col-md-6"><div class="star"><span style="float:left;">Difficulty Level </span></div><div class="resolve_click"><a  onclick="slide($(this))">View Analysis</a></div></div><div class="clearfix"></div></div></li>';
					}
					console.log(_html);
					$(".analysis ul").html(_html);
					for(var j=0;j<data.data.length;j++){
						var option_html="";
						var sum=0;
						var right_num=0;
						var data1=[];
						var data2=[];
						var answer="";
						var color=[];
						$(".analysis li .stem").eq(j).append('<span class="li_index">'+(j+1)+'</span>、'+data.data[j].CONTENT);
						var arry_option=data.data[j].OPTION_CONTENT;

						for(var x=0;x<arry_option.length;x++){
							option_html += '<li><span>'+String.fromCharCode(64 + parseInt(x+1))+'.</span>'+arry_option[x]+'</li>';
						}
						$(".option").eq(j).html(option_html);
						star(j,parseInt(data.data[j].DIFFICULTY));
					}
				}
			},
			error: function (XMLHttpRequest, textStatus, errorThrown) {
				// 错误信息   
				alert("Status code:"+XMLHttpRequest.status+"Status:"+XMLHttpRequest.readyState+"Wrong massage:"+textStatus+"");
				window.top.loading.remove();
			}
		})
		
	}
	
	function getknowledgeid(question_id,knowledge_ids){
		for(var i = 0 ; i < knowledge_ids.length; i++){
			if(knowledge_ids[i].question_id == question_id){
				return knowledge_ids[i].knowledge_id;
			}
		}
		return '';
		
	}
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
	$(document).on('click', '.move img', function(event) {           //上移、下移
		  event.preventDefault();
		  var parent=$(this).closest("li");
		  var this_index=parent.children(".stem").find(".li_index").html();
		  var up_index=parent.prev().children(".stem").find(".li_index").html()
		  console.log(this_index);
		  console.log(up_index);
		  var parents=$(this).closest(".analysis").children("ul");
		  var len=parents.children().length;
		  if(($(this).is(".up") || $(this).is(".top")) && parent.index()==0){
		   alert("Stikied!！");
		   return false;
		  }else if(($(this).is(".down") || $(this).is(".bottom")) && parent.index()==len-1){
		   alert("Bottomed！");
		   return false;
		  }
		  switch (true) {
		   case $(this).is(".up"):
			var prev = parent.prev();
			var this_index=parent.children(".stem").find(".li_index").html();
			var up_index=prev.children(".stem").find(".li_index").html();
			prev.children(".stem").find(".li_index").html(this_index);
			parent.children(".stem").find(".li_index").html(up_index);
			parent.insertBefore(prev);
			break;
		   case $(this).is(".down"):
			var next = parent.next();
			var this_index=parent.children(".stem").find(".li_index").html();
			var up_index=next.children(".stem").find(".li_index").html();
			next.children(".stem").find(".li_index").html(this_index);
			parent.children(".stem").find(".li_index").html(up_index);
			parent.insertAfter(next);
			break;
		   case $(this).is(".top"):
			parents.prepend(parent);
			break;
		   case $(this).is(".bottom"):
			parents.append(parent);
			break;
		  }
	});
	 $(".save").click(function(){          //保存，提交试卷
		 	var question_arry=[];
			for(var i=0;i<$(".question_li").length;i++){
				question_arry[i]={
						score: "0",
						part_score: "0",
						question_id: $(".question_li").eq(i).attr("data-id"),
						knowledge_id: $(".question_li").eq(i).attr("data-knowledge"),
						rank: i.toString(),
						no_name: i.toString()
					};
				
			}
			var data={
				title: $("#paper_title").html(),
				exam_time: $("#time").html(),
				paper_type: "101",
				subject_id: subjectId,
				grade_id: gradleId,
				class_id: classId,
				user_id: userid,
				score: "100",
				questions: question_arry
			};

			$.ajax({
			url:url+"/SunvoteEducation/api/v1/publishpaper",
			async:false,
			type:"post",
			dataType: "json",
			headers: {'Content-Type': 'application/json'},
			data:JSON.stringify(data),
			success:function(data){
				alert("Success");
				window.history.go(-2);
			},
			error: function (XMLHttpRequest, textStatus, errorThrown) {
				// 错误信息   
				alert("Status code:"+XMLHttpRequest.status+"Status:"+XMLHttpRequest.readyState+"Wrong massage:"+textStatus+"");
				window.top.loading.remove();
			}
		})	
	 })