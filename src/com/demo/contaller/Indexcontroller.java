package com.demo.contaller;

import com.demo.model.Userinfo;
import com.jfinal.core.Controller;

public class Indexcontroller extends Controller {
	public void index() {
		System.out.println(getSession().getAttribute("name"));
		if (getSession().getAttribute("name") == null) {
			renderJsp("/login.jsp");
		} else {
			renderJsp("/index.jsp");
		}
	}
	public void login() { 
		String username = getPara("name");
		String password = getPara("password");
		if (Userinfo.dao.login(username, password)) {
			setSessionAttr("name", username);
			redirect("/");
		} else {
			renderJsp("/login.jsp");
		}
	}
}
