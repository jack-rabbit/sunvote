package com.fh.bean;

import java.util.List;

import com.google.gson.Gson;

public class Point {

	private String code ;
	
	private String name; 
	
	private String subjectCode;
	
	private List<Point> children ;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Point> getChildren() {
		return children;
	}

	public void setChildren(List<Point> children) {
		this.children = children;
	}
	
	
	
	public String getSubjectCode() {
		return subjectCode;
	}

	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}

	public static Point parse(String json){
		Gson gson = new Gson();
		return gson.fromJson(json, Point.class);
	}
	
	public String toJson(){
		Gson gson = new Gson();
		return gson.toJson(this);
	}
}
