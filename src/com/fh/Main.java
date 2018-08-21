package com.fh;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class Main {

	public static void main(String[] args) {
		
		String username = "pressure_test" ;
		String password = "123456" ;
		String trueName = "" ;
		
		String url = "http://127.0.0.1:8080/SunvoteEducation/api/v1/tempcreateUser" ;
		for(int i = 2 ; i <= 100 ; i++){
			trueName = username + i ;
			String keypadid = "0000" ;
			if(i >= 100){
				keypadid = keypadid + i ;
			}else if(i > 9){
				keypadid = keypadid + "0" + i ;
			}else{
				keypadid = keypadid + "00" + i ;
			}
			post(url + "?ACCOUT=" + trueName + "&password=" + password + "&SCHOOL_ID=4" + "&SEX=1" + "&NAME=" + trueName + "&KEYPAD_ID=" + keypadid);
		}

	}

	
	
	static void post(String url){
		try {
		    //请求地址
		    URL urlHttp = new URL(url);

		    // 将url 以 open方法返回的urlConnection  连接强转为HttpURLConnection连接  (标识一个url所引用的远程对象连接)
		    HttpURLConnection connection = (HttpURLConnection) urlHttp.openConnection();// 此时cnnection只是为一个连接对象,待连接中
		    // 设置连接输出流为true,默认false (post 请求是以流的方式隐式的传递参数)
		    connection.setDoOutput(true);

		    // 设置连接输入流为true
		    connection.setDoInput(true);

		    // 设置请求方式为post
		    connection.setRequestMethod("POST");

		    // post请求缓存设为false
		    connection.setUseCaches(false);

		    // 设置该HttpURLConnection实例是否自动执行重定向
		    connection.setInstanceFollowRedirects(true);

		    // 设置请求头里面的各个属性 (以下为设置内容的类型,设置为经过urlEncoded编码过的from参数)
		    // application/x-javascript text/xml->xml数据 application/x-javascript->json对象 application/x-www-form-urlencoded->表单数据
		    // ;charset=utf-8 必须要，不然妙兜那边会出现乱码【★★★★★】
		    connection.setRequestProperty("Content-Type", "application/x-javascript;charset=utf-8");

		    connection.connect();


		    // 连接发起请求,处理服务器响应  (从连接获取到输入流并包装为bufferedReader)
		    BufferedReader bf = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
		    String line;
		    StringBuilder sb = new StringBuilder(); // 用来存储响应数据

		    // 循环读取流,若不到结尾处
		    while ((line = bf.readLine()) != null) {
		        sb.append(line).append(System.getProperty("line.separator"));
		    }
		    bf.close();    // 重要且易忽略步骤 (关闭流,切记!)
		    connection.disconnect(); // 销毁连接

		
		} catch (Exception e) {
		    e.printStackTrace();
		}
	}
}
