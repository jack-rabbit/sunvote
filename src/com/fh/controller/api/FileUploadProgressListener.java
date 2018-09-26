package com.fh.controller.api;

import java.util.HashMap;

import org.apache.commons.fileupload.ProgressListener;

public class FileUploadProgressListener implements ProgressListener {
	
	public static HashMap<String,HashMap<String,String>> map = new HashMap(200);
	
	public static int count = 0;
//	static{
//		HashMap<String,String> temp = new HashMap<String,String>();
//		temp.put("0", "1545");
//		map.put("192.168.0.2",temp );
//		map.put("192.168.0.3", temp);
//		map.put("192.168.0.4", temp);
//		map.put("192.168.0.5", temp);
//		map.put("192.168.0.6", temp);
//	}
	
	public static HashMap<String,Boolean> result = new HashMap(200);
	private String ip ;
	private long last = 0 ;
	private HashMap<String,String> ipMap;
	private String key ;

	@Override
	public void update(long pBytesRead, long pContentLength, int pItems) {
		if(!"127.0.0.1".equals(ip)){
			ipMap.put(key,String.format("%.2f", ((pBytesRead * 1000.0) / (System.currentTimeMillis() - last))));
			result.put(ip +":"+ key,  pBytesRead == pContentLength);
		}
	}
	
	public void setIp(String ip) {
		this.ip = ip;
		last = System.currentTimeMillis();
		if (map.get(ip) == null) {
			ipMap = new HashMap<String, String>();
			map.put(ip, ipMap);
		} else {
			ipMap = map.get(ip);
		}
		for (int i = 0;; i++) {
			String tkey = "" + i;
			if (ipMap.get(tkey) == null) {
				key = tkey;
				break;
			}
		}
	}

}
