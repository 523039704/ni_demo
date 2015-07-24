<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String appId = request.getParameter("appid");
String timeStamp = request.getParameter("timeStamp");
String nonceStr = request.getParameter("nonceStr");
String packageValue = request.getParameter("package");
String paySign = request.getParameter("sign");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>微信支付</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   </body>
  <script type="text/javascript">
  	
  	function onBridgeReady(){
  	   WeixinJSBridge.invoke(
  	       'getBrandWCPayRequest', {
	  	         "appId" : "<%=appId%>",     //公众号名称，由商户传入     
  	             "timeStamp":"<%=timeStamp%>",         //时间戳，自1970年以来的秒数     
  	             "nonceStr" : "<%=nonceStr%>", //随机串     
  	             "package" : "<%=packageValue%>",     
  	             "signType" : "MD5",         //微信签名方式:     
  	             "paySign" :"<%=paySign%>"  //微信签名 
  	       },
  	       function(res){   
   	           if(res.err_msg == "get_brand_wcpay_request:ok" ) {
  	       	 window.location.href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxf4d5687f651cbe90&redirect_uri=http://22.ftezu.net/app/counrse&response_type=code&scope=snsapi_base&state=1#wechat_redirect"; 
  	             // 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回    ok，但并不保证它绝对可靠。 
  	     		}else if(res.err_msg == "get_brand_wcpay_request:cancel"){  
           	 window.location.href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxf4d5687f651cbe90&redirect_uri=http://22.ftezu.net/app/counrse&response_type=code&scope=snsapi_base&state=1#wechat_redirect"; 
        	 }else{  
          	 window.location.href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxf4d5687f651cbe90&redirect_uri=http://22.ftezu.net/app/counrse&response_type=code&scope=snsapi_base&state=1#wechat_redirect";  
         }  
  	       }
  	   ); 
  	}
  	if (typeof WeixinJSBridge == "undefined"){
  	   if( document.addEventListener ){
  	       document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
  	   }else if (document.attachEvent){
  	       document.attachEvent('WeixinJSBridgeReady', onBridgeReady); 
  	       document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
  	   }
  	}else{
  	   onBridgeReady();
  	}
  	 
  </script>
  
</html>
