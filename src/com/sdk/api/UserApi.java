/**
 * Copyright (c) 2011-2014, James Zhan 詹波 (jfinal@126.com).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

package com.sdk.api;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;

import com.google.gson.Gson;
import com.jfinal.kit.HttpKit;
import com.sdk.kit.ParaMap;


/**
 * 用户管理 API
 * https://api.weixin.qq.com/cgi-bin/user/info?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN
 */
public class UserApi {
	
	private static String getUserInfo = "https://api.weixin.qq.com/cgi-bin/user/info";
	private static String getFollowers = "https://api.weixin.qq.com/cgi-bin/user/get";
	
	public static ApiResult getUserInfo(String openId) {
		ParaMap pm = ParaMap.create("access_token", AccessTokenApi.getAccessToken().getAccessToken()).put("openid", openId).put("lang", "zh_CN");
		return new ApiResult(HttpKit.get(getUserInfo, pm.getData()));
	}
	
	public static ApiResult getFollowers(String nextOpenid) {
		ParaMap pm = ParaMap.create("access_token", AccessTokenApi.getAccessToken().getAccessToken());
		if (nextOpenid != null)
			pm.put("next_openid", nextOpenid);
		return new ApiResult(HttpKit.get(getFollowers, pm.getData()));
	}
	
	public static ApiResult getFollows() {
		return getFollowers(null);
	}
	
	
	/*
	 * 创建二维码
	 * */
	public static ResponseDCode createDCode(String scene_id, String accessToken){
		
		/*得到urlConnection*/
		HttpURLConnection urlConnection = null;
		
		StringBuffer strb = null;
		
		OutputStream out = null;
		
		OutputStreamWriter writer = null;
		
		BufferedWriter bwriter = null;
		
		InputStream in = null;
		
		InputStreamReader reader = null;
		
		BufferedReader breader = null;
		
		try {
			
			/*得到url*/
			URL url = new URL("https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token="+accessToken);
			
			/*打开连接*/
			urlConnection = (HttpURLConnection)url.openConnection();
			urlConnection.setDoOutput(true);
			urlConnection.setRequestMethod("POST");
			
			out = urlConnection.getOutputStream();
			
			/*urlConnection write*/
			writer = new OutputStreamWriter(out,"UTF-8");
			
			bwriter = new BufferedWriter(writer);
			
			bwriter.write(getStr(scene_id));
			
			bwriter.flush();
			
			
			/*urlConnection reader*/
			in = urlConnection.getInputStream();
			
			reader = new InputStreamReader(in);
			
			breader = new BufferedReader(reader);
			
			String str = null;
			
			strb = new StringBuffer();
			
			while(null!=(str = breader.readLine())){
				
				strb.append(str);
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			
			out.close();
			
			writer.close();
			
			bwriter.close();
					
			in.close();
			
			reader.close();
			
			breader.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		if(null != urlConnection){
			
			urlConnection.disconnect();
			
		}
		
		Gson gson = new Gson();
		
		return gson.fromJson(strb.toString(), ResponseDCode.class);
		
	}
	
	
	/*请求报文*/
	private static String getStr(String scene_id){
		
		return "{\"action_name\": \"QR_LIMIT_SCENE\", \"action_info\": {\"scene\": {\"scene_id\": "+scene_id+"}}}";
		
	}
	
	/*通过ticket换取*/
	public static void getDCode(ResponseDCode responseDCode , String str){
		
		HttpsURLConnection urlConnection = null;
		
		try {
			
			/*得到连接*/
			URL url = new URL("https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket="+responseDCode.getTicket());
			
			urlConnection = (HttpsURLConnection)url.openConnection();
			
			urlConnection.connect();
			
			/*urlConnection read*/
			InputStream in = urlConnection.getInputStream();
			
			BufferedInputStream bin = new BufferedInputStream(in);
			
			/*file write*/
			File file = new File(str);
			
			FileOutputStream fout = new FileOutputStream(file);
			
			int x = -1;
			
			byte[] b = new byte[1024];
			
			while(-1 != (x = bin.read(b))){
				
				fout.write(b , 0 , x);
				fout.flush();
			}
			
			fout.flush();
			
			fout.close();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(null != urlConnection){
			
			urlConnection.disconnect();
			
		}
		
	}
}
