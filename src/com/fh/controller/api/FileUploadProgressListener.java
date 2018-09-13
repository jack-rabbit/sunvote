package com.fh.controller.api;

import java.util.HashMap;

import org.apache.commons.fileupload.ProgressListener;

public class FileUploadProgressListener implements ProgressListener {
	
	public static HashMap<String,HashMap<String,String>> map = new HashMap();
	private String ip ;
	private long last = 0 ;
	private HashMap<String,String> ipMap;
	private String key ;

	@Override
	public void update(long pBytesRead, long pContentLength, int pItems) {
		if(!"127.0.0.1".equals(ip)){
			ipMap.put(key,"" +  ((pBytesRead * 1000.0) / (System.currentTimeMillis() - last)));
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
