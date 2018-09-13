package com.fh.bean;

import java.util.List;

public class Question {
	
	private String question_id ;

	private String subject_id;

	private String chapter_id;

	private String problem_type_id;

	private String knowledge_id;

	private String content;

	private String option_num;

	private String option_content;

	private String answer;

	private String difficulty;

	private String analysis;

	private String question_from;

	private String score;

	private String part_score;

	private String remark;

	private String rank;

	private String no_name;
	
	private String sug_score;
	
	private String sug_part_score;
	
	private String questionType ;
	
	private List<Question> questions;

	public void setSubject_id(String subject_id) {
		this.subject_id = subject_id;
	}

	public String getSubject_id() {
		return this.subject_id;
	}

	public void setChapter_id(String chapter_id) {
		this.chapter_id = chapter_id;
	}

	public String getChapter_id() {
		return this.chapter_id;
	}

	public void setProblem_type_id(String problem_type_id) {
		this.problem_type_id = problem_type_id;
	}

	public String getProblem_type_id() {
		return this.problem_type_id;
	}

	public void setKnowledge_id(String knowledge_id) {
		this.knowledge_id = knowledge_id;
	}

	public String getKnowledge_id() {
		return this.knowledge_id;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getContent() {
		return this.content;
	}

	public void setOption_num(String option_num) {
		this.option_num = option_num;
	}

	public String getOption_num() {
		return this.option_num;
	}

	public void setOption_content(String option_content) {
		this.option_content = option_content;
	}

	public String getOption_content() {
		return this.option_content;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getAnswer() {
		return this.answer;
	}

	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}

	public String getDifficulty() {
		return this.difficulty;
	}

	public void setAnalysis(String analysis) {
		this.analysis = analysis;
	}

	public String getAnalysis() {
		return this.analysis;
	}

	public void setQuestion_from(String question_from) {
		this.question_from = question_from;
	}

	public String getQuestion_from() {
		return this.question_from;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public String getScore() {
		return this.score;
	}

	public void setPart_score(String part_score) {
		this.part_score = part_score;
	}

	public String getPart_score() {
		return this.part_score;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getRank() {
		return this.rank;
	}

	public void setNo_name(String no_rank) {
		this.no_name = no_rank;
	}

	public String getNo_name() {
		return this.no_name;
	}

	public void setSug_score(String sug_score){
		this.sug_score = sug_score ;
	}
	public void setSug_part_score(String sug_part_score){
		this.sug_part_score = sug_part_score ;
	}
	
	public String getSug_score(){
		return this.sug_score;
	}
	public String getSug_part_score(){
		return this.sug_part_score;
	}
	
	
	
	public String getQuestion_id() {
		return question_id;
	}

	public void setQuestion_id(String question_id) {
		this.question_id = question_id;
	}

	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}

	public List<Question> getQuestions() {
		return this.questions;
	}

	public String getQuestionType() {
		return questionType;
	}

	public void setQuestionType(String questionType) {
		this.questionType = questionType;
	}

	
}
