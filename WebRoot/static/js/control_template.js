var questionNUm = 0;
/*数字转汉字数字*/
var chnNumChar = [ "零", "一", "二", "三", "四", "五", "六", "七", "八", "九" ];
var chnUnitSection = [ "", "万", "亿", "万亿", "亿亿" ];
var chnUnitChar = [ "", "十", "百", "千" ];
/* 快速创建答案列表 */
var score = 0;
var total_score = 0;
var answerLen = 0;


$(function() {
	

	function creat(q_num, a_num, fraction) {
		// $(".section").remove();
		answer_index_b = $(".section").length + 1;

		$(".content").append('<div class="section section-'	+ answer_index_b+ ' single" data-fraction="'+ fraction+ '" data-score="'
								+ (q_num * fraction) + '" style="margin-top:80px;"><div class="title"><h3>第'	+ answer_index_b+ '大题(单选)总分: '
								+ q_num	+ ' X '	+ fraction	+ ' = '	+ (q_num * fraction)
								+ ' 分<!--<span>请在试题选项上点击，亮色为该试题的正确答案&nbsp; </span> --></h3> </div><div class="question_list"></div></div>');
		for (var i = 0; i < q_num; i++) {
			str_temp = str[i];
			str_temp = str_temp.toUpperCase()
			code = str_temp.charCodeAt();
			on_index = code - 65;
			questionNUm++;
			if (code < (65 + a_num)) {
				console.log(str_temp);
				$(".section-" + answer_index_b + " .question_list").append(
						'<div class="question question' + (questionNUm)
								+ '"><span>' + (questionNUm)
								+ '、</span><ul></ul></div>');
				for (var j = 0; j < a_num; j++) {
					option = String.fromCharCode(0x41 + j);
					if (on_index == j) {
						console.log(on_index + "---" + j);
						$(".question" + (questionNUm) + ' ul').append(
								'<li class="btn btn-default on">' + option
										+ '</li>');
					} else
						$(".question" + (questionNUm) + ' ul').append(
								'<li class="btn btn-default">' + option
										+ '</li>');
				}
			} else {
				alert("题目" + (i + 1) + ":" + String.fromCharCode(code)
						+ "答案错误，超出选项数");
				// return;
			}
		}
		$(".section-" + answer_index_b).attr("data-score",
				q_num * fraction);
		total_score += q_num * fraction;
		$("#score_all").text(total_score);
	}

	/***************************************************************************
	 * 1、单选题 2、完形填空 3、阅读理解 4、判断题 5、多选题
	 **************************************************************************/

	function addQuestion(type, a_num, index_s_2, fraction2) {
		console.log(type);
		fraction2=parseInt(fraction2);
		console.log(fraction2);
		answer_index_b = $(".section").length + 1;
		var question_num = SectionToChinese($(".section").length + 1);
		switch (type) {
		case 1: // 单选题
			// alert(typeof(index_s_2));
			$(".content")
			.append(
					'<div class="section section-'
							+ answer_index_b
							+ ' " '
							+'data-type="1" '
							+'data-questionNum="'
							+index_s_2
							+'" data-optionNum="'
							+a_num
							+'" '
							+'data-fraction="'
							+ fraction2
							+ '" data-score="'
							+ (index_s_2 * fraction2)
							+ '"> <div class="title"><h3>第'
							+ answer_index_b
							+ '大题(单选)总分: '
							+ index_s_2
							+ ' X '
							+ fraction2
							+ ' = '
							+ index_s_2 * fraction2
							+ ' 分<!--<span>请在试题选项上点击，亮色为该试题的正确答案&nbsp; </span>--></h3> </div> <div class="question_list"></div></div>');
			for (i = 1; i <= index_s_2; i++) {
				$(".section-" + answer_index_b + " .question_list").append(
						'<div class="question question' + i + '"><span>' + i
								+ '、</span><ul></ul></div>');
				for (var j = 0; j < a_num; j++) {
					option = String.fromCharCode(0x41 + j);
					$(".section-" + answer_index_b + " .question" + i + ' ul')
							.append(
									'<li class="btn btn-default">' + option
											+ '</li>');
				}
			}
			total_score += index_s_2 * fraction2;
			$("#score_all").text(total_score);
			break;		
		case 2: // 多选题
		// $(".content").html("");
			$(".content")
					.append(
							'<div class="section section-'
									+ answer_index_b
									+ ' " '
									+'data-type="2" '
									+'data-questionNum="'
									+index_s_2
									+'" data-optionNum="'
									+a_num
									+'" '
									+ ' " data-fraction="'
									+ fraction2
									+ '" data-score="'
									+ (index_s_2 * fraction2)
									+ '"> <div class="title"><h3>第'
									+ answer_index_b
									+ '大题(多选)总分: '
									+ index_s_2
									+ ' X '
									+ fraction2
									+ ' = '
									+ index_s_2 * fraction2
									+ ' 分<!--<span>请在试题选项上点击，亮色为该试题的正确答案&nbsp; </span>--></h3> </div> <div class="question_list"></div></div>');
			for (var i = 1; i <= index_s_2; i++) {
				questionNUm++;
				$(".section-" + answer_index_b + " .question_list").append(
						'<div class="question question' + questionNUm
								+ '"><span>' + questionNUm
								+ '、</span><ul></ul></div>');
				for (var j = 0; j < a_num; j++) {
					option = String.fromCharCode(0x41 + j);
					$(
							".section-" + answer_index_b + " .question"
									+ questionNUm + ' ul').append(
							'<li class="btn btn-default">' + option + '</li>');
				}
			}
			total_score += index_s_2 * fraction2;
			$("#score_all").text(total_score);
			break;
		}
		$(".section0").attr("data-score",
				$(".section0").find(".question").length * fraction2);
	}

	

	/* 添加试题的确定按钮 */
	$("#addQuestion_submit").click(function() {
		// $("#fast").attr("disabled","disabled");
		var type_2 = parseInt($("#type").val());
		var index_s_2 =parseInt($("#index_s_2").val());
		//var index_e_2 = parseInt($("#index_s_2").val());
		
		
		// var answer_2=$("#answer_2").val();
		var num_ans_2 = $("#num_ans_2").val();
		var fraction2 = parseFloat($("#fraction2").val());
		if (isNaN(index_s_2)) {
			alert("请输入题目个数");
			return;
		} else if (isNaN(fraction2)) {
			alert("请输入题目分数");
			return;
		}
		
		// console.log(typeof(type_2));
		console.log(type_2+'-'+ num_ans_2+"-"+ index_s_2+"-"+ fraction2);
		
		addQuestion(type_2, num_ans_2, index_s_2, fraction2);
		$('.addQuestion').modal('hide');
	})
	



	/* 提交保存数据 */
	$("#save").click(function() {
						var url = URL;

						var data = {
							title : $(".header_box h1").text(),
							//exam_time : parseInt($("#time").text()),
							//paper_type : testData.paper_type,
							subject_id : testData.subject_id,
							grade_id : testData.grade_id,
							user_id : testData.user_id,
							school_id : testData.school_id,
							score : total_score,
							questions : []
						};

						if ($(".section").length > 0) {
							var rank = 0;
							for (i = 0; i < $(".section").length; i++) {
								data.questions[i] = {
										index: i+1,
										type: $(".section").eq(i).attr("data-type"),
										questionNum: $(".section").eq(i).attr("data-questionNum"),
										optionNum: $(".section").eq(i).attr("data-optionNum"),
										score: $(".section").eq(i).attr("data-fraction")
								};	
							}
						}

						if (data.questions.length > 0) {
							data = JSON.stringify(data);
							dataJson = {
								"json" : data
							};
							ajax_submit(url, dataJson);
						} else
							alert("请添加试题");
					});

	/* ajax封装函数 */
	function ajax_submit(url, data) {
		$(".loading").css("display", "block");
		console.log(data);
		$.ajax({
			url : url,
			type : "POST",
			data : data,
			dataType : "json",
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			success : function(data) {
				$(".loading").css("display", "none");
				if(testData.paper_type == '1'){
					window.location.href = JUMP_URL + "?a=1&defaulturl=../paper/list2.do";
				}else{
					window.location.href = JUMP_URL + "?a=1&defaulturl=../paper/list4.do?school_id=" + testData.school_id ;
				}
			}
		})
	}
	function fastSort(array, head, tail) {
		// 考虑到给每个分区操作的时候都是在原有的数组中进行操作的，所以这里head,tail来确定分片的位置
		/* 生成随机项 */
		var randomnum = parseInt((head + tail) / 2);
		var random = array[randomnum];
		/* 将小于random的项放置在其左边 策略就是通过一个临时的数组来储存分好区的结果，再到原数组中替换 */
		var arrayTemp = [];
		var unshiftHead = 0;
		for (var i = head; i <= tail; i++) {
			if (parseInt(array[i].rank) < parseInt(random.rank)) {
				arrayTemp.unshift(array[i]);
				unshiftHead++;
			} else if (parseInt(array[i].rank) > parseInt(random.rank)) {
				arrayTemp.push(array[i]);
			}
			/* 当它等于的时候放哪，这里我想选择放到队列的前面，也就是从unshift后的第一个位置放置 */
			if (parseInt(array[i].rank) === parseInt(random.rank)) {
				arrayTemp.splice(unshiftHead, 0, array[i]);
			}
		}
		/* 将对应项覆盖原来的记录 */
		for (var j = head, u = 0; j <= tail; j++, u++) {
			array.splice(j, 1, arrayTemp[u]);
		}
		/* 寻找中间项所在的index */
		var nowIndex = array.indexOf(random);

		/* 设置出口，当要放进去的片段只有2项的时候就可以收工了 */
		if (arrayTemp.length <= 2) {
			return;
		}
		/* 递归，同时应用其左右两个区域 */
		fastSort(array, head, nowIndex);
		fastSort(array, nowIndex + 1, tail);
	}
	function creatHtml(data) {
		console.log(data);
		$(".header_box h1").html(data.title);
		$("#time").html(data.exam_time);
		if(data.score != null && data.score > 0 && data.score != ''){
			$("#score_all").html(data.score);
		}

		if (data.questions.length > 0) {
			$(".time").removeAttr("data-target");
			$(".remove").remove();
			$(".btn_box").remove();
		}

		for (var i = 0; i < data.questions.length; i++) {
			if (data.questions[i].questions) {
				$(".content")
						.append(
								'<div class="section section-'
										+ i
										+ '" data-fraction="'
										+ data.questions[i].score
										+ '" style="margin-top:80px;"> <h3><span class="que_num">'
										+ '第'
										+ (i + 1)
										+ '大题总分:'
										+ data.questions[i].questions.length
										+ " X "
										+ (parseFloat(data.questions[i].sug_score) / data.questions[i].questions.length)
										+ " = "
										+ data.questions[i].sug_score
										+ '</span>'
										+ '<span class="que_name">'
										+ data.questions[i].content
										+ '</span></h3><!-- <input type="button" class="btn btn-danger pull-right remove" name="remove" value="删除" /> --> <div class="question_list"></div></div>');
			} else {
				if (i == 0) {
					$(".content")
							.append(
									'<div class="section section0"> <div class="question_list" style="margin-top:80px"></div></div>');
				}
				$(".section0").find(".question_list").append(
						'<div class="question question' + (i + 1) + '"><span>'
								+ (++questionNUm) + '、</span><ul></ul></div>');
				for (var k = 0; k < parseInt(data.questions[i].option_num); k++) {
					str_temp = data.questions[i].answer;
					$(".section0").find(".question" + (i + 1) + ' ul').append(
							'<li class="btn btn-default">'
									+ String.fromCharCode(0x41 + k) + '</li>');
					for (var l = 0; l < str_temp.length; l++) {
						str_temp_arry = str_temp.split('');
						code = str_temp_arry[l].charCodeAt();
						on_index = code - 65;
						if (on_index == k) {
							$(".section0").find(
									".question" + (i + 1) + ' ul li').eq(
									on_index).attr("class",
									"btn btn-default on");
						}
					}
				}
			}

			if (data.questions[i].questions) {
				for (var j = 0; j < data.questions[i].questions.length; j++) {
					$(".section-" + i).find(".question_list").append(
							'<div class="question question' + (j + 1)
									+ '"><span>' + (++questionNUm)
									+ '、</span><ul></ul></div>');
					if ($(".section-" + i).find(".que_name").text() == "判断题") {
						for (var k = 0; k < parseInt(data.questions[i].questions[j].option_num); k++) {
							str_temp = data.questions[i].questions[j].answer;
							if (k % 2 == 0) {
								$(".section-" + i).find(
										".question" + (j + 1) + ' ul').append(
										'<li class="btn btn-default">√</li>');
							} else if (k % 2 == 1) {
								$(".section-" + i).find(
										".question" + (j + 1) + ' ul').append(
										'<li class="btn btn-default">×</li>');
							}

							if (str_temp == "√")
								$(".section-" + i).find(
										".question" + (j + 1) + ' ul li').eq(0)
										.attr("class", "btn btn-default on");
							else
								$(".section-" + i).find(
										".question" + (j + 1) + ' ul li').eq(1)
										.attr("class", "btn btn-default on");
						}
					} else {
						for (var k = 0; k < parseInt(data.questions[i].questions[j].option_num); k++) {
							str_temp = data.questions[i].questions[j].answer;
							$(".section-" + i).find(
									".question" + (j + 1) + ' ul').append(
									'<li class="btn btn-default">'
											+ String.fromCharCode(0x41 + k)
											+ '</li>');
							for (var l = 0; l < str_temp.length; l++) {
								str_temp_arry = str_temp.split('');
								code = str_temp_arry[l].charCodeAt();
								on_index = code - 65;
								if (on_index == k) {
									$(".section-" + i).find(
											".question" + (j + 1) + ' ul li')
											.eq(on_index).attr("class",
													"btn btn-default on");
								}
							}
						}
					}
				}
			}
		}
	}

	
	/*快速建题中，每输入五个答案就加一个空格*/
	$("#answer").on("input propertychange", function(event) {
		var answerStr = "";
		answerStr = $("#answer").val();
		var result = "";
		if (answerStr.length > 5) {
			answerStr = answerStr.replace(new RegExp(" ", "gm"), "");
			for (var i = 0; i < answerStr.length; i++) {
				result += answerStr[i];
				if (i % 5 == 4 && i != answerStr.length - 1) {
					result += " ";
				}
			}
		} else {
			result = answerStr;
		}
		$("#answer").val(result);
		if (answerStr.length > 0) {
			$(".tips").text("共" + answerStr.length + "题");
		} else {
			$(".tips").text("");
		}
	})

	

	function SectionToChinese(section) {
		var strIns = '', chnStr = '';
		var unitPos = 0;
		var zero = true;
		while (section > 0) {
			var v = section % 10;
			if (v === 0) {
				if (!zero) {
					zero = true;
					chnStr = chnNumChar[v] + chnStr;
				}
			} else {
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

	
	if (template != null && template.length > 0) {
		
			$("#addQuestion").attr("disabled", "disabled");
			$("#fast").attr("disabled", "disabled");
			for (var i = 0; i < template.length; i++) {
				if (template[i].type == 1) {
					var answer = "";
					for (var j = 0; j < template[i].questionNum; j++) {
						answer += "1";
					}
					creat(answer, template[i].optionNum, template[i].score);
				}
				if (template[i].type == 2) {
					addQuestion(5, template[i].optionNum, 1,
							template[i].questionNum, template[i].score);
				}
			}
			if(testData != null){
				$(".header_box h1").html(testData.title);
				$("#time").html(testData.exam_time);
				if(testData.score != null && testData.score > 0 && testData.score != ''){
					$("#score_all").html(testData.score);
				}
			}
		
	}else if (testData != null && testData.questions != null
			&& testData.questions.length > 0) {
		fastSort(testData.questions, 0, testData.questions.length - 1);
		for (var i = 0; i < testData.questions.length; i++) {

			if (testData.questions[0].questions
					&& testData.questions[0].questions.length > 1) {
				fastSort(testData.questions[i].questions, 0,
						testData.questions[i].questions.length - 1);
			}
		}
		creatHtml(testData);
	}else{
		if(testData != null){
			$(".header_box h1").html(testData.title);
			$("#time").html(testData.exam_time);
			if(testData.score != null && testData.score > 0 && testData.score != ''){
				$("#score_all").html(testData.score);
			}
		}
	}
})
