package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.weixin4j.OAuth2;

@SuppressWarnings("serial")
public class MainServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
 
		  OAuth2 oauth2 = new OAuth2();
          String appId = org.weixin4j.Configuration.getOAuthAppId();
          String backUri = "http://23.ftezu.net/topayServlet";
		  backUri = backUri+"?userId=b88001&orderNo=1499900164812&describe=西瓜&money=1780.00";
		  String redirectUrl = oauth2.getOAuth2CodeBaseUrl(appId, backUri);
		  response.sendRedirect(redirectUrl);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
