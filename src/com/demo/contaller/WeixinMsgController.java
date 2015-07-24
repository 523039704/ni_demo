/**
 * Copyright (c) 2011-2014, James Zhan 詹波 (jfinal@126.com).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

package com.demo.contaller;

import com.basic.util.DateUtil;
import com.demo.model.Userinfo;
import com.demo.model.Usermessagerinfo;
import com.demo.model.Wxconfig;
import com.demo.model.Wxtokeninfo;
import com.sdk.api.AccessToken;
import com.sdk.api.AccessTokenApi;
import com.sdk.api.ApiConfig;
import com.sdk.api.ApiConfigKit;
import com.sdk.api.ApiResult;
import com.sdk.api.UserApi;
import com.sdk.jfinal.MsgController;
import com.sdk.msg.in.InImageMsg;
import com.sdk.msg.in.InLinkMsg;
import com.sdk.msg.in.InLocationMsg;
import com.sdk.msg.in.InTextMsg;
import com.sdk.msg.in.InVideoMsg;
import com.sdk.msg.in.InVoiceMsg;
import com.sdk.msg.in.event.InFollowEvent;
import com.sdk.msg.in.event.InLocationEvent;
import com.sdk.msg.in.event.InMenuEvent;
import com.sdk.msg.in.event.InQrCodeEvent;
import com.sdk.msg.in.speech_recognition.InSpeechRecognitionResults;
import com.sdk.msg.out.OutImageMsg;
import com.sdk.msg.out.OutMusicMsg;
import com.sdk.msg.out.OutNewsMsg;
import com.sdk.msg.out.OutTextMsg;
import com.sdk.msg.out.OutVoiceMsg;


/**
 * 将此 DemoController 在YourJFinalConfig 中注册路由，
 * 并设置好weixin开发者中心的 URL 与 token ，使 URL 指向该
 * DemoController 继承自父类 WeixinController 的 index
 * 方法即可直接运行看效果，在此基础之上修改相关的方法即可进行实际项目开发
 */
public class WeixinMsgController extends MsgController {
	
	private static final String helpStr = "\t发送 help 可获得帮助，发送 \"美女\" 可看美女，发送 news 可看新闻，发送 music 可听音乐，你还可以试试发送图片、语音、位置、收藏等信息，看会有什么 。公众号持续更新中，想要更多惊喜欢迎每天关注 ^_^";
	
	/**
	 * 如果要支持多公众账号，只需要在此返回各个公众号对应的  ApiConfig 对象即可
	 * 可以通过在请求 url 中挂参数来动态从数据库中获取 ApiConfig 属性值
	 */
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
	
	/**
	 * 实现父类抽方法，处理文本消息
	 * 本例子中根据消息中的不同文本内容分别做出了不同的响应，同时也是为了测试 jfinal weixin sdk的基本功能：
	 *     本方法仅测试了 OutTextMsg、OutNewsMsg、OutMusicMsg 三种类型的OutMsg，
	 *     其它类型的消息会在随后的方法中进行测试
	 */
	protected void processInTextMsg(InTextMsg inTextMsg) {
		String msgContent = inTextMsg.getContent().trim();
		// 帮助提示
		if ("help".equalsIgnoreCase(msgContent)) {
			OutTextMsg outMsg = new OutTextMsg(inTextMsg);
			outMsg.setContent(helpStr);
			render(outMsg);
		}
		// 图文消息测试
		else if ("news".equalsIgnoreCase(msgContent)) {
			OutNewsMsg outMsg = new OutNewsMsg(inTextMsg);
			outMsg.addNews("JFinal 1.8 发布，JAVA 极速 WEB+ORM 框架", "现在就加入 JFinal 极速开发世界，节省更多时间去跟女友游山玩水 ^_^", "http://mmbiz.qpic.cn/mmbiz/zz3Q6WSrzq1ibBkhSA1BibMuMxLuHIvUfiaGsK7CC4kIzeh178IYSHbYQ5eg9tVxgEcbegAu22Qhwgl5IhZFWWXUw/0", "http://mp.weixin.qq.com/s?__biz=MjM5ODAwOTU3Mg==&mid=200313981&idx=1&sn=3bc5547ba4beae12a3e8762ababc8175#rd");
			outMsg.addNews("JFinal 1.6 发布,JAVA极速WEB+ORM框架", "JFinal 1.6 主要升级了 ActiveRecord 插件，本次升级全面支持多数源、多方言、多缓", "http://mmbiz.qpic.cn/mmbiz/zz3Q6WSrzq0fcR8VmNCgugHXv7gVlxI6w95RBlKLdKUTjhOZIHGSWsGvjvHqnBnjIWHsicfcXmXlwOWE6sb39kA/0", "http://mp.weixin.qq.com/s?__biz=MjM5ODAwOTU3Mg==&mid=200121522&idx=1&sn=ee24f352e299b2859673b26ffa4a81f6#rd");
			render(outMsg);
		}
		// 音乐消息测试
		else if ("music".equalsIgnoreCase(msgContent)) {
			OutMusicMsg outMsg = new OutMusicMsg(inTextMsg);
			outMsg.setTitle("Listen To Your Heart");
			outMsg.setDescription("建议在 WIFI 环境下流畅欣赏此音乐");
			outMsg.setMusicUrl("http://www.jfinal.com/Listen_To_Your_Heart.mp3");
			outMsg.setHqMusicUrl("http://www.jfinal.com/Listen_To_Your_Heart.mp3");
			outMsg.setFuncFlag(true);
			render(outMsg);
		}
		else if ("美女".equalsIgnoreCase(msgContent)) {
			OutNewsMsg outMsg = new OutNewsMsg(inTextMsg);
			outMsg.addNews("我们只看美女", "又一大波美女来袭，我们只看美女 ^_^", "https://mmbiz.qlogo.cn/mmbiz/zz3Q6WSrzq3DmIGiadDEicRIp69r1iccicwKEUOKuLhYgjibyU96ia581gCf5o3kicqz6ZLdsDyUtLib0q0hdgHtZOf4Wg/0", "http://mp.weixin.qq.com/s?__biz=MjM5ODAwOTU3Mg==&mid=202080887&idx=1&sn=0649c67de565e2d863bf3b8feee24da0#rd");
			
			render(outMsg);
		}
		// 其它文本消息直接返回原值 + 帮助提示
		else {
			OutTextMsg outMsg = new OutTextMsg(inTextMsg);
			outMsg.setContent("\t文本消息已成功接收，内容为： " + inTextMsg.getContent() + "\n\n" + helpStr);
			render(outMsg);
		}
	}
	
	/**
	 * 实现父类抽方法，处理图片消息
	 */
	protected void processInImageMsg(InImageMsg inImageMsg) {
		OutImageMsg outMsg = new OutImageMsg(inImageMsg);
		// 将刚发过来的图片再发回去
		outMsg.setMediaId(inImageMsg.getMediaId());
		render(outMsg);
	}
	
	/**
	 * 实现父类抽方法，处理语音消息
	 */
	protected void processInVoiceMsg(InVoiceMsg inVoiceMsg) {
		OutVoiceMsg outMsg = new OutVoiceMsg(inVoiceMsg);
		// 将刚发过来的语音再发回去
		outMsg.setMediaId(inVoiceMsg.getMediaId());
		render(outMsg);
	}
	
	/**
	 * 实现父类抽方法，处理视频消息
	 */
	protected void processInVideoMsg(InVideoMsg inVideoMsg) {
		/* 腾讯 api 有 bug，无法回复视频消息，暂时回复文本消息代码测试
		OutVideoMsg outMsg = new OutVideoMsg(inVideoMsg);
		outMsg.setTitle("OutVideoMsg 发送");
		outMsg.setDescription("刚刚发来的视频再发回去");
		// 将刚发过来的视频再发回去，经测试证明是腾讯官方的 api 有 bug，待 api bug 却除后再试
		outMsg.setMediaId(inVideoMsg.getMediaId());
		render(outMsg);
		*/
		OutTextMsg outMsg = new OutTextMsg(inVideoMsg);
		outMsg.setContent("\t视频消息已成功接收，该视频的 mediaId 为: " + inVideoMsg.getMediaId());
		render(outMsg);
	}
	
	/**
	 * 实现父类抽方法，处理地址位置消息
	 */
	protected void processInLocationMsg(InLocationMsg inLocationMsg) {
		OutTextMsg outMsg = new OutTextMsg(inLocationMsg);
		outMsg.setContent("已收到地理位置消息:" +
							"\nlocation_X = " + inLocationMsg.getLocation_X() +
							"\nlocation_Y = " + inLocationMsg.getLocation_Y() + 
							"\nscale = " + inLocationMsg.getScale() +
							"\nlabel = " + inLocationMsg.getLabel());
		render(outMsg);
	}
	
	/**
	 * 实现父类抽方法，处理链接消息
	 * 特别注意：测试时需要发送我的收藏中的曾经收藏过的图文消息，直接发送链接地址会当做文本消息来发送
	 */
	protected void processInLinkMsg(InLinkMsg inLinkMsg) {
		OutNewsMsg outMsg = new OutNewsMsg(inLinkMsg);
		outMsg.addNews("链接消息已成功接收", "链接使用图文消息的方式发回给你，还可以使用文本方式发回。点击图文消息可跳转到链接地址页面，是不是很好玩 :)" , "http://mmbiz.qpic.cn/mmbiz/zz3Q6WSrzq1ibBkhSA1BibMuMxLuHIvUfiaGsK7CC4kIzeh178IYSHbYQ5eg9tVxgEcbegAu22Qhwgl5IhZFWWXUw/0", inLinkMsg.getUrl());
		render(outMsg);
	}
	
	/**
	 * 实现父类抽方法，处理关注/取消关注消息
	 */
	protected void processInFollowEvent(InFollowEvent inFollowEvent) {//这个就是通过在微信段搜索关键字 所要调用的代码。 具体的逻辑代码自己可以研究一下 都是一些逻辑代码了 并不是很复杂
		
		InFollowEvent in=inFollowEvent;//对加入进来的用户进行添加操作
		//事件类型，subscribe(订阅)、unsubscribe(取消订阅)
		Wxconfig wxconfig = Wxconfig.dao.getWxconfig();
		String openId =in.getFromUserName();
		if(in.getEvent().toString().equals("subscribe"))
		{
			String uid=Wxtokeninfo.dao.insert_openid(openId);
			setCookie("openid", openId, 3600);
			
			ApiConfig ac = new ApiConfig();
			ac.setAppId(wxconfig.getStr("appId"));
			ac.setAppSecret(wxconfig.getStr("appSecret"));
			ApiConfigKit.setThreadLocalApiConfig(ac);
			
			AccessToken at =AccessTokenApi. getAccessToken();
			String path="C:/virtualhost/weixin/ROOT/qrcode/" + openId + ".jpg";
		 
			this.CreateDecode(uid,at.getAccessToken(), openId,path); 	
			Wxtokeninfo.dao.findById(uid).set("codeurl", "http://22.ftezu.net/qrcode/" + openId + ".jpg").update();	
			
			ApiResult userinfo = UserApi.getUserInfo(openId);//页面授权获取  openid
	   		 String subscribe=  userinfo.getInt("subscribe").toString(); 
	   		 String nickname= userinfo.get("nickname").toString();
	   		 String sex =userinfo.getInt("sex").toString();
	   		 String language= userinfo.get("language").toString();
	   		 String city = userinfo.get("city").toString();
	   		 String province= userinfo.get("province").toString();
	   		 String country= userinfo.get("country").toString();
	   		 String headimgurl= userinfo.get("headimgurl").toString();
	   		 String subscribe_time=DateUtil.getDateStringBySeparator();
	   		 String remark= userinfo.get("remark").toString();
	   		 String groupid=  userinfo.getInt("groupid").toString();
	   		 Usermessagerinfo.dao.insert(uid,subscribe, nickname, sex, language, city, province, country, headimgurl, subscribe_time, remark, groupid,"0"); //角色   可从属关系不填写 都是从客户往上增加的
		}else
		{
			String uid=Wxtokeninfo.dao.findFirst("select * from wxtoken where openid='"+openId+"'").get("id").toString();
			Wxtokeninfo.dao.findById(uid).delete();
			Usermessagerinfo.dao.findById(uid).delete();
			Userinfo.dao.findById(uid).delete();
		}
		OutTextMsg outMsg = new OutTextMsg(inFollowEvent);
		outMsg.setContent("欢迎您加入这个大家庭 成为我们系统的业务员，我们将诚挚为您服务  谢谢！！您可以点击申请按钮注册信息成为我们的后台用户注册完成之后系统会给您分配账号和密码" );
		// 如果为取消关注事件，将无法接收到传回的信息
		render(outMsg);
	}
	
	/**
	 * 实现父类抽方法，处理扫描带参数二维码事件
	 */
	protected void processInQrCodeEvent(InQrCodeEvent inQrCodeEvent) {//这个就是通过在扫描二维码 所要调用的代码。 具体的逻辑代码自己可以研究一下 都是一些逻辑代码了 并不是很复杂
		InQrCodeEvent in =inQrCodeEvent;
		Wxconfig wxconfig = Wxconfig.dao.getWxconfig();
		String openId =in.getFromUserName();
		if(in.getEvent().toString().equals("subscribe"))
		{
		String uid=Wxtokeninfo.dao.insert_openid(openId);
		setCookie("openid", openId, 3600);
		String fid=in.getEventKey().split("_")[1];
		 
		ApiConfig ac = new ApiConfig();
		ac.setAppId(wxconfig.getStr("appId"));
		ac.setAppSecret(wxconfig.getStr("appSecret"));
		ApiConfigKit.setThreadLocalApiConfig(ac);
		AccessToken at =AccessTokenApi. getAccessToken();
		String path="C:/virtualhost/weixin/ROOT/qrcode/" + openId + ".jpg";
		this.CreateDecode(uid,at.getAccessToken(), openId,path);	
		Wxtokeninfo.dao.findById(uid).set("codeurl", "http://22.ftezu.net/qrcode/" + openId + ".jpg").update();	
		
		 ApiResult userinfo = UserApi.getUserInfo(openId);//页面授权获取  openid
   		 String subscribe=  userinfo.getInt("subscribe").toString(); 
   		 String nickname= userinfo.get("nickname").toString();
   		 String sex =userinfo.getInt("sex").toString();
   		 String language= userinfo.get("language").toString();
   		 String city = userinfo.get("city").toString();
   		 String province= userinfo.get("province").toString();
   		 String country= userinfo.get("country").toString();
   		 String headimgurl= userinfo.get("headimgurl").toString();
   		 String subscribe_time=DateUtil.getDateStringBySeparator();
   		 String remark= userinfo.get("remark").toString();
   		 String groupid=  userinfo.getInt("groupid").toString();
   		 Usermessagerinfo.dao.insert(uid,subscribe, nickname, sex, language, city, province, country, headimgurl, subscribe_time, remark, groupid,fid); 
		}
		OutTextMsg outMsg = new OutTextMsg(inQrCodeEvent);
		outMsg.setContent("欢迎您加入这个大家庭 成为我们系统的会员 ，我们将诚挚为您服务  谢谢！！如果您想成为我们系统的一份子的话欢迎点击申请按钮注册成为我们的业务员");
		render(outMsg);
	}
	
	/**
	 * 实现父类抽方法，处理上报地理位置事件
	 */
	protected void processInLocationEvent(InLocationEvent inLocationEvent) {
		OutTextMsg outMsg = new OutTextMsg(inLocationEvent);
		outMsg.setContent("processInLocationEvent() 方法测试成功");
		render(outMsg);
	}
	/**
	 * 实现父类抽方法，处理自定义菜单事件
	 */
	protected void processInMenuEvent(InMenuEvent inMenuEvent) {
		renderOutTextMsg("processInMenuEvent() 方法测试成功");
	}
	
	/**
	 * 实现父类抽方法，处理接收语音识别结果
	 */
	protected void processInSpeechRecognitionResults(InSpeechRecognitionResults inSpeechRecognitionResults) {
		renderOutTextMsg("语音识别结果： " + inSpeechRecognitionResults.getRecognition());
	}

	/**
	 * 创建二维码
	 */
	public void CreateDecode(String uid,String acctocen, String qrname,String path) {
		System.out.println("------------开始创建二维码--------------------");
		UserApi.getDCode(UserApi.createDCode(uid, acctocen),path);
		System.out.println("二维码创建成功！");
	}
	
	

	
	
}






