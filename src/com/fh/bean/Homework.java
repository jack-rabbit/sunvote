package com.fh.bean;

import java.util.List;

import com.google.gson.Gson;

public class Homework {

	private String CODE;
	private String NAME;
	private String SUBJECT_ID;
	private String ALL_SCORE;
	private String HOMEWORK_DESC;
	private List<HomeClass> CLASSLIST;
	private String QUESTION_COUNT;
	private String TEACHER_ID;
	private List<HomeworkQuestion> QUESTIOMS;

	public void setCODE(String CODE) {
		this.CODE = CODE;
	}

	public String getCODE() {
		return CODE;
	}

	public void setNAME(String NAME) {
		this.NAME = NAME;
	}

	public String getNAME() {
		return NAME;
	}

	public void setSUBJECT_ID(String SUBJECT_ID) {
		this.SUBJECT_ID = SUBJECT_ID;
	}

	public String getSUBJECT_ID() {
		return SUBJECT_ID;
	}

	public void setALL_SCORE(String ALL_SCORE) {
		this.ALL_SCORE = ALL_SCORE;
	}

	public String getALL_SCORE() {
		return ALL_SCORE;
	}

	public void setHOMEWORK_DESC(String HOMEWORK_DESC) {
		this.HOMEWORK_DESC = HOMEWORK_DESC;
	}

	public String getHOMEWORK_DESC() {
		return HOMEWORK_DESC;
	}

	public void setCLASSLIST(List<HomeClass> CLASSLIST) {
		this.CLASSLIST = CLASSLIST;
	}

	public List<HomeClass> getCLASSLIST() {
		return CLASSLIST;
	}

	public void setQUESTIOM_COUNT(String QUESTIOM_COUNT) {
		this.QUESTION_COUNT = QUESTIOM_COUNT;
	}

	public String getQUESTION_COUNT() {
		return QUESTION_COUNT;
	}

	public void setQUESTIOMS(List<HomeworkQuestion> QUESTIOMS) {
		this.QUESTIOMS = QUESTIOMS;
	}

	public List<HomeworkQuestion> getQUESTIOMS() {
		return QUESTIOMS;
	}

	
	
	public String getTEACHER_ID() {
		return TEACHER_ID;
	}

	public void setTEACHER_ID(String tEACHER_ID) {
		TEACHER_ID = tEACHER_ID;
	}

	public void setQUESTION_COUNT(String qUESTION_COUNT) {
		QUESTION_COUNT = qUESTION_COUNT;
	}

	public static Homework parse(String json) {
		Gson gson = new Gson();
		return gson.fromJson(json, Homework.class);
	}
}
