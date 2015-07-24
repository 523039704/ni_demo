package com.demo.contaller;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletInputStream;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.weixin4j.Configuration;
import org.weixin4j.pay.PayNotifyResult;
import org.weixin4j.pay.PayUtil;
import org.weixin4j.pay.SignUtil;
import org.weixin4j.util.XStreamFactory;

import com.basic.util.DateUtil;
import com.basic.util.MD5base;
import com.basic.util.Mathutil;
import com.demo.model.Courseinfo;
import com.demo.model.Orderinfo;
import com.demo.model.Userinfo;
import com.demo.model.Usermessagerinfo;
import com.demo.model.Wxconfig;
import com.demo.model.Wxtokeninfo;
import com.jfinal.core.Controller;
import com.thoughtworks.xstream.XStream;
import com.utils.GetWxOrderno;
import com.utils.MD5;
import com.utils.UnifiedOrder;

public class Paycontaller extends Controller {

	public void wx_pay_befion() {

		// 则从数据库中把信息给拿出来使用就好 每次都要从微信服务器上拿openid
		Wxconfig wxconfig = Wxconfig.dao.getWxconfig();
		String appid = wxconfig.getStr("appId");
		 
		String  openId = getCookie("openid"); 
		
		Wxtokeninfo wxtok = Wxtokeninfo.dao.see_openid(openId);
		

		String username = getPara("phone");
		String realtname = getPara("name");
		String password = MD5base.md5Digest("111111");
		String numbercard = getPara("numbercard");
		String phone = getPara("phone");
		String email = getPara("email");
		String address = getPara("address");
		String addtime = DateUtil.getDateStringBySeparator();
		
		
		
		 
		String price=getPara("price");
		System.out.println(price);
		String cid=getPara("id");
		Courseinfo coun = Courseinfo.dao.findById(cid);
		if(price==null)
		{
			price=coun.get("price").toString();
		}
		System.out.println(price);
		
		String admin=Mathutil.round( Mathutil.multiply(price, Mathutil.divide(coun.get("admin").toString(),     "100",2)),2);
		System.out.println(admin);
		String filiale=Mathutil.round( Mathutil.multiply(admin, Mathutil.divide(coun.get("filiale").toString(), "100",2)),2);
		System.out.println(filiale);
		String agent=Mathutil.round( Mathutil.multiply(filiale,Mathutil.divide(coun.get("agent").toString(),    "100",2)),2);
		System.out.println(agent);  
		System.out.println(agent);  
		String business=Mathutil.round(Mathutil.multiply(agent,Mathutil.divide(coun.get("business").toString(), "100",2)),2);	
	
		System.out.println(business);
		String orderid=DateUtil.makeTimestamp();
		String id=wxtok.get("id").toString();
	 	String status="0";
//	 	<c:if test="${order.status ==0}">未付款</c:if>   
//		<c:if test="${order.status ==1}">已付款</c:if>   
//		<c:if test="${order.status ==2}">审核通过</c:if>   
//		<c:if test="${order.status ==-1}">审核失败</c:if>  
		Userinfo user=Userinfo.dao.findById(id); 
		Usermessagerinfo usermessaer=Usermessagerinfo.dao.findById(id); 
		if(user==null){
			Userinfo.dao.insert_wx(id, username, realtname, password,	numbercard, phone, email, "0", addtime, "0", "0");
		
		}
		if(usermessaer.get("address")==null||usermessaer.get("numbrcard")==null||usermessaer.get("phone")==null||usermessaer.get("email")==null)
		{
			Usermessagerinfo.dao.update_messager(id,numbercard,phone,email,address);
		}
		
		
		if(Orderinfo.dao.insert_wx(id,cid,price,status,"0",admin,filiale,agent,business,orderid))
		{
		String product_name ="商品名称";//商品名称
		// 获取商户密钥
		String partnerKey = "26148d621ef74844918af182d63976b6";
		String createOrderURL = "https://api.mch.weixin.qq.com/pay/unifiedorder";
		// 统一下单对象
		String nonce_str=java.util.UUID.randomUUID().toString().substring(0, 15);
	 
		UnifiedOrder unifiedorder = new UnifiedOrder();
		unifiedorder.setAppid(appid);
		unifiedorder.setBody(product_name);
		unifiedorder.setMch_id("1245196002");
		unifiedorder.setNonce_str(nonce_str);
		unifiedorder.setNotify_url("http://22.ftezu.net/pay/wx_nody_pay");
		unifiedorder.setOpenid(openId);
		unifiedorder.setOut_trade_no(orderid);// 唯一的订单号
		unifiedorder.setSpbill_create_ip(getRequest().getRemoteAddr());// 设置当前的请求IP地址
		unifiedorder.setTotal_fee(String.valueOf((Long.parseLong(price) * 100)));// 100元
		unifiedorder.setTrade_type("JSAPI");
		// 对下单对象进行签名
		String sign = SignUtil.getSign(unifiedorder.toMap(), partnerKey);
		// 设置签名
		unifiedorder.setSign(sign);
		// 统一预下单
		String xmlPost = unifiedorder.toXML();
		if (Configuration.isDebug()) {
			System.out.println("调试模式_统一下单接口 提交XML数据：" + xmlPost);
		}

		   String[] prepay_id = null;
					try {
						prepay_id = new GetWxOrderno().getPayNo(createOrderURL, xmlPost).split(",");
						if(prepay_id==null){
							 getRequest().setAttribute("ErrorMsg", "统一支付接口获取预支付订单出错");
							 getResponse().sendRedirect("/weChatpay/error.jsp");
						}
					} catch (Exception e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					 
		String timestamp = System.currentTimeMillis() / 1000 + "";
		String packages = "prepay_id="+ prepay_id[0];
		List<NameValuePair> signParams = new LinkedList<NameValuePair>();
		signParams.add(new BasicNameValuePair("appId", appid));
		signParams.add(new BasicNameValuePair("nonceStr",  prepay_id[1]));
		signParams.add(new BasicNameValuePair("package", packages));
		signParams.add(new BasicNameValuePair("signType", "MD5"));
		signParams.add(new BasicNameValuePair("timeStamp", timestamp));
		String finalsign = genPackageSign(signParams);
		redirect("/app/pay.jsp?appid="+appid+"&timeStamp="+timestamp+"&nonceStr="+prepay_id[1]+"&package="+packages+"&sign="+finalsign);
		}
			 
	}
 
	public void   wx_nody_pay()
	{
		 try {
		        //---------------------------------------------------------
		        //微信支付支付通知（后台通知）示例，商户按照此文档进行开发即可
		        //---------------------------------------------------------
		        //创建支付应答对象
		        System.out.println("收到微信支付回调 start");
		        //获取Post的流
		        ServletInputStream in = getRequest().getInputStream();
		        //将流转换为字符串
		        String xmlMsg = XStreamFactory.inputStream2String(in);
		        //商户密钥
		        String paternerKey = "26148d621ef74844918af182d63976b6";
		        
		        XStream xs = XStreamFactory.init(false);
		        xs.alias("xml", PayNotifyResult.class);
		        //结果
		        PayNotifyResult payNotifyResult = (PayNotifyResult) xs.fromXML(xmlMsg);
		        
		        //商户订单号
		        String out_trade_no = payNotifyResult.getOut_trade_no();
		        //支付结果
		        String return_code = payNotifyResult.getReturn_code();
		        String orderdatetime = DateUtil.getDateStringBySeparator();
		        System.out.println("收到微信支付回调 return_code = " + return_code);
		        System.out.println("收到微信支付回调 out_trade_no = " + out_trade_no);
		        //判断签名及结果
		        if ("SUCCESS".equals(return_code)) {
		            //验证签名
		            boolean verify = PayUtil.verifySign(xmlMsg, paternerKey);
		            if (verify) {
		                //------------------------------
		                //即时到账处理业务开始
		                //------------------------------
		                //根据id查询支付订单信息
		                //商户内部处理订单交易状态业务逻辑 start
		                //商户内部代码
		                //商户内部处理订单交易状态业务逻辑 end
		                //注意交易单不要重复处理
		                //注意判断返回金额
		            	
		            	if(Orderinfo.dao.update_orderid(out_trade_no,orderdatetime))
		            	{
		            		System.out.println("收到微信支付回调 成功");
		            		renderText("<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>");
		            	}else
		            	{
		            		 System.out.println("收到微信支付回调 签名失败");
				                renderText("<xml><return_code><![CDATA[FAIL]]></return_code><return_msg><![CDATA[签名失败]]></return_msg></xml>");
		            	}
		            	
		                //------------------------------
		                //即时到账处理业务完毕
		                //------------------------------
		                //给财付通系统发送成功信息，财付通系统收到此结果后不再进行后续通知
		            } else {
		                System.out.println("收到微信支付回调 签名失败");
		                renderText("<xml><return_code><![CDATA[FAIL]]></return_code><return_msg><![CDATA[签名失败]]></return_msg></xml>");
		            }
		        } else {
		            System.out.println("收到微信支付回调 支付失败");
		            renderText("<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>");
		        }
		    } catch (Exception ex) {
		        System.out.println("收到微信支付回调 异常");
		        renderText("<xml><return_code><![CDATA[FAIL]]></return_code><return_msg><![CDATA[参数格式校验错误]]></return_msg></xml>");
		    }
		
		
	}

	private static String genPackageSign(List<NameValuePair> params) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < params.size(); i++) {

			sb.append(params.get(i).getName());
			sb.append('=');
			sb.append(params.get(i).getValue());  
			sb.append('&');

		}
		sb.append("key=");
		sb.append("26148d621ef74844918af182d63976b6");
		System.out.println(sb.toString());
		String packageSign = MD5.getMessageDigest(sb.toString().getBytes())
				.toUpperCase();
		return packageSign;
	}
public void jinggao()
{
	



}
}
