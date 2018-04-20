package com.fh.controller.api;

import com.google.gson.Gson;

public class ResponseGson<T> {

	private String code = "0";

	private String message = "success";

	private T data;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
	
	public String toJson(){
		Gson gson = new Gson();
		return gson.toJson(this);
	}

	@Override
	public String toString() {
		return "ResponseGson [code=" + code + ", message=" + message
				+ ", data=" + data + "]";
	}
	
	
	public void setSuccess(){
		code = "0" ;
		message = "success" ;
	}
	
	public void setNetError(){
		code = "-1" ;
		message = "net error" ;
	}
	
	public void setDataError(){
		code = "-2" ;
		message = "Data error" ;
	}
}
