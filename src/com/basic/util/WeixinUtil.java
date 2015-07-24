package com.basic.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.ConnectException;
import java.net.URL;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.util.HashMap;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;

import net.sf.json.JSONException;
import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;



/**
 * 公众平台通用接口工具类
 * 
 * @date 2013-08-09
 */
public class WeixinUtil {
	
	private static Logger log = LoggerFactory.getLogger(WeixinUtil.class);
	
	// 获取access_token的接口地址（GET） 限200（次/天）
	public final static String access_token_url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";
	
	// 菜单创建（POST） 限100（次/天）
	public static String menu_create_url = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=ACCESS_TOKEN";
	//查询菜单
	public static String menu_get_url = "https://api.weixin.qq.com/cgi-bin/menu/get?access_token=ACCESS_TOKEN";
	//删除菜单
	public static String menu_delete_url = "https://api.weixin.qq.com/cgi-bin/menu/delete?access_token=ACCESS_TOKEN";

	/**
	 * 发起https请求并获取结果
	 * 
	 * @param requestUrl 请求地址
	 * @param requestMethod 请求方式（GET、POST）
	 * @param outputStr 提交的数据
	 * @return JSONObject(通过JSONObject.get(key)的方式获取json对象的属性值)
	 */
	public static JSONObject httpRequest(String requestUrl, String requestMethod, String outputStr) {
		JSONObject jsonObject = null;
		StringBuffer buffer = new StringBuffer();
		try {
			// 创建SSLContext对象，并使用我们指定的信任管理器初始化
			TrustManager[] tm = { new MyX509TrustManager() };
			SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");
			sslContext.init(null, tm, new java.security.SecureRandom());
			// 从上述SSLContext对象中得到SSLSocketFactory对象
			SSLSocketFactory ssf = sslContext.getSocketFactory();

			URL url = new URL(requestUrl);
			HttpsURLConnection httpUrlConn = (HttpsURLConnection) url.openConnection();
			httpUrlConn.setSSLSocketFactory(ssf);

			httpUrlConn.setDoOutput(true);
			httpUrlConn.setDoInput(true);
			httpUrlConn.setUseCaches(false);
			// 设置请求方式（GET/POST）
			httpUrlConn.setRequestMethod(requestMethod);

			if ("GET".equalsIgnoreCase(requestMethod))
				httpUrlConn.connect();

			// 当有数据需要提交时
			if (null != outputStr) {
				OutputStream outputStream = httpUrlConn.getOutputStream();
				// 注意编码格式，防止中文乱码
				outputStream.write(outputStr.getBytes("UTF-8"));
				outputStream.close();
			}

			// 将返回的输入流转换成字符串
			InputStream inputStream = httpUrlConn.getInputStream();
			InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
			BufferedReader bufferedReader = new BufferedReader(inputStreamReader);

			String str = null;
			while ((str = bufferedReader.readLine()) != null) {
				buffer.append(str);
			}
			bufferedReader.close();
			inputStreamReader.close();
			// 释放资源
			inputStream.close();
			inputStream = null;
			httpUrlConn.disconnect();
			jsonObject = JSONObject.fromObject(buffer.toString());
		} catch (ConnectException ce) {
			log.error("Weixin server connection timed out.");
		} catch (Exception e) {
			log.error("https request error:{}", e);
		}
		return jsonObject;
	}
	

	public static String  menuJson3() {

		String appId ="wxfbd2343244a670474";
		//String urlCompany = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appId+"&redirect_uri=http://www.zuodeng.com/kuaihuo/home/company/&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
		//String urlDriver = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appId+"&" +"redirect_uri=http://www.zuodeng.com/kuaihuo/home/driver/&" +"response_type=code&scope=snsapi_base&state=1#wechat_redirect";		
		String urlCompany = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appId+"&redirect_uri=http://test.com/supplier/home/supplier&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
		String urlDriver = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appId+"&" +"redirect_uri=http://test.com/supplier/home/driver&response_type=code&scope=snsapi_base&state=1#wechat_redirect";		
		
		
		

		
		String menuJson = "{" +
		     "\"button\":[" +
		     "{	" +
		     "\"type\":\"view\"," +
		     "\"name\":\"供应商\"," +
		     "\"url\":\""+urlCompany+ "\"}," +
			  "{	" +
			"\"type\":\"view\"," +
			"\"name\":\"司机\"," +
			"\"url\":\""+urlDriver+"\"}," +
		      "{" +
		    	  "\"type\":\"view\"," +
		    	  "\"name\":\"大区经理\"," +
		    	  "\"url\":\"http://test.com/supplier/home/test\"" +
		       "}]" +
		 "}";
		return menuJson;
	}
    
}
