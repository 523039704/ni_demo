package com.demo.contaller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.basic.util.DateUtil;
import com.demo.model.Productinfo;
import com.demo.model.Wxconfig;
import com.sdk.api.ApiConfig;
import com.sdk.api.ApiResult;
import com.sdk.api.UserApi;
import com.sdk.jfinal.ApiController;


public class Wxappcontroller extends ApiController{

	@Override
	public ApiConfig getApiConfig() {
		Wxconfig wxconfig = Wxconfig.dao.getWxconfig();
		
		ApiConfig ac = new ApiConfig();
		// 配置微信 API 相关常量
		ac.setToken(wxconfig.getStr("token"));
		ac.setAppId(wxconfig.getStr("appId"));
		ac.setAppSecret(wxconfig.getStr("appSecret"));
		
		/**
		 *  是否对消息进行加密，对应于微信平台的消息加解密方式：
		 *  1：true进行加密且必须配置 encodingAesKey
		 *  2：false采用明文模式，同时也支持混合模式
		 */
		Boolean bool = wxconfig.getInt("encryptMessage")==1?true:false;
		ac.setEncryptMessage(bool);
		ac.setEncodingAesKey(wxconfig.getStr("encodingAesKey"));
		return ac;
	}
	
	//首页
	public void index() {
		ApiResult userinfo = UserApi.getUserInfo("ocn2vjpd7NAMZWMEL-otYcJV4Vxo");
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("subscribe",userinfo.getInt("subscribe"));
		map.put("openid",userinfo.get("openid"));
		map.put("nickname",userinfo.get("nickname"));
		map.put("sex",userinfo.getInt("sex")==2?"女":"男");
		map.put("language",userinfo.get("language"));
		map.put("city",userinfo.get("city"));
		map.put("province",userinfo.get("province"));
		map.put("country",userinfo.get("country"));
		map.put("headimgurl",userinfo.get("headimgurl"));
		DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println(userinfo.get("subscribe_time"));
		Long time = new Long(userinfo.get("subscribe_time").toString());
		System.out.println(new Date(time));
		map.put("subscribe_time",sdf.format(new Date(time)));
//		map.put("subscribe_time",sdf.format(Date.parse(userinfo.get("subscribe_time").toString())));
		map.put("remark",userinfo.get("remark"));
		map.put("groupid",userinfo.getInt("groupid"));
		List<Productinfo> productinfo = Productinfo.dao.find("select * from product");
		setAttr("info", productinfo);
		setAttr("user", map);
		
		render("index.jsp");
	}
	
	//申请代理商
	public void sqdls() {
		
		render("sqdls.jsp");
	}
	
	//我的二维码
	public void qrcode() {
		String openId = getPara("openId");
		ApiResult userinfo = UserApi.getUserInfo(openId);
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("subscribe",userinfo.getInt("subscribe"));
		map.put("openid",userinfo.get("openid"));
		map.put("nickname",userinfo.get("nickname"));
		map.put("sex",userinfo.getInt("sex")==2?"女":"男");
		map.put("language",userinfo.get("language"));
		map.put("city",userinfo.get("city"));
		map.put("province",userinfo.get("province"));
		map.put("country",userinfo.get("country"));
		map.put("headimgurl",userinfo.get("headimgurl"));
		this.CreateDecode(userinfo.get("headimgurl").toString(),userinfo.get("openid").toString());
		System.out.println(DateUtil.makeLongTime((Long)userinfo.get("subscribe_time")));
		map.put("subscribe_time",DateUtil.makeLongTime((Long)userinfo.get("subscribe_time")));
		map.put("remark",userinfo.get("remark"));
		map.put("groupid",userinfo.getInt("groupid"));
		
		setAttr("user", map);
		
		render("qrcode.jsp");
	}

	/**
	  * 创建二维码
	  */
	 public void CreateDecode(String img,String qrname) {  
		 System.out.println("------------开始创建二维码--------------------");
		 
		 UserApi.encoderQRCode("http://1.ftezu.net/app/index", "D:/JspStudy/WWW/zwx/qrcode/"+qrname+".jpg");
//		 UserApi.encoderQRCode("http://1.ftezu.net/app/index", "G:/apache-tomcat-7.0.52/webapps/weixin/qrcode/"+qrname+".jpg");
		 System.out.println("二维码创建成功！");  
	 }
	
}
