package com.demo.contaller;

import com.demo.model.Userinfo;
import com.jfinal.core.Controller;

public class Indexcontroller extends Controller {
	public void index() {
		if (getSession().getAttribute("name") == null) {
			renderJsp("/login.jsp");
		} else {
			renderJsp("/index.jsp");
		}
	}
	public void login() { 
		String username = getPara("name");
		String password = getPara("password");
		if(Userinfo.dao.see_name(username))
		{
		if (Userinfo.dao.login(username, password)) {
			
			setSessionAttr("role", Userinfo.dao.see_role(username, password));
			setSessionAttr("name", username);
			redirect("/");
		} 
		else {
			renderJsp("/login.jsp");
		}
		}else {
			renderJsp("/login.jsp");
		}
	}

	public void logout() {
		getSession().invalidate();
		redirect("/login");
	}

}
