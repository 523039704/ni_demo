package com.demo.contaller;

import java.io.IOException;

import javax.servlet.ServletException;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.sdk.kit.SignatureCheckKit;


public class Weixincheck extends Controller{

	private Logger log = Logger.getLogger(this.getClass().getName());
	
	public void index() throws ServletException, IOException {
		log.debug("开始验证签名.....");	
		String signature = getRequest().getParameter("signature");
		String timestamp = getRequest().getParameter("timestamp");
		String nonce = getRequest().getParameter("nonce");
		String echostr = getRequest().getParameter("echostr");
		
		Boolean bool = new SignatureCheckKit().checkSignature(signature, timestamp, nonce);
		
		if(bool) {
			log.debug("验证通过.....");
			getResponse().getWriter().write(echostr);// 完成相互认证
		}
		
	}


	
}
