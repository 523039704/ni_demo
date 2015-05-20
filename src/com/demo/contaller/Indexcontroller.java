package com.demo.contaller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.demo.model.Functioninfo;
import com.demo.model.Roleinfo;
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
			Userinfo role=Userinfo.dao.see_role(username, password);
			String [] str=Roleinfo.dao.authority(role.get("role").toString()).split(",");
			Map<String, Object> map;
			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			
			for(int a=0;str.length>a;a++)
			{
				map = new HashMap<String, Object>();
				Functioninfo fun=Functioninfo.dao.see_index(str[a]);
				map.put("id", fun.get("id").toString());
				map.put("name", fun.get("name").toString());
				map.put("path", fun.get("path").toString());
				list.add(map);
			}
			setSessionAttr("function", list);
			setSessionAttr("role", role.get("role").toString());
			setSessionAttr("userid", role.getLong("admin_id"));
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
		redirect("/");
	}

}
