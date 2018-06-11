package com.fh.bean;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

public class StudentAnswer {
	
	private String studentId;
	
	private String score;
	
	private List<TestPaperInfo> questions = new ArrayList<TestPaperInfo>();

	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public List<TestPaperInfo> getQuestions() {
		return questions;
	}

	public void setQuestions(List<TestPaperInfo> questions) {
		this.questions = questions;
	}
	
	
	public static StudentAnswer parse(String json){
		Gson gson = new Gson();
		return gson.fromJson(json, StudentAnswer.class);
	}
	
	public String toJson(){
		Gson gson = new Gson();
		return gson.toJson(this);
	}


}
