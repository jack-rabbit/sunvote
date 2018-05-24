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
	
	public void setPathError(){
		code = "-2" ;
		message = "Path error" ;
	}
	
	public void setDataError(){
		code = "-3" ;
		message = "Data error" ;
	}
	public void setParmError(){
		code = "-4" ;
		message = "Parm error" ;
	}
	public void setError(){
		code = "-5" ;
		message = "server error" ;
	}
	
	public void setOtherError(){
		code = "-6" ;
		message = "未定义，需补充" ;
	}
	
	public void set1Error(){
		code = "1" ;
		message = "登录失败，用户名或者密码错误" ;
	}
	
	public void set2Error(){
		code = "2" ;
		message = "没有找到对应的班级信息" ;
	}
	
	public void set3Error(){
		code = "3" ;
		message = "分别对错误进行描述，1 具体到某个参数值问题的描述" ;
	}
	
	public void set4Error(){
		code = "4" ;
		message = "分别对错误进行描述，1 具体到某个参数值问题的描述" ;
	}
	
	
}
