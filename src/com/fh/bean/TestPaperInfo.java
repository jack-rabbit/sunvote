package com.fh.bean;

import com.google.gson.Gson;

public class TestPaperInfo {
	
	// 测试试卷ID
	private String testPaperInfoId ;
	
	// 问题ID
	private String questionId ;
	
	// 答案
	private String answer ;
	
	// 是否正确
	private String right; 
	
	// 分数
	private String score ;
	
	
	// 是否点赞
	private String likes ;
	
	// 回答类型
	private String answerType ;
	
	// 按键时间
	private String pressTime ;
	
	// 接收时间
	private String receiverDate ;
	
	// 是否主观题
	private String subjective ;
	
	// 笔记
	private String note; 
	
	// 标记等级
	private String markNo ;
	
	// 排序
	private String rank ;
	

	public String getTestPaperInfoId() {
		return testPaperInfoId;
	}

	public void setTestPaperInfoId(String testPaperInfoId) {
		this.testPaperInfoId = testPaperInfoId;
	}

	public String getQuestionId() {
		return questionId;
	}

	public void setQuestionId(String questionId) {
		this.questionId = questionId;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getRight() {
		return right;
	}

	public void setRight(String right) {
		this.right = right;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public String getLikes() {
		return likes;
	}

	public void setLikes(String likes) {
		this.likes = likes;
	}

	public String getAnswerType() {
		return answerType;
	}

	public void setAnswerType(String answerType) {
		this.answerType = answerType;
	}

	public String getPressTime() {
		return pressTime;
	}

	public void setPressTime(String pressTime) {
		this.pressTime = pressTime;
	}

	public String getReceiverDate() {
		return receiverDate;
	}

	public void setReceiverDate(String receiverDate) {
		this.receiverDate = receiverDate;
	}

	public String getSubjective() {
		return subjective;
	}

	public void setSubjective(String subjective) {
		this.subjective = subjective;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getMarkNo() {
		return markNo;
	}

	public void setMarkNo(String markNo) {
		this.markNo = markNo;
	}
	
	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public static TestPaperInfo parse(String json){
		Gson gson = new Gson();
		return gson.fromJson(json, TestPaperInfo.class);
	}
	
	public String toJson(){
		Gson gson = new Gson();
		return gson.toJson(this);
	}

}
