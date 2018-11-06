var url="";
	var temp_tag;
	var temp_data;
	var TEXTBOOK_ID="";
	var question_box=[];
	var question_num=0;
	var pageNum=1;
	var end=0;
	var flag=0;
	var paper_title = "" ;
	var paper_time = "0" ;
	
	
	$(document).ready(function(){
		getPoint();			
	});
	
	function getQueryString(name) {
	  var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
	  var r = window.location.search.substr(1).match(reg);
	  if (r != null) return unescape(r[2]); return null;
  	}
	
	var subject_id=getQueryString("subject_id");
	var class_id=getQueryString("class_id");
	var user_id=getQueryString("user_id");
	
	
	function getPoint(){             //获取知识点
		$.ajax({
			url:url+"/SunvoteEducation/api/v1/point",
			async:false,
			type:"post",
			data:{depth:"",subject_id:subject_id,p_id:"",knowledge_from:101},
			success:function(data){
				var point_html="";
				for(var i=0;i<data.data.length;i++){
					point_html +='<li data-id="'+data.data[i].KNOWLEDGE_ID+'" data-img-click=0 data-span-click=0><img src="../static/images/add.png" class="add" /><span>'+(i+1)+data.data[i].NAME+'</span></li>';
				}
				if(data.data.length > 0){
					paper_title = data.data[0].NAME;
				}
				$(".section").children("ul").html(point_html);
				getQuestion($(".section li").eq(0));
			},
			error: function (XMLHttpRequest, textStatus, errorThrown) {
				// 错误信息   
				alert("状态码："+XMLHttpRequest.status+"状态："+XMLHttpRequest.readyState+"错误信息："+textStatus+"");
				window.top.loading.remove();
			}
		})
	}
	function getChapter(TEXTBOOK_ID){   	//获取章节
		$(".section").children("ul").html("");
		$.ajax({
			url:url+"/SunvoteEducation/api/v1/chapter",
			async:false,
			type:"post",
			data:{TEXTBOOK_ID:TEXTBOOK_ID},
			success:function(data){
				for(var i=0;i<data.data.length;i++){
					$(".section").children("ul").append('<li data-id="'+data.data[i].ID+'" data-img-click=0 data-span-click=0><img src="../static/images/add.png" class="add"/><span>'+data.data[i].NAME+'</span></li>');	
					if(data.data[i].CHILDREN.length>0){
						$(".section").children("ul").children("li").eq(i).append("<ul></ul>");
						for(var j=0;j<data.data[i].CHILDREN.length;j++){
							$(".section").children("ul").children("li").eq(i).children("ul").append('<li data-id="'+data.data[i].CHILDREN[j].ID+'" onclick="getQuestion($(this))"><span>●</span><span>'+data.data[i].CHILDREN[j].NAME+'</span></li>');
						}
					}
				}
				getQuestion($(".section li").eq(0));
			},
			error: function (XMLHttpRequest, textStatus, errorThrown) {
				// 错误信息   
				alert("状态码："+XMLHttpRequest.status+"状态："+XMLHttpRequest.readyState+"错误信息："+textStatus+"");
				window.top.loading.remove();
			}
		})
	}
	function getMenu(id,obj){        //获取知识点下级内容
		var _html="";
		$.ajax({
			url:url+"/SunvoteEducation/api/v1/point",
			async:false,			
			type:"post",
			data:{depth:"",subject_id:subject_id,p_id:id,knowledge_from:101},
			success:function(data){
				obj.append('<ul></ul>');
				for(var i=0;i<data.data.length;i++){
				console.log(typeof(data.data[i].CHILDREN));
				if(data.data[i].CHILDREN===undefined)
					_html +='<li data-id="'+data.data[i].KNOWLEDGE_ID+'" data-span-click=0 "><span>●</span><span>'+(i+1)+data.data[i].NAME+'</span></li>';
				else
					_html +='<li data-id="'+data.data[i].KNOWLEDGE_ID+'" data-img-click=0 data-span-click=0 ><img src="../static/images/add.png" class="add"/><span>'+(i+1)+data.data[i].NAME+'</span></li>';
				}
				obj.children('ul').html(_html);
			},
			error: function (XMLHttpRequest, textStatus, errorThrown) {
				// 错误信息   
				alert("状态码："+XMLHttpRequest.status+"状态："+XMLHttpRequest.readyState+"错误信息："+textStatus+"");
				window.top.loading.remove();
			}
		})
	}
	function slide(obj){                      //查看解析
		obj.closest(".star_box").siblings(".resolve").slideToggle(function(){
			if($(".resolve").css("display") == "none")
				obj.text("查看解析");
			else
				obj.text("收起解析");
		});

		}
	function getQuestion(obj){                //获取题目
		
		var knowledge_id="",chapter_id="";
		if($(".tab .active").attr("data-index")==1){
			knowledge_id=obj.attr("data-id");
		}else{
			chapter_id=obj.attr("data-id");
		}
		
		var _html="";
		
		$.ajax({
			url:url+"/SunvoteEducation/api/v1/questions",
			async:true,
			type:"post",
			data:{chapter_id:chapter_id,teachingmaterial_id:"",knowledge_id:knowledge_id,question_from:101,user_id:"",problem_type:"",subject_id:subject_id,count:"5",pageNum:pageNum},
			success:function(data){
			window.top.loading.remove();
			console.log(data);
			if(data.data.length>0){
				for(var i=0;i<data.data.length;i++){
					
					_html += '<li data-id="'+data.data[i].QUESTION_ID+'" data-knowledge="' + knowledge_id + '"><div class="content"></div><div class="option"><ul></ul></div><div class="resolve"><div class="resolve_box"><p><span>【答案】</span> '+data.data[i].ANSWER+'</p><p><span>【解析】</span>'+data.data[i].ANALYSIS+'</p></div></div><div class="star_box"><div class="col-md-6"><div class="star"><span style="float:left;">难度</span></div><div class="resolve_click"><a  onclick="slide($(this))">查看解析</a><div class="check_box"></div></div></div><div class="clearfix"></div></div></li>';
				}
				$(".question_box").children("ul").append(_html);
				console.log(5*(pageNum-1));
				for(var j=5*(pageNum-1);j<(data.data.length+5*(pageNum-1));j++){
					var option_html="";
					data.data[j-5*(pageNum-1)].CONTENT = data.data[j-5*(pageNum-1)].CONTENT.replace('<fill></fill>','______');
					$(".question_box li .content").eq(j).append('<span>'+(j+1)+'、</span>'+data.data[j-5*(pageNum-1)].CONTENT);
					var arry_option=data.data[j-5*(pageNum-1)].OPTION_CONTENT;
					if(question_box.indexOf(data.data[j-5*(pageNum-1)].QUESTION_ID)>=0){
						$(".check_box").eq(j).addClass("checked");
					}
					for(var x=0;x<arry_option.length;x++){
						option_html += '<li><span>'+String.fromCharCode(64 + parseInt(x+1))+'.</span>'+arry_option[x]+'</li>';
					}
					$(".option").eq(j).find("ul").html(option_html);
					
					star(j,parseInt(data.data[j-5*(pageNum-1)].DIFFICULTY));
					
				}
				$(".view_more").css("display","block");
				end=0;
			}else{
				$(".view_more").css("display","none");
			//	$(".question_box").children("ul").html("");
				pageNum-=1;
				if(pageNum<1)
					pageNum=1;
				end=1;
			}
			flag=0;
			},
			error: function (XMLHttpRequest, textStatus, errorThrown) {
				 // 状态码
				console.log(XMLHttpRequest.status);
				// 状态
				console.log(XMLHttpRequest.readyState);
				// 错误信息   
				alert(textStatus);
				flag=0;
				pageNum-=1;
				if(pageNum<1)
					pageNum=1;
				window.top.loading.remove();
			}
		})
	}
	function getTeachingMaterial(){             //获取教材版本
	
		$.ajax({
			url:url+"/SunvoteEducation/api/v1/teachingmaterial",
			async:true,
			type:"post",
			data:{subject_id:subject_id},
			success:function(data){
				console.log(data);
					if (data.data.length > 0) {
						var teach_html = "";
						for (var i = 0; i < data.data.length; i++) {
							teach_html += '<li data-id="'
									+ data.data[i].ID
									+ '" class="li_name"><p class="name">'
									+ data.data[i].NAME
									+ '</p><img src="../static/images/arrow_right.png" /><div class="clearfix"></div></li>';
						}
						$(".book_box ul").html(teach_html);
						var li_length = $(".book_box ul li").length;
						for (var k = 0; k < li_length; k++) {
							var books = [];
							var book_html = "";
							var book_id = $(".book_box ul").children("li")
									.eq(k).attr("data-id");

							if (textBook(book_id).length > 0) {

								books = textBook($(".book_box ul li").eq(k)
										.attr("data-id"));
								$(".book_box ul li").eq(k).append('<div class="float_box"><ul><div class="clearfix"></div></ul></div>');

								for (var j = 0; j < books.length; j++) {
									console.log("j:" + j);
									book_html += '<li data-id=' + books[j].id
											+ '>' + books[j].name + '</li>';
								}
								$(".float_box").eq(k).children("ul").find(
										".clearfix").before(book_html);
								TEXTBOOK_ID = books[0].id;
							}

						}
						getChapter(TEXTBOOK_ID);
						$("#book_name").text(
								$(".name").eq(0).text()
										+ "/"
										+ $(".float_box").eq(0).find('li')
												.eq(0).text());
					}else{
						window.top.loading.remove();
					}
				
			},
			error: function (XMLHttpRequest, textStatus, errorThrown) {
				// 错误信息   
				alert("状态码："+XMLHttpRequest.status+"状态："+XMLHttpRequest.readyState+"错误信息："+textStatus+"");
				window.top.loading.remove();
			}
		})
		
	}
	function textBook(id){          //获取教材
		var textBookName=[];
		$.ajax({
			url:url+"/SunvoteEducation/api/v1/textbook",
			async:false,
			type:"post",
			data:{teaching_material_id:id,subject_id:subject_id,grade_id:""},
			success:function(data){
				if(data.data.length>0){
					for(var i=0;i<data.data.length;i++){
						textBookName[i]={"name":data.data[i].NAME,"id":data.data[i].ID};
					}
				}
			},
			error: function (XMLHttpRequest, textStatus, errorThrown) {
				// 错误信息   
				alert("状态码："+XMLHttpRequest.status+"状态："+XMLHttpRequest.readyState+"错误信息："+textStatus+"");
				window.top.loading.remove();
			}
		})
		return textBookName;
	}
	function getClassName(){               //获取中文班级名
		$.ajax({
			url:url+"/SunvoteEducation/api/v1/classname",
			async:false,
			type:"post",
			data:{id:class_id},
			success:function(data){
				$(".classList li").html(data.data);
			},
			error: function (XMLHttpRequest, textStatus, errorThrown) {
				// 错误信息   
				alert("状态码："+XMLHttpRequest.status+"状态："+XMLHttpRequest.readyState+"错误信息："+textStatus+"");
				window.top.loading.remove();
			}
		})
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
	
		$(".section").on("click",".add",function(event){       //展开菜单
			event.stopPropagation();	
			var that=$(this).closest("li");
			if($(".tab .active").attr("data-index")==1){
				if(that.attr("data-img-click")==0){
					getMenu(that.attr("data-id"),that);
				}	
				that.attr("data-img-click",1);
			}else{
				that.attr("data-img-click",1);
			}
			
			if(that.children('ul').length>0)
				that.children('ul').slideToggle(function(){
					if(that.children('ul').css("display")=="block")
						that.children('img').attr("src","../static/images/reduce.png");
					else
						that.children('img').attr("src","../static/images/add.png");
				});
		});
		$(".section").on("click","span",function(event){       //点击菜单获取题目
			window.top.loading.show();
			event.stopPropagation();
			pageNum=1;
			$(".question_box ul").html("");
			var that=$(this).closest("li");
			if($(".tab .active").attr("data-index")==1){	
					paper_title = this.textContent;
					getQuestion(that);
					$(".menu_active").removeClass();
					that.addClass("menu_active");
			}else{
					paper_title = this.textContent;
					getQuestion(that);
					$(".menu_active").removeClass();
					that.addClass("menu_active");
			}

		});
		$(".book_box").children("ul").on("mouseover","li",function(event){    //教材版本交互
			event.stopPropagation();
			$(this).children(".float_box").css("display","block");
		});
		$(".book_box").children("ul").on("mouseleave","li",function(event){  //教材版本交互
			event.stopPropagation();
			$(this).children(".float_box").css("display","none");
		});
		$(".float_box").on("mouseleave",function(event){                //教材版本交互
			event.stopPropagation();
			$(this).css("display","none");
		});
		$(document).on("click",".float_box li",function(event){                //教材版本交互
			event.stopPropagation();
			var id=$(this).attr("data-id");
			$("#book_name").text($(this).closest(".li_name").children(".name").text()+"/"+$(this).text());
			$(".float_box").css("display","none");
			$(".book_box").slideToggle();
			getChapter(id);
		});
		$(".book").click(function(){                                //教材版本下拉框交互
			$(".book_box").slideToggle();
		})
		$(document).on("click",".check_box",function(){    //选中题目
			
			if($(this).hasClass("checked")){
				var id=$(this).closest("li").attr("data-id");
				var que_index= -1 ;
				for(var tp = 0 ; tp < question_box.length; tp++){
					if(question_box[tp].id == id){
						que_index = tp;
					}
				}
				$(this).removeClass("checked");
				question_box.splice(que_index,1);
				question_num--;
			}else{
				//question_box[question_num].id =$(this).closest("li").attr("data-id");
				//question_box[question_num].knowledge_id =$(this).closest("li").attr("data-knowledge");
				question_box[question_num] = {id:$(this).closest("li").attr("data-id"),knowledge_id:$(this).closest("li").attr("data-knowledge")};
				question_num++;
				$(this).addClass("checked");
			}
			$("#all_que_num").html(question_num);
		});
		$(".clear_que").click(function(){                 //清空
			question_num=0;
			question_box=[];
			$(".checked").removeClass("checked");
			$("#all_que_num").html(question_num);
		});
		$(".tab li").click(function(){                     //教材与知识点选择
			window.top.loading.show();
			pageNum=1;
			$(this).siblings().removeClass("active");
			$(this).addClass("active");
			if($(this).index()==0){
				getTeachingMaterial();
				$(".choose_book").css("display","block");
				//getChapter(TEXTBOOK_ID);
			}else{
				$(".choose_book").css("display","none");
				getPoint();
			}
		});
		$(".topic").click(function(){
			if(parseInt($("#all_que_num").text())>0){
				paper_time = parseInt($("#all_que_num").text()) > 75 ? "150" : (parseInt($("#all_que_num").text()) * 2);
				$("#title").val(paper_title);
				$("#time").val(paper_time);
				$('#myModal').modal('show');
			}else{
				alert("请先选择题目")
			}
		});
		$(".view_more").click(function(){                     //加载更多
			flag++;
			if(end>0){
				$(".view_more p").html("没有更多了");
				return;
			}
			if(flag==1){
				window.top.loading.show();
				pageNum++;
				getQuestion($(".menu_active"));
			}
		})
		$("#submit").click(function(){
			var question_arry=[];
			for(var i=0;i<question_num;i++){
				question_arry[i]={
						score: "0",
						part_score: "0",
						question_id: question_box[i].id,
						knowledge_id:question_box[i].knowledge_id,
						rank: i.toString(),
						no_name: i.toString()
					};
				
			}
			var data={
				title: $("#title").val(),
				exam_time: $("#time").val(),
				paper_type: "101",
				subject_id: subject_id,
				grade_id: "",
				class_id: class_id,
				user_id: user_id,
				score: "",
				questions: question_arry
			};
			sessionStorage.setItem("data",JSON.stringify(data));
			location.href="paper_view.do?classID="+class_id+"&userid="+user_id;
			
		})