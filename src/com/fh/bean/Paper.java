package com.fh.bean;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

public class Paper {
	private String title = "";

	private String exam_time = "";

	private String paper_type = "";

	private String subject_id = "";

	private String grade_id = "";

	private String user_id = "";
	
	private String class_id = "" ;
	
	private String school_id = "" ;

	public String getSchool_id() {
		return school_id;
	}

	public void setSchool_id(String school_id) {
		this.school_id = school_id;
	}

	private List<Question> questions = new ArrayList<Question>();
	
	private String score = "";

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTitle() {
		return this.title;
	}

	public void setExam_time(String exam_time) {
		this.exam_time = exam_time;
	}

	public String getExam_time() {
		return this.exam_time;
	}

	public void setPaper_type(String paper_type) {
		this.paper_type = paper_type;
	}

	public String getPaper_type() {
		return this.paper_type;
	}

	public void setSubject_id(String subject_id) {
		this.subject_id = subject_id;
	}

	public String getSubject_id() {
		return this.subject_id;
	}

	public void setGrade_id(String grade_id) {
		this.grade_id = grade_id;
	}

	public String getGrade_id() {
		return this.grade_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_id() {
		return this.user_id;
	}

	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}

	public List<Question> getQuestions() {
		return this.questions;
	}
	
	

	
	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	
	
	public String getClass_id() {
		return class_id;
	}

	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}

	public static Paper parse(String json){
		Gson gson = new Gson();
		return gson.fromJson(json, Paper.class);
	}
	
	public String toJson(){
		Gson gson = new Gson();
		return gson.toJson(this);
	}
}
