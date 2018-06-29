package com.fh.bean;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

public class TestPaper {
	
	// 测试ID
	private String testpaperId ;
	
	// 测验标题
	private String name ;
	
	// 试卷ID
	private String paperId ;
	
	// 班级ID
	private String classId ;
	
	// 教师ID
	private String teacherId ;
	
	// 开始日期
	private String startDate ;
	
	//结束日期
	private String endDate ;
	
	//创建日期
	private String createDate ;
	
	// 其他分数
	private String otherScore ;
	
	// 最高分
	private String highScore ;
	
	//最低分
	private String lowScore ;
	
	// 平均分
	private String avgScore ;
	
	private String totalScore;
	// 备注
	private String remark ;
	
	private List<StudentAnswer> students = new ArrayList<StudentAnswer>();

	public String getTestpaperId() {
		return testpaperId;
	}

	public void setTestpaperId(String testpaperId) {
		this.testpaperId = testpaperId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPaperId() {
		return paperId;
	}

	public void setPaperId(String paperId) {
		this.paperId = paperId;
	}

	

	public String getClassId() {
		return classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}

	public String getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getOtherScore() {
		return otherScore;
	}

	public void setOtherScore(String otherScore) {
		this.otherScore = otherScore;
	}

	public String getHighScore() {
		return highScore;
	}

	public void setHighScore(String highScore) {
		this.highScore = highScore;
	}

	public String getLowScore() {
		return lowScore;
	}

	public void setLowScore(String lowScore) {
		this.lowScore = lowScore;
	}

	public String getAvgScore() {
		return avgScore;
	}

	public void setAvgScore(String avgScore) {
		this.avgScore = avgScore;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
	public List<StudentAnswer> getStudents() {
		return students;
	}

	public void setStudents(List<StudentAnswer> students) {
		this.students = students;
	}

	public String getTotalScore() {
		return totalScore;
	}

	public void setTotalScore(String totalScore) {
		this.totalScore = totalScore;
	}

	public static TestPaper parse(String json){
		Gson gson = new Gson();
		return gson.fromJson(json, TestPaper.class);
	}
	
	public String toJson(){
		Gson gson = new Gson();
		return gson.toJson(this);
	}

}
