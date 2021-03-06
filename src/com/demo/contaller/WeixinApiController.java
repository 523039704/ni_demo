package com.demo.contaller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.basic.util.DateUtil;
import com.demo.model.Wxconfig;
import com.jfinal.plugin.activerecord.Page;
import com.sdk.api.ApiConfig;
import com.sdk.api.ApiResult;
import com.sdk.api.MenuApi;
import com.sdk.api.UserApi;
import com.sdk.jfinal.ApiController;

public class WeixinApiController extends ApiController {
	
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
	 * 获取微信参数配置
	 */
	public void getWxconfig() {
		List<Object> param = new ArrayList<Object>();
		Page<Wxconfig> wxPage = Wxconfig.dao.paginate(getParaToInt("pageCurrent", 1),
				getParaToInt("pageSize", 20), " order by id", param.toArray());
		List<Wxconfig> list = wxPage.getList();
		setAttr("wxconfig",  list);
		setAttr("page", wxPage);
		render("table-wcs.jsp");
	}
	
	/**
	 * 获取微信参数配置编辑
	 */
	public void getConfig() {
		int id = getParaToInt("id");
		System.out.println("------------"+id);
		Wxconfig wxPage = Wxconfig.dao.getWxconfig();
		setAttr("dialog",  wxPage);
		render("dialog-wcs.jsp");
	}
	
	/**
	 * 编辑微信参数配置
	 */
	public void saveorupdate() {
		int id = getParaToInt("id")==0?0:getParaToInt("id");
		String appId = getPara("appId");
		String token = getPara("token");
		String appSecret = getPara("appSecret");
		int encryptMessage = getParaToInt("encryptMessage");
		Boolean bol = Wxconfig.dao.saveorupdate(id,appId, token, appSecret,encryptMessage);
		if(bol) {
			renderJson("{\"statusCode\":\"200\",\"message\":\"\u64cd\u4f5c\u6210\u529f\",\"navTabId\":\"\",\"closeCurrent\":true,\"forward\":\"\"}");
		}
	}
	
	/**
	 * 获取公众号菜单
	 */
	public void getMenu() {
		ApiResult apiResult = MenuApi.getMenu();
		
		if (apiResult.isSucceed()) {
			setAttr("pageSize", 5);
			setAttr("pageCurrent", 1);
			LinkedHashMap<String, Object> linkedHashMap = apiResult.get("menu");
			setAttr("cdlist", linkedHashMap.get("button"));
			render("table-wgzcd.jsp");
		}else {
			renderText(apiResult.getErrorMsg());
		}
	}
	
	/**
	 * 获取公众号关注用户
	 */
	public void getFollowers() {
		ApiResult apiResult = UserApi.getFollows();
		// TODO 用 jackson 解析结果出来
		setAttr("pageSize", apiResult.get("count"));
		setAttr("pageCurrent", 1);
		LinkedHashMap<String, Object> linkedHashMap = apiResult.get("data");
		List list = (List) linkedHashMap.get("openid");
		ArrayList<Map> arrlist = new ArrayList<Map>();
		for(int i=0;i<list.size();i++) {
			ApiResult userinfo = UserApi.getUserInfo(list.get(i).toString());
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
//			DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//			map.put("subscribe_time",sdf.format(userinfo.get("subscribe_time")));
			map.put("subscribe_time",DateUtil.makeLongTime(Integer.parseInt(userinfo.get("subscribe_time").toString())));
			map.put("remark",userinfo.get("remark"));
			map.put("groupid",userinfo.getInt("groupid"));
			arrlist.add(map);
		}
		setAttr("yhlist", arrlist);
		render("table-wgzyh.jsp");
	}
	
	/**
	 *获取用户信息 
	 */
	public void getUserInfo() {
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
		System.out.println(DateUtil.makeLongTime(Integer.parseInt(userinfo.get("subscribe_time").toString())));
		map.put("subscribe_time",DateUtil.makeLongTime(Integer.parseInt(userinfo.get("subscribe_time").toString())));
		map.put("remark",userinfo.get("remark"));
		map.put("groupid",userinfo.getInt("groupid"));
		
		setAttr("user", map);
		render("userinfo.jsp");
		
	}
	
	/**
	 * 创建微信服务端菜单
	 * @param jsonStr
	 */
	public void createMenu() {
		String jsonStr = JSONObject.fromObject(getMenus()).toString();
		ApiResult apiResult = MenuApi.createMenu(jsonStr);
		if(apiResult.isSucceed()) {
			renderText(MenuApi.getMenu().getJson());
		}else {
			renderText(apiResult.getErrorMsg());
		}
	} 
	
	 /**
	  * 创建二维码
	  */
	 public void CreateDecode(String img,String qrname) {  
		 System.out.println("------------开始创建二维码--------------------");
		 UserApi.encoderQRCode("http://22.ftezu.net/app/index", "C:/virtualhost/weixin/ROOT/qrcode/"+qrname+".jpg");
		 UserApi.encoderQRCode("http://22.ftezu.net/app/index", "C:/Users/Administrator/Desktop/tomcat/tomcat/apache-tomcat-8.0.15-windows-x64/apache-tomcat-8.0.15/webapps/zi_demo/qrcode/"+qrname+".jpg");
//		 AccessToken at = AccessTokenApi.getAccessToken(); 
//		 if (null != at) {  
			 // 调用接口创建菜单   
//			 ResponseDCode responseDCode = UserApi.createDCode(img,at.getAccessToken());  
			 
//			 UserApi.getDCode(responseDCode, "G:/workspace/weixin/WebContent/qrcode/test.jpg");
			 // 判断菜单创建结果   
//			 if (null != responseDCode)  
				 System.out.println("二维码创建成功！");  
//			 else  
//				 System.out.println("二维码创建失败，错误码：" + responseDCode);  
//		 }  
	 }
	
	/** 
    * 组装菜单数据 
    *  
    * @return 
    */  
   public Menu getMenus() {  
	   Wxconfig wxconfig = Wxconfig.dao.getWxconfig();
       CommonButton btn11 = new CommonButton();  
       btn11.setName("首页");  
       btn11.setType("view");  
       btn11.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid="+wxconfig.getStr("appId")+"&redirect_uri=http://22.ftezu.net/app/index&response_type=code&scope=snsapi_base&state=1#wechat_redirect");
 
       CommonButton btn21 = new CommonButton();  
       btn21.setName("申请");  
       btn21.setType("view");  
       btn21.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid="+wxconfig.getStr("appId")+"&redirect_uri=http://22.ftezu.net/app/sqdls&response_type=code&scope=snsapi_base&state=1#wechat_redirect");  
       
       CommonButton btn31 = new CommonButton();  
       btn31.setName("我的二维码");  
       btn31.setType("view");  
       btn31.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid="+wxconfig.getStr("appId")+"&redirect_uri=http://22.ftezu.net/app/qrcode&response_type=code&scope=snsapi_base&state=1#wechat_redirect");  
       
       CommonButton btn32 = new CommonButton();  
       btn32.setName("课程列表");  
       btn32.setType("view");  
       btn32.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid="+wxconfig.getStr("appId")+"&redirect_uri=http://22.ftezu.net/app/counrse&response_type=code&scope=snsapi_base&state=1#wechat_redirect");  
       CommonButton btn33 = new CommonButton();  
       btn33.setName("预约");  
       btn33.setType("view");  
       btn33.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid="+wxconfig.getStr("appId")+"&redirect_uri=http://22.ftezu.net/app/subscribe&response_type=code&scope=snsapi_base&state=1#wechat_redirect");   
       CommonButton btn34 = new CommonButton();  
       btn34.setName("个人信息");  
       btn34.setType("view");  
       btn34.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid="+wxconfig.getStr("appId")+"&redirect_uri=http://22.ftezu.net/app/index_geren&response_type=code&scope=snsapi_base&state=1#wechat_redirect");   
       
       
       ComplexButton mainBtn3 = new ComplexButton();  
       mainBtn3.setName("个人中心");  //
       mainBtn3.setSub_button(new CommonButton[] { btn31,btn32,btn33,btn34});  
 
     
       Menu menu = new Menu();  
       menu.setButton(new Button[] { btn11, btn21, mainBtn3 });  
       return menu;  
   }
	
}

