package com.fh.controller.api;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import com.fh.bean.Point;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;

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
		Gson gson =  new GsonBuilder().serializeNulls().create(); 
		return gson.toJson(this);
	}
	
	public String toBrifJson(){
		Gson gson =  new Gson(); 
		return gson.toJson(this);
	}

	@Override
	public String toString() {
		return "ResponseGson [code=" + code + ", message=" + message
				+ ", data=" + data + "]";
	}
	
	public static <T> ResponseGson<T> parse(String json) {
		Gson gson = new Gson();
		Type objectType = new TypeToken<ResponseGson<T>>() {}.getType();  
		return gson.fromJson(json, objectType);
	}
	
	public static <T> ResponseGson<T> parse(String json,Class clazz) {
		Gson gson = new Gson();
		if(clazz == Point.class){
			Type objectType = new TypeToken<ResponseGson<List<Point>>>() {}.getType();  
			return gson.fromJson(json, objectType);
		}
		return null;
	}
	
	
	
	 static ParameterizedType type(final Class raw, final Type... args) {
	        return new ParameterizedType() {
	            public Type getRawType() {
	                return raw;
	            }

	            public Type[] getActualTypeArguments() {
	                return args;
	            }

	            public Type getOwnerType() {
	                return null;
	            }
	        };
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
