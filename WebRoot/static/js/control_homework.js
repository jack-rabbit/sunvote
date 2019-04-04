var saveData={} //声明保存数据
		
		$(document).on('click',"input[type='checkbox']",function(){   //选择班级
			console.log($(this).prop("checked"));
			if($(this).prop('checked')){
				$(this).closest("li").attr("class","checked");
			}else{
				$(this).closest("li").removeClass("checked");
			}
			
		});
		var work={        //保存标题框中的数字框的值
			que_num:0,
			ans_num:4,
			score:0
		}
		//点击+执行操作
		function creat_work(_id,index,num){//index:开始序号，num:目标序号
			
			if(_id=="que_num"){    //新增题目
				for(j=index;j<=num;j++){
					$(".subject_body_tbody").append('<tr><td class="first">'+j+'</td><td class="middle"><div class="question question'+j+'"><ul></ul></div></td><td class="middle"><span>选项个数</span><span class="add">+</span><input type="number" class="w_100 ans_num" value="'+$("#ans_num").val()+'"/><span class="redu">-</span></td><td class="middle"><span>分值</span><span class="add">+</span><input type="number" class="w_100 score" value="1"/><span class="redu">-</span></td><td class="last"><a class="remove"><img src="static/images/remove.png" /></a></td></tr>');
					for(i=0;i<work.ans_num;i++){
						$(".question"+j+" ul").append('<li class="btn btn-default">'+String.fromCharCode(0x41 + i)+'</li>')
					}
				}
			}
			else if(_id=="ans_num"){//新增选项
				//alert($("#que_num").val());
				for(j=1;j<=work.que_num;j++){	//轮询每道题目
					var now_length=$(".question"+j+" ul").find(".btn").length; //获取当前题目选项个数
					if(now_length<work.ans_num){   //当前题目选项个数小于数字框中个数，则把选项个数增加到数字框中的个数
						for(i=now_length;i<work.ans_num;i++){
							console.log("index:"+index+"-"+"num:"+num+"i:"+i);
							$(".question"+j+" ul").append('<li class="btn btn-default">'+String.fromCharCode(0x41 + i)+'</li>')
						}
					}
					if(now_length>work.ans_num){//当前题目选项个数大于数字框中个数，则把选项个数减少到数字框中的个数
						for(i=now_length;i>=work.ans_num;i--){
							$(".question"+j+" ul").find(".btn").eq(work.ans_num).remove();
						}
					}
					
				}
				
			}else{
				if(_id.siblings(".w_100").attr("class").indexOf("ans_num")>-1){ //没有id，但是class中含有ans_num，则为单个题目中的选项设置框
					var _index=_id.closest("tr").index()+1;
					console.log(_index);
					for(i=index;i<=num;i++){
						$(".question"+_index+" ul").append('<li class="btn btn-default">'+String.fromCharCode(0x41 + i-1)+'</li>')
					}
				}
			}
		}
		//点击-执行操作
		function remove_work(_id,index,num){
			
			if(_id=="que_num"){	//减少题目
				for(i=index;i<=num;i++){
					$(".subject_body_tbody tr").eq(index).remove();
				}
			}
			if(_id=="ans_num"){  //减少选项
				for(j=1;j<=work.que_num;j++){    //轮询每道题目
					var now_length=$(".question"+j+" ul").find(".btn").length;  //获取当前题目中的选项个数
					if(now_length>work.ans_num){     //如果当前选项个数大于数字框中的值，则减少选项个数到数字框中的个数
						for(i=now_length;i>=work.ans_num;i--){
							$(".question"+j+" ul").find(".btn").eq(work.ans_num).remove();
						}
					}
					if(now_length<work.ans_num){  //如果当前选项个数小于数字框中的值，则增加选项个数到数字框中的个数
						for(i=now_length;i<work.ans_num;i++){
							$(".question"+j+" ul").append('<li class="btn btn-default">'+String.fromCharCode(0x41 + i)+'</li>')
						}
					}
					
				}
			}else{
				if(_id.siblings(".w_100").attr("class").indexOf("ans_num")>-1){  //没有id值，但是类名中含有ans_num，则判断为单个题目中的选项设置框
					var _index=_id.closest("tr").index()+1;
					for(i=index;i<=num;i++){
						$(".question"+_index+" ul").find(".btn").eq(index).remove();
					}
				}
			}
			
		}
		//点击+按钮
		$(document).on("click",".add",function(){
			var _that=$(this);
			var temp_num=0;
			//获取当前按钮旁边数字框的值
			temp_num=parseInt(_that.siblings(".w_100").val());
			temp_num+=1;
			//点击+号，数字框中的数字+1
			_that.siblings(".w_100").val(temp_num);
			//如果数字框有id，则是标题栏上面的数字框
			if(_that.siblings(".w_100").attr("id")){
				//将下面的数字框的值设置成标题栏数字框的值
				var _class=_that.siblings(".w_100").attr("id");
				
				//题目数
				if(_class=="que_num"){
					work.que_num=temp_num;
					creat_work(_class,work.que_num,work.que_num);					
				}
				//选项数
				if(_class=="ans_num"){
					if(temp_num>=10){
						temp_num=9;
					}
					work.ans_num=temp_num;
					creat_work(_class,work.ans_num,work.ans_num);
				}	
				$("."+_class).val(temp_num);
			}
			else{
				if(_that.siblings(".w_100").attr("class").indexOf("ans_num")>-1){
					creat_work(_that,temp_num,temp_num);
				}
			}
			if(work.que_num!=0){
				$(".main_info").remove();
			}
		})
		//点击-按钮
		$(document).on("click",".redu",function(){
			var _that=$(this);
			var temp_num=0;
			
			temp_num=parseInt(_that.siblings(".w_100").val());
			temp_num-=1;
			if(temp_num<0){
				temp_num=0;
				return;
			}
			
			_that.siblings(".w_100").val(temp_num);
			
			if(_that.siblings(".w_100").attr("id")){
				var _class=$(this).siblings(".w_100").attr("id");
				$("."+_class).val(temp_num);
				
				if(_class=="que_num"){
					work.que_num=temp_num;
					remove_work(_class,work.que_num,work.que_num);
				}
				if(_class=="ans_num"){
					work.ans_num=temp_num;
					remove_work(_class,work.ans_num,work.ans_num);
				}	
			}else{
				if(_that.siblings(".w_100").attr("class").indexOf("ans_num")>-1){
					remove_work(_that,temp_num,temp_num);
				}
			}
			if(work.que_num!=0){
				$(".main_info").remove();
			}
		})
		$(document).on("click",".remove",function(){
			var _that=$(this);
			_that.closest("tr").remove();
			work.que_num=$(".first").length;
			$("#que_num").val(work.que_num);
			for(i=0;i<$(".first").length;i++){
				//console.log($(".first").closest("tr").index());
				$(".first").eq(i).text(i+1);
				$(".question").eq(i).attr("class","question question"+(i+1));
			}
		});
		$(document).on("click","li.btn ",function(){
			if($(this).attr("class").indexOf("on")>-1)
				$(this).removeClass("on");
			else
				$(this).addClass("on");
		});
		$("#que_num").change(function(){
			var now_num=parseInt($("#que_num").val());
			var old_num=parseInt(work.que_num);
			var _temp=now_num-old_num;
			
			if(now_num!=0){
				$(".main_info").remove();
			}
			if(_temp>0){
				creat_work($(this).attr("id"),(old_num+1),now_num);
			}else{
				remove_work($(this).attr("id"),now_num,old_num);
			}
			
			work.que_num=now_num;
			
		})
		$("#ans_num").change(function(){
			var now_num=parseInt($("#ans_num").val());
			var old_num=parseInt(work.ans_num);
			var _temp=now_num-old_num;
			if(now_num>=10){
				now_num=9;	
			}
			$(".ans_num").val(now_num);
			work.ans_num=now_num;
			
			if(_temp>0){
				creat_work($(this).attr("id"),(old_num+1),now_num);
			}else{
				remove_work($(this).attr("id"),now_num,old_num);
			}
			
			
		});
		
		
		
		function save(){
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入练习标题',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}
			if($("#HOMEWORK_DESC").val()==""){
				$("#HOMEWORK_DESC").tips({
					side:3,
		            msg:'请输入练习说明',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#HOMEWORK_DESC").focus();
			return false;
			}
			var all_score=0;
			for(var i=0;i<work.que_num;i++){
				all_score+=parseInt($(".score").eq(i+1).val());
			}
			var CLASSLIST=[];
			if($(".checked").length>0){
				for(var j=0;j<$(".checked").length;j++){
					var _index=$(".checked").eq(j).index();
					console.log($(".date-picker").eq(_index).val());
					if($(".date-picker").eq(_index).val()==''){
						$(".date-picker").eq(_index).tips({
							side:3,
				            msg:'请指定时间',
				            bg:'#AE81FF',
				            time:2
				        });
						return false;
					}
					
					CLASSLIST[j]={
						CLASS_ID:$("#class"+_index).val(),
						COMPLETE_DATE:$(".date-picker").eq(_index).val()
					};
					
				}
			}else{
				$(".classBox").tips({
					side:3,
		            msg:'请选择班级和指定时间',
		            bg:'#AE81FF',
		            time:2
		        });
				return false;
			}
			
			if(work.que_num<=0){
				$('.subject').tips({
					side:3,
		            msg:'请添加题目',
		            bg:'#AE81FF',
		            time:2
		        });
				return false;
			}
			var QUESTIONS=[];
			for(var k=0;k<work.que_num;k++){
				QUESTIONS[k]={
					RANK:$(".first").eq(k).text(),
					NAME:$(".first").eq(k).text(),
					OPTION_NUM:$(".ans_num").eq(k+1).val(),
					SCORE:$(".score").eq(k+1).val(),
					RIGHT_ANSWER:"",
					TYPE:""
				}
				
				var type=0,right_ans='';
				var a_num=$('.question'+(k+1)).find('.on').length;
				if(a_num<=0){
					//alert("题目"+(k+1)+"请选择正确答案");
					$('.question'+(k+1)).tips({
						side:3,
			            msg:'请指定正确答案',
			            bg:'#AE81FF',
			            time:2
			        });
					return false;
				}
				for(var x=0;x<a_num;x++){
					right_ans+=$('.question'+(k+1)).find('.on').eq(x).text();
				}
				if(a_num>1){
					type=2;
				}else{
					type=1;
				}
				
				QUESTIONS[k].RIGHT_ANSWER=right_ans;
				QUESTIONS[k].TYPE=type;
			}
			
			
			saveData.TEACHER_ID=$("#TEACHER_ID").val();
			saveData.NAME=$("#NAME").val();
			saveData.HOMEWORK_DESC=$("#HOMEWORK_DESC").val();
			saveData.ALL_SCORE=all_score;
			saveData.CLASSLIST=CLASSLIST;
			saveData.QUESTION_COUNT=work.que_num;
			saveData.QUESTIONS=QUESTIONS;
			
			//console.log(saveData);
			if(homework_id==""){
				save_data(JSON.stringify(saveData));
				//console.log("保存");
			}
			else{
				//console.log("更新");
				saveData.HOMEWORK_ID=homework_id;
				up_data(JSON.stringify(saveData));
			}
				
			
			
			
			
		}
		
		