$(function(){
	/*创建答案列表*/
	var score=0;
	function creat(str_ans,a_num,fraction){
		$(".section").remove();
		$(".content").append('<div class="section section-1 single" data-fraction="'+fraction+'"> <div class="title"> <h3><span class="que_num">一、</span><span class="que_name">单选</span></h3> <input type="button" class="btn btn-danger pull-right remove" name="remove" value="删除" /> </div> <div class="question_list"></div></div>')
		var str=str_ans.split(',');
		q_num=str.length;
		for(var i=0;i<q_num;i++){
			str_temp=str[i];
			str_temp=str_temp.toUpperCase()
			code = str_temp.charCodeAt(); 
			on_index=code-65;
			
			if(code<(65+a_num)){
				console.log(str_temp);
				$(".question_list").append('<div class="question question'+(i+1)+'"><span>'+(i+1)+'、</span><ul></ul></div>');
				for(var j=0;j<a_num;j++){
					option=String.fromCharCode(0x41+j);
					if(on_index==j){
						console.log(on_index+"---"+j);
						$(".question"+(i+1)+' ul').append('<li class="btn btn-default on">'+option+'</li>');
					}else
						$(".question"+(i+1)+' ul').append('<li class="btn btn-default">'+option+'</li>');
				}	
			}else{
				alert("题目"+(i+1)+":"+String.fromCharCode(code)+"答案错误，超出选项数");
				//return;
			}
		}
	}

	/***********
	*1、单选题
	*2、完形填空
	*3、阅读理解
	*4、判断题
	*5、多选题
	***********/
	var type_2=1;
	var index_s_2=1;
	var index_e_2=5;
	var answer_2='a,b,c,d,a';
	var num_ans_2=4;

	function addQuestion(type,str_ans,a_num,index_s_2,index_e_2){
		console.log($(".section").length);
		var question_num=SectionToChinese($(".section").length+1);
		switch(type){
			case 1:                                             //单选题 
				$(".content").append('<div class="section section-1 single"> <div class="title"> <h3><span class="que_num">'+question_num+'、</span>'+'<span class="que_name">单选</span></h3> <input type="button" class="btn btn-danger pull-right remove" name="remove" value="删除" /> </div> <div class="question_list"></div></div>');
				var str=str_ans.split(',');
				q_num=str.length;
				if(q_num!==(index_e_2-index_s_2+1)){
					alert("答案长度错误，请检查后重新填写");
					return;
				}
				for(var i=index_s_2;i<=index_e_2;i++){
					str_temp=str[i-index_s_2];
					str_temp=str_temp.toUpperCase()
					code = str_temp.charCodeAt(); 
					on_index=code-65;
					if(code<(65+a_num)){
						console.log(str_temp);
						$(".section-1 .question_list").append('<div class="question question'+i+'"><span>'+i+'、</span><ul></ul></div>');
						for(var j=0;j<a_num;j++){
							option=String.fromCharCode(0x41+j);
							if(on_index==j){
								console.log(on_index+"---"+j);
								$(".question"+i+' ul').append('<li class="btn btn-default on">'+option+'</li>');
							}else
								$(".question"+i+' ul').append('<li class="btn btn-default">'+option+'</li>');
						}	
					}else{
						alert("题目"+(i)+":"+String.fromCharCode(code)+"答案错误，超出选项数");
						//return;
					}
				}
			break;
			case 2:                                             //完形填空
				$(".content").append('<div class="section section-2 single"> <div class="title"> <h3><span class="que_num">'+question_num+'、</span><span class="que_name">完形填空</span></h3> <input type="button" class="btn btn-danger pull-right remove" name="remove" value="删除" /> </div> <div class="question_list"></div></div>');
				var str=str_ans.split(',');
				q_num=str.length;
				if(q_num!==(index_e_2-index_s_2+1)){
					alert("答案长度错误，请检查后重新填写");
					return;
				}
				for(var i=index_s_2;i<=index_e_2;i++){
					str_temp=str[i-index_s_2];
					str_temp=str_temp.toUpperCase()
					code = str_temp.charCodeAt(); 
					on_index=code-65;
					if(code<(65+a_num)){
						console.log(str_temp);
						$(".section-2 .question_list").append('<div class="question question'+i+'"><span>'+i+'、</span><ul></ul></div>');
						for(var j=0;j<a_num;j++){
							option=String.fromCharCode(0x41+j);
							if(on_index==j){
								console.log(on_index+"---"+j);
								$(".question"+i+' ul').append('<li class="btn btn-default on">'+option+'</li>');
							}else
								$(".question"+i+' ul').append('<li class="btn btn-default">'+option+'</li>');
						}	
					}else{
						alert("题目"+(i)+":"+String.fromCharCode(code)+"答案错误，超出选项数");
						//return;
					}
				}
			break;
			case 3:                                             //阅读理解
				$(".content").append('<div class="section section-3 single"> <div class="title"> <h3><span class="que_num">'+question_num+'、</span><span class="que_name">阅读理解</span></h3> <input type="button" class="btn btn-danger pull-right remove" name="remove" value="删除" /> </div> <div class="question_list"></div></div>');
				var str=str_ans.split(',');
				q_num=str.length;
				if(q_num!==(index_e_2-index_s_2+1)){
					alert("答案长度错误，请检查后重新填写");
					return;
				}
				for(var i=index_s_2;i<=index_e_2;i++){
					str_temp=str[i-index_s_2];
					str_temp=str_temp.toUpperCase()
					code = str_temp.charCodeAt(); 
					on_index=code-65;
					if(code<(65+a_num)){
						console.log(str_temp);
						$(".section-3 .question_list").append('<div class="question question'+i+'"><span>'+i+'、</span><ul></ul></div>');
						for(var j=0;j<a_num;j++){
							option=String.fromCharCode(0x41+j);
							if(on_index==j){
								console.log(on_index+"---"+j);
								$(".question"+i+' ul').append('<li class="btn btn-default on">'+option+'</li>');
							}else
								$(".question"+i+' ul').append('<li class="btn btn-default">'+option+'</li>');
						}	
					}else{
						alert("题目"+(i)+":"+String.fromCharCode(code)+"答案错误，超出选项数");
						//return;
					}
				}
			break;
		}
	}
	//addQuestion(1,answer_2,num_ans_2,index_s_2,index_e_2);
	//addQuestion(2,answer_2,num_ans_2,6,10);
	//addQuestion(3,answer_2,num_ans_2,11,15);
	//addQuestion(1);
	//creat("A,B,a,D,C,E,b",4);

	$(document).on('click','.remove',function(){                //删除按钮
		$(this).parent().parent().remove();
	})
	$("#fast_submit").click(function(){           //点击确定，创建答案列表
		$("#addQuestion").attr("disabled","disabled");
		var answer=$("#answer").val();
		var num_ans=$("#num_ans").val();
		var fraction=$("#fraction").val();
		if(answer==''){
			alert("请输入题目答案，以分号隔开");
			return;
		}else if(fraction==''){
			alert("请输入题目分数");
			return;
		}
		//$(".fast").toggle();
		//$(".modal-backdrop").remove();
		$('.fast').modal('hide');
		score += parseInt(fraction)*answer.split(",").length;
		creat(answer,num_ans,fraction);
	})	

	var type_2=1;
	var index_s_2=1;
	var index_e_2=5;
	var answer_2='a,b,c,d,a';
	var num_ans_2=4;
	/*添加试题的确定按钮*/
	$("#addQuestion_submit").click(function(){
		$("#fast").attr("disabled","disabled");
		var type_2=$("#type").val();
		var index_s_2=$("#index_s_2").val();
		var index_e_2=$("#index_e_2").val();
		var answer_2=$("#answer_2").val();
		var num_ans_2=$("#num_ans_2").val();
		var fraction2=$("#fraction2").val();
		if(index_s_2==''){
			alert("请输入题目开始序号");
			return;
		}else if(index_e_2==''){
			alert("请输入题目结束序号");
			return;
		}

		$('.addQuestion').modal('hide');
	})
	/*更改考试时长*/
	$("#time_submit").click(function(){
		var test_time=$("#enter_time").val();
		if(test_time==''){
			alert("请输入考试时间");
			return;
		}
		$("#time").html(test_time);
		$('.test_time').modal('hide');
	})
	/*更改单选答案*/
	$(document).on('click','.single li',function(){
		$(this).siblings().removeClass("on");
		$(this).addClass("on");
	})
	/*提交保存数据*/
	$("#save").click(function(){
		var url= URL;
		var data={
			title: $(".text-center").html(),
		    exam_time: parseInt($("#time").text()),
		    paper_type: testData.paper_type,
		    subject_id: testData.subject_id,
		    grade_id: testData.grade_id,
		    user_id: testData.user_id,
		    score:score,
		    questions:[]
		}
		var rank=0;
		if($(".section").length>0){
			for(i=0;i<$(".section").length;i++){
				rank++;
				data.questions[i]={
					chapter_id: "0",
		            problem_type_id: "0",
		            knowledge_id: "0",
		            content: $(".que_name").text(),
		            option_num: "",
		            option_content: "",
		            answer: "",
		            difficulty: "",
		            analysis: "",
		            question_from: "",
		            score:parseInt($(".section").eq(i).attr("data-fraction")),
		            part_score: "",
		            remark: "",
		            rank: rank,
		            no_name: $(".que_num").text(),
		            questions:[]
					}
				for(j=0;j<$(".section").eq(i).find(".question_list").children(".question").length;j++){
					rank++;
					data.questions[i].questions[j]={
						chapter_id: "0",
						problem_type_id: "0",
						knowledge_id: "0",
						content: "",
						option_num: $(".question").eq(j).find("li").length,
						option_content: "",
						answer: $(".question").eq(j).find(".on").text(),
						difficulty: "0",
						analysis: "",
						question_from: "1",
						score: parseInt($(".section").eq(i).attr("data-fraction")),
						part_score: "0",
						remark: "",
						rank: rank,
						no_name: (i+1)+'.'+(j+1),
					}
				}
			}
		}
		
		if(data.questions.length>0){
			data=JSON.stringify(data);
			dataJson={"json":data};
			console.log(data);
//			ajax_submit(url,dataJson);
			var suc=ajax_submit(url,dataJson);
			if(suc==1){
				
			}			
		}
		else	
			alert("请添加试题");
	})
})

/*ajax封装函数*/
function ajax_submit(url,data){
	$(".loading").css("display","block");
	var flag=0;
	$.ajax({
		url:url,
		type:"POST",
		//async:false, 
		data:data,
		dataType:"json",
		success:function(data){
			flag=1;
			$(".loading").css("display","none");
//			alert("保存成功");
//			window.close();
			window.location.href = JUMP_URL ;
		}
	})
	return flag;
}
function fastSort(array,head,tail){
    //考虑到给每个分区操作的时候都是在原有的数组中进行操作的，所以这里head,tail来确定分片的位置
    /*生成随机项*/
    var randomnum = parseInt((head + tail) / 2 );
    var random = array[randomnum];
    /*将小于random的项放置在其左边  策略就是通过一个临时的数组来储存分好区的结果，再到原数组中替换*/
    var arrayTemp = [];
    var unshiftHead = 0;
    for(var i = head;i <= tail;i++){
      if(parseInt(array[i].rank)<parseInt(random.rank)){
        arrayTemp.unshift(array[i]);
        unshiftHead++;
      }else if(parseInt(array[i].rank)>parseInt(random.rank)){
        arrayTemp.push(array[i]);
      }
      /*当它等于的时候放哪，这里我想选择放到队列的前面，也就是从unshift后的第一个位置放置*/
      if(parseInt(array[i].rank)===parseInt(random.rank)){
        arrayTemp.splice(unshiftHead,0,array[i]);
      }
    }
    /*将对应项覆盖原来的记录*/
    for(var j = head , u=0;j <= tail;j++,u++){
      array.splice(j,1,arrayTemp[u]);
    }
    /*寻找中间项所在的index*/
    var nowIndex = array.indexOf(random);

    /*设置出口，当要放进去的片段只有2项的时候就可以收工了*/
    if(arrayTemp.length <= 2){
      return;
    }
    /*递归，同时应用其左右两个区域*/
    fastSort(array,head,nowIndex);
    fastSort(array,nowIndex+1,tail);
  }
	if(testData.questions.length > 0 && testData.questions[0].questions.length > 1){
		fastSort(testData.questions[0].questions,0,testData.questions[0].questions.length-1);
	}
	creatHtml(testData);
function creatHtml(data){	
		console.log(data);
		if(data.questions.length>0){
			$(".time").removeAttr("data-target");
			$(".btn_box").remove();
		}
		$(".header_box h1").html(data.title);	
		$("#time").html(data.exam_time);
		for(var i=0;i<data.questions.length;i++){
			$(".content").append('<div class="section section-'+i+' single" data-fraction="'+data.questions[i].score+'"> <h3><span class="que_num">'+data.questions[i].no_name+'</span>'+'<span class="que_name">'+data.questions[i].content+'</span></h3> <input type="button" class="btn btn-danger pull-right remove" name="remove" value="删除" /> </div> <div class="question_list"></div></div>')
			if(data.questions.length>0){$(".remove").remove();}
			for(var j=0;j<data.questions[i].questions.length;j++){
				$(".question_list").append('<div class="question question'+(j+1)+'"><span>'+(j+1)+'、</span><ul></ul></div>');
				for(var k=0;k<parseInt(data.questions[i].questions[j].option_num);k++){
					str_temp=data.questions[i].questions[j].answer;
					code=str_temp.charCodeAt();
					on_index=code-65;
					if(on_index==k){
						console.log(on_index+"---"+j);
						$(".question"+(j+1)+' ul').append('<li class="btn btn-default on">'+String.fromCharCode(0x41+k)+'</li>');
					}else
						$(".question"+(j+1)+' ul').append('<li class="btn btn-default">'+String.fromCharCode(0x41+k)+'</li>');
				}
			}
		}
	}

/*数字转汉字数字*/
var chnNumChar = ["零","一","二","三","四","五","六","七","八","九"];
        var chnUnitSection = ["","万","亿","万亿","亿亿"];
        var chnUnitChar = ["","十","百","千"];

        function SectionToChinese(section){
            var strIns = '', chnStr = '';
            var unitPos = 0;
            var zero = true;
            while(section > 0){
                var v = section % 10;
                if(v === 0){
                    if(!zero){
                        zero = true;
                        chnStr = chnNumChar[v] + chnStr;
                    }
                }else{
                    zero = false;
                    strIns = chnNumChar[v];
                    strIns += chnUnitChar[unitPos];
                    chnStr = strIns + chnStr;
                }
                unitPos++;
                section = Math.floor(section / 10);
            }
            return chnStr;
        }

        //alert(SectionToChinese(123));


				// <div class="question question1">
				// 	<span>1、</span>
				// 	<ul>
				// 		<li class="btn btn-default on">A</li>
				// 		<li class="btn btn-default">B</li>
				// 		<li class="btn btn-default">C</li>
				// 		<li class="btn btn-default">D</li>
				// 	</ul>
				// </div>
				// <div class="section section-1"> <div class="title"> <h3>一、单选</h3> <input type="button" class="btn btn-danger pull-right remove" name="remove" value="删除" /> </div> <div class="question_list">


