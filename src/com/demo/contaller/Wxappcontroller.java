package com.demo.contaller;

import java.util.List;

import com.basic.util.AdvancedUtil;
import com.basic.util.DateUtil;
import com.basic.util.MD5base;
import com.basic.util.WeiXinOauth2Token;
import com.demo.model.Courseinfo;
import com.demo.model.Orderinfo;
import com.demo.model.Subscribeinfo;
import com.demo.model.Userinfo;
import com.demo.model.Usermessagerinfo;
import com.demo.model.Wxconfig;
import com.demo.model.Wxtokeninfo;
import com.sdk.api.ApiConfig;
import com.sdk.jfinal.ApiController;

public class Wxappcontroller extends ApiController {

	@Override
	public ApiConfig getApiConfig() {
		Wxconfig wxconfig = Wxconfig.dao.getWxconfig();

		ApiConfig ac = new ApiConfig();
		// 配置微信 API 相关常量
		ac.setToken(wxconfig.getStr("token"));
		ac.setAppId(wxconfig.getStr("appId"));
		ac.setAppSecret(wxconfig.getStr("appSecret"));
		/**
		 * 是否对消息进行加密，对应于微信平台的消息加解密方式： 1：true进行加密且必须配置 encodingAesKey
		 * 2：false采用明文模式，同时也支持混合模式
		 */
		Boolean bool = wxconfig.getInt("encryptMessage") == 1 ? true : false;
		ac.setEncryptMessage(bool);
		ac.setEncodingAesKey(wxconfig.getStr("encodingAesKey"));
		return ac;
	}

	// 首页
	public void index()  {// 用户首次登陆之后去后台数据库中查询这个openid 是否存在 不存在 直接存放在数据库中 存在
							// 则从数据库中把信息给拿出来使用就好 每次都要从微信服务器上拿openid
//		String openId = getCookie("openid");
		Wxconfig wxconfig = Wxconfig.dao.getWxconfig();
		String appid = wxconfig.getStr("appId");
		String appSecret = wxconfig.getStr("appSecret");
		String code = getPara("code");
		  WeiXinOauth2Token weiXinOauth2Token = AdvancedUtil.getOauth2AccessToken(appid,appSecret, code);
		  		String  openId = weiXinOauth2Token.getOpenId();
		
		  		setCookie("openid", openId, 3600);
		Wxtokeninfo wxtok = Wxtokeninfo.dao.see_openid(openId);
		String uid = wxtok.get("id").toString();
	 
		
		Userinfo userinfo = Userinfo.dao.findById(uid);
		Usermessagerinfo usermessager=Usermessagerinfo.dao.findById(uid);
		setAttr("user", usermessager);
		setAttr("role", userinfo);// 显示角色信息
	
		if (userinfo == null||usermessager.get("role").equals("0")) {
			setAttr("invest",Orderinfo.dao	.findFirst("select    sum(montey) as price  from  `order` where userid='" + uid + "'"));// 显示投资金额
			List<Orderinfo> productinfo = Orderinfo.dao	.find("select c.img,c.name,o.montey  ,o.orderdatetime  from `order` o , course c where o.userid='"+ uid	+ "' and o.ptoducti='2'  and c.id=o.productid ");
			setAttr("info", productinfo);
			render("kehu.jsp");
		} else {
			setAttr("client",
					Userinfo.dao
							.findFirst(" select 	count(*)   as much   from   admin   where fid='"
									+ uid + "' and role>='"+usermessager.get("role").toString()+"'"));// 显示客户数量
			String where="";
			if(usermessager.get("role").equals("2"))
			{
				 where="where agentid='"+ uid + "' ";	
			}else if(usermessager.get("role").equals("3"))
			{
				 where="where filialeid='"+ uid + "' ";	
			}else if(usermessager.get("role").equals("4"))
			{
				 where="where businessid='"+ uid + "' ";	
			}
			System.out.println(where);
			setAttr("perfor",Orderinfo.dao.findFirst("select    sum(montey) as price  from  `order` "+where+""));// 显示业绩金额
			List<Userinfo> useinfo = Userinfo.dao
					.find("select * from admin a , usermessager us where a.fid='"+ uid + "' and us.fid='"+ uid + "' and a.role>='"+usermessager.get("role").toString()+"' and us.role>'"+usermessager.get("role").toString()+"'");
			setAttr("info", useinfo);
			render("index.jsp");
		}
	}

	public void index_geren() {// 用户首次登陆之后去后台数据库中查询这个openid 是否存在 不存在 直接存放在数据库中 存在
		// 则从数据库中把信息给拿出来使用就好 每次都要从微信服务器上拿openid
		Wxconfig wxconfig = Wxconfig.dao.getWxconfig();
		String appid = wxconfig.getStr("appId");
		String appSecret = wxconfig.getStr("appSecret");
		String code = getPara("code");
		  WeiXinOauth2Token weiXinOauth2Token = AdvancedUtil.getOauth2AccessToken(appid,appSecret, code);
		  		String  openId = weiXinOauth2Token.getOpenId();
		  		setCookie("openid", openId, 3600);
		Wxtokeninfo wxtok = Wxtokeninfo.dao.see_openid(openId);
		String uid = wxtok.get("id").toString();
		Userinfo userinfo = Userinfo.dao.findById(uid);
		Usermessagerinfo usermessager=Usermessagerinfo.dao.findById(uid);
		setAttr("user",usermessager);
		setAttr("role", userinfo);// 显示角色信息
		List<Orderinfo> productinfo = Orderinfo.dao	.find("select c.img,c.name,o.montey  ,o.orderdatetime  from `order` o , course c where o.userid='" + uid + "' and o.ptoducti='2'  and c.id=o.productid ");
		if (userinfo == null||usermessager.get("role").equals("0")) {
			System.out.println("1");
			setAttr("invest",	Orderinfo.dao.findFirst("select    sum(montey) as price  from  `order` where userid='"	+ uid + "'"));// 显示投资金额
 			setAttr("product", productinfo);
		} else {
			System.out.println("2");
			setAttr("client",Userinfo.dao.findFirst(" select 	count(*)   as much   from   admin   where fid='"+ uid + "'"));// 显示客户数量
			String where="";
			if(usermessager.get("role").equals("2"))
			{
				 where="where agentid='"+ uid + "' ";	
			}else if(usermessager.get("role").equals("3"))
			{
				 where="where filialeid='"+ uid + "' ";	
			}else if(usermessager.get("role").equals("4"))
			{
				 where="where businessid='"+ uid + "' ";	
			}
			
			setAttr("perfor",Orderinfo.dao	.findFirst("select    sum(montey) as price  from  `order` "+where+""));// 显示业绩金额
			List<Userinfo> useinfo = Userinfo.dao
					.find("select * from admin a , usermessager us where a.fid='" + uid + "' and us.fid='"+ uid +"'");
			setAttr("product", productinfo);
			setAttr("info", useinfo);
		}
		render("index_geren.jsp");
	}

	// 申请代理商
	public void sqdls() {
		Wxconfig wxconfig = Wxconfig.dao.getWxconfig();
		String appid = wxconfig.getStr("appId");
		String appSecret = wxconfig.getStr("appSecret");
		String code = getPara("code");
		  WeiXinOauth2Token weiXinOauth2Token = AdvancedUtil.getOauth2AccessToken(appid,appSecret, code);
		  		String  openId = weiXinOauth2Token.getOpenId();
		  		setCookie("openid", openId, 3600);
		Wxtokeninfo wxtok = Wxtokeninfo.dao.see_openid(openId);
		String uid = wxtok.get("id").toString();
		setAttr("openid", openId);
		setAttr("usermessager", Usermessagerinfo.dao.findById(uid));
		setAttr("invest",Orderinfo.dao.findFirst("select    sum(montey) as price  from  `order` where userid='"	+ uid + "'"));// 显示投资金额
		setAttr("client",Userinfo.dao.findFirst(" select 	count(*)   as much   from   admin   where fid='"+ uid + "'"));// 显示客户数量
		Userinfo userinfo = Userinfo.dao.findById(uid);
		if(userinfo!=null)
		{
		String where="";
		if(userinfo.get("role").equals("2"))
		{
			 where="where agentid='"+ uid + "' ";	
		}else if(userinfo.get("role").equals("3"))
		{
			 where="where filialeid='"+ uid + "' ";	
		}else if(userinfo.get("role").equals("4"))
		{
			 where="where businessid='"+ uid + "' ";	
		}
		
		setAttr("perfor",Orderinfo.dao	.findFirst("select    sum(montey) as price  from  `order` "+where+""));// 显示业绩金额
		}
		setAttr("user", Usermessagerinfo.dao.findById(uid));
		setAttr("userinfo", Userinfo.dao.findById(uid));
		render("sqdls.jsp");
	}

	// 我的二维码
	public void qrcode() {
		Wxconfig wxconfig = Wxconfig.dao.getWxconfig();
		String appid = wxconfig.getStr("appId");
		String appSecret = wxconfig.getStr("appSecret");
		String code = getPara("code");
		  WeiXinOauth2Token weiXinOauth2Token = AdvancedUtil.getOauth2AccessToken(appid,appSecret, code);
		  		String  openId = weiXinOauth2Token.getOpenId();
		  		setCookie("openid", openId, 3600);

		Wxtokeninfo wxtok = Wxtokeninfo.dao.see_openid(openId);
		String uid = wxtok.get("id").toString();
		setAttr("invest",
				Orderinfo.dao
						.findFirst("select    sum(montey) as price  from  `order` where userid='"
								+ uid + "'"));// 显示投资金额
		setAttr("client",
				Userinfo.dao
						.findFirst(" select 	count(*)   as much   from   admin   where fid='"
								+ uid + "'"));// 显示客户数量
		Userinfo userinfo = Userinfo.dao.findById(uid);
		if(userinfo!=null)
		{
		String where="";
		if(userinfo.get("role").equals("2"))
		{
			 where="where agentid='"+ uid + "' ";	
		}else if(userinfo.get("role").equals("3"))
		{
			 where="where filialeid='"+ uid + "' ";	
		}else if(userinfo.get("role").equals("4"))
		{
			 where="where businessid='"+ uid + "' ";	
		}
		
		setAttr("perfor",Orderinfo.dao	.findFirst("select    sum(montey) as price  from  `order` "+where+""));// 显示业绩金额
		}
		setAttr("wxtok", wxtok);
		setAttr("user", Usermessagerinfo.dao.findById(uid));
		setAttr("userinfo", Userinfo.dao.findById(uid));
		render("qrcode.jsp");
	}

	// 我的二维码
	public void subscribe() {
		Wxconfig wxconfig = Wxconfig.dao.getWxconfig();
		String appid = wxconfig.getStr("appId");
		String appSecret = wxconfig.getStr("appSecret");
		String code = getPara("code");
		  WeiXinOauth2Token weiXinOauth2Token = AdvancedUtil.getOauth2AccessToken(appid,appSecret, code);
		  		String  openId = weiXinOauth2Token.getOpenId();
		  		setCookie("openid", openId, 3600);
		Wxtokeninfo wxtok = Wxtokeninfo.dao.see_openid(openId);
		String uid = wxtok.get("id").toString();
		setAttr("invest",Orderinfo.dao	.findFirst("select    sum(montey) as price  from  `order` where userid='"	+ uid + "'"));// 显示投资金额
		setAttr("wxtok", wxtok);
		setAttr("user", Usermessagerinfo.dao.findById(uid));
		setAttr("userinfo", Userinfo.dao.findById(uid));
		render("subscribe.jsp");
	}
	public void subscribe_insert() {
		String uid = getPara("uid");
	
		String username = getPara("username");
		String realtname = getPara("realtname");
		String password = MD5base.md5Digest("111111");
		String numbercard = getPara("numbercard");
		String phone = getPara("phone");
		String email = getPara("email");
		String address = getPara("address");
		String price = getPara("price"); 
		String type = getPara("type"); 
		String addtime = DateUtil.getDateStringBySeparator();
			Userinfo user=Userinfo.dao.findById(uid); 
			if(user==null){
		if (Userinfo.dao.insert_wx(uid, username, realtname, password,	numbercard, phone, email, "0", addtime, "0","0")&&
				Usermessagerinfo.dao.update_messager(uid,numbercard,phone,email,address)&&Subscribeinfo.dao.s_insert(uid,type,price)) {
			render("tijiao.jsp");
		}
		}else 
		{
			if (Subscribeinfo.dao.s_insert(uid,type,price)) {
				render("tijiao.jsp");
			}	
			
			
		}
	}

	public void counrse() {
		Wxconfig wxconfig = Wxconfig.dao.getWxconfig();
		String appid = wxconfig.getStr("appId");
		String appSecret = wxconfig.getStr("appSecret");
		String code = getPara("code");
		  WeiXinOauth2Token weiXinOauth2Token = AdvancedUtil.getOauth2AccessToken(appid,appSecret, code);
		  		String  openId = weiXinOauth2Token.getOpenId();
		  		setCookie("openid", openId, 3600);
		List<Courseinfo> courseinfo = Courseinfo.dao
				.find("select * from course");
		setAttr("info", courseinfo);
		render("counrselist.jsp");

	}

	public void counrsemessager() {
		String  openId = getCookie("openid"); 
		Wxtokeninfo wxtok = Wxtokeninfo.dao.see_openid(openId);
		String uid = wxtok.get("id").toString();
		setAttr("user", Usermessagerinfo.dao.findById(uid));
		String id = getPara("id");
		setAttr("counrse", Courseinfo.dao.findById(id));
		render("counrse.jsp");
	}

	public void insert_wx() {
		String uid = getPara("uid");
		String username = getPara("username");
		String realtname = getPara("realtname");
		String password = MD5base.md5Digest("111111");
		String numbercard = getPara("numbercard");
		String phone = getPara("phone");
		String email = getPara("email");
		String role = getPara("role");
		String fid=Usermessagerinfo.dao.findById(uid).get("fid").toString();
		String addtime = DateUtil.getDateStringBySeparator();
		if (Userinfo.dao.insert_wx(uid, username, realtname, password,
				numbercard, phone, email, role, addtime, "1",fid)) {
			render("tijiao.jsp");
		}
	}

	public void update_wx() {
		String uid = getPara("uid");
		String username = getPara("username");
		String realtname = getPara("realtname");
		String password = MD5base.md5Digest("111111");
		String numbercard = getPara("numbercard");
		String phone = getPara("phone");
		String email = getPara("email");
		String role = getPara("role");
		String addtime = DateUtil.getDateStringBySeparator();
		if (Userinfo.dao.update_wx(uid, username, realtname, password,
				numbercard, phone, email, role, addtime, "1")) {
			render("tijiao.jsp");
		}
	}

}
