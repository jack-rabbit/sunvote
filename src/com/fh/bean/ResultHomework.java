package com.fh.bean;

import java.util.List;

import com.google.gson.Gson;

public class ResultHomework {

	private String HOMEWORK_ID;
	private String CLASS_ID;
	private String GET_SCORE;
	private String GET_SCORE_PERSENT;
	private String COMPLETE_DESC;
	private String GET_MAX_SCORE;
	private String ANSWER_PERSENT;
	private List<ResultStudent> STUDENTS;

	public void setHOMEWORK_ID(String HOMEWORK_ID) {
		this.HOMEWORK_ID = HOMEWORK_ID;
	}

	public String getHOMEWORK_ID() {
		return HOMEWORK_ID;
	}

	public void setCLASS_ID(String CLASS_ID) {
		this.CLASS_ID = CLASS_ID;
	}

	public String getCLASS_ID() {
		return CLASS_ID;
	}

	public void setGET_SCORE(String GET_SCORE) {
		this.GET_SCORE = GET_SCORE;
	}

	public String getGET_SCORE() {
		return GET_SCORE;
	}

	public void setGET_SCORE_PERSENT(String GET_SCORE_PERSENT) {
		this.GET_SCORE_PERSENT = GET_SCORE_PERSENT;
	}

	public String getGET_SCORE_PERSENT() {
		return GET_SCORE_PERSENT;
	}

	public void setCOMPLETE_DESC(String COMPLETE_DESC) {
		this.COMPLETE_DESC = COMPLETE_DESC;
	}

	public String getCOMPLETE_DESC() {
		return COMPLETE_DESC;
	}

	public void setGET_MAX_SCORE(String GET_MAX_SCORE) {
		this.GET_MAX_SCORE = GET_MAX_SCORE;
	}

	public String getGET_MAX_SCORE() {
		return GET_MAX_SCORE;
	}

	public void setSTUDENTS(List<ResultStudent> STUDENTS) {
		this.STUDENTS = STUDENTS;
	}

	public List<ResultStudent> getSTUDENTS() {
		return STUDENTS;
	}
	
	
	
	public String getANSWER_PERSENT() {
		return ANSWER_PERSENT;
	}

	public void setANSWER_PERSENT(String aNSWER_PERSENT) {
		ANSWER_PERSENT = aNSWER_PERSENT;
	}

	public static ResultHomework parse(String json){
		Gson gson = new Gson();
		return gson.fromJson(json, ResultHomework.class);
	}

	public static class ResultStudent {
		private String STUDENT_NO;
		private String STUDENT_ID;
		public String getSTUDENT_ID() {
			return STUDENT_ID;
		}

		public void setSTUDENT_ID(String sTUDENT_ID) {
			STUDENT_ID = sTUDENT_ID;
		}

		private String STUDENT_NAME;
		private String KEYBOARD;
		private String RIGHT_PERSENT;
		private String GET_SCORE;
		private String RANK;
		private String ANSWER;

		public void setSTUDENT_NO(String STUDENT_NO) {
			this.STUDENT_NO = STUDENT_NO;
		}

		public String getSTUDENT_NO() {
			return STUDENT_NO;
		}

		public void setSTUDENT_NAME(String STUDENT_NAME) {
			this.STUDENT_NAME = STUDENT_NAME;
		}

		public String getSTUDENT_NAME() {
			return STUDENT_NAME;
		}

		public void setKEYBOARD(String KEYBOARD) {
			this.KEYBOARD = KEYBOARD;
		}

		public String getKEYBOARD() {
			return KEYBOARD;
		}

		public void setRIGHT_PERSENT(String RIGHT_PERSENT) {
			this.RIGHT_PERSENT = RIGHT_PERSENT;
		}

		public String getRIGHT_PERSENT() {
			return RIGHT_PERSENT;
		}

		public void setGET_SCORE(String GET_SCORE) {
			this.GET_SCORE = GET_SCORE;
		}

		public String getGET_SCORE() {
			return GET_SCORE;
		}

		public void setRANK(String RANK) {
			this.RANK = RANK;
		}

		public String getRANK() {
			return RANK;
		}

		public void setANSWER(String ANSWER) {
			this.ANSWER = ANSWER;
		}

		public String getANSWER() {
			return ANSWER;
		}
	}
}
