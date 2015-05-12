package com.demo.contaller;

import com.demo.model.Userinfo;
import com.jfinal.core.Controller;

public class Indexcontroller extends Controller {
	public void index() {
		if (getSession().getAttribute("username") == null) {
			renderJsp("/login.jsp");
		} else {
			renderJsp("/index.jsp");
		}
	}
	public void login() { 
		String username = getPara("username");
		String password = getPara("password");
		if (Userinfo.dao.login(username, password)) {
			setSessionAttr("username", username);
			redirect("/");
		} else {
			renderJsp("/login.jsp");
		}
	}
}
