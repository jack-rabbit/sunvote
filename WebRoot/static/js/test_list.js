var option_html = "";
var subject_id = "";

function getQueryString(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
	var r = window.location.search.substr(1).match(reg);
	if (r != null)
		return unescape(r[2]);
	return null;
}
var class_id = getQueryString("classid");
$(document).ready(
				function() {
					
					$.ajax({
								url : url + "/teacher/info",
								async : false,
								type : "post",
								success : function(data) {
									subject_id = data.data.subjectList[0].SUBJECT_ID;
									user_id = data.data.ID;
									if (data.data.classInfoList.length > 0) {
										for (var i = 0; i < data.data.classInfoList.length; i++) {
											option_html += '<option value="'
													+ data.data.classInfoList[i].CLASS_ID
													+ '">'
													+ data.data.classInfoList[i].CLASS_NAME
													+ '</option>'
										}
										$("#dealer_id_2").html(option_html);
									}
									getList();
								},
								error: function (XMLHttpRequest, textStatus, errorThrown) {
									// 错误信息   
									alert("状态码："+XMLHttpRequest.status+"状态："+XMLHttpRequest.readyState+"错误信息："+textStatus+"");
									window.top.loading.remove();
								}
							})
					// 日期框
					$('.date-picker').datepicker({
						autoclose : true,
						todayHighlight : true
					});
					window.top.loading.remove();
				})
function getList(start_date, end_date, class_id) { // 获取测验列表
	var tab_html = "";
	if(class_id == null){
		class_id = getQueryString("classid");
	}
	$.ajax({
				url : url + "/api/v1/testpaper",
				async : false,
				type : "post",
				data : {
					test_type : "101",
					user_id : user_id,	
					subject_id : subject_id,
					class_id : class_id,
					currentpage : "1",
					showcount : "",
					start_date : start_date,
					end_date : end_date
				},
				success : function(data) {
					console.log(data);
					for (var i = 0; i < data.data.length; i++) {
						tab_html += '<tr><td>'
								+ (i + 1)
								+ '</td><td>'
								+ data.data[i].name
								+ '</td><td>'
								+ getClassName(data.data[i].classId)
								+ '</td><td>'
								+ data.data[i].createDate
								+ '</td><td><a onclick="window.top.loading.show();jump($(this));" data-id="'
								+ data.data[i].testpaperId
								+ '" >查看详情</a> &nbsp;&nbsp;&nbsp;&nbsp; <!-- <a onclick="window.top.loading.show();ansync($(this)); " data-id="' 
								+ data.data[i].testpaperId + '" >班级分析</a> --></td></tr>'
					}
					$("#tab_body").html(tab_html);
				},
				error: function (XMLHttpRequest, textStatus, errorThrown) {
					// 错误信息   
					alert("状态码："+XMLHttpRequest.status+"状态："+XMLHttpRequest.readyState+"错误信息："+textStatus+"");
					window.top.loading.remove();
				}
			});
}
function jump(obj) { // 预览测验详情
	var id = obj.attr("data-id");
	location.href = "paper_view1.do?testpaperId=" + id;
}

function ansync(obj){
	// 班级分析
	var id = obj.attr("data-id");
	location.href = "classansync.do?testpaperId=" + id;
}

function getSubjectName(id) { // 获取科目中文名
	var subjectName = "";
	$.ajax({
		url : url + " /api/v1/subjectcname",
		async : false,
		type : "post",
		data : {
			id : id
		},
		success : function(data) {
			subjectName = data.data;
		}
	})
	return subjectName;
}
function getClassName(id) { // 获取班级中文名
	var className = "";
	$.ajax({
		url : url + "/api/v1/classname",
		async : false,
		type : "post",
		data : {
			id : id
		},
		success : function(data) {
			className = data.data;
		},
		error: function (XMLHttpRequest, textStatus, errorThrown) {
				// 错误信息   
				alert("状态码："+XMLHttpRequest.status+"状态："+XMLHttpRequest.readyState+"错误信息："+textStatus+"");
				window.top.loading.remove();
			}
	})
	return className;
}
function tosearch() { //搜索
	var start_date = $("#lastStart").val();
	var end_date = $("#lastEnd").val();
	var class_id = $("#dealer_id_2").val();
	getList(start_date, end_date, class_id);
}