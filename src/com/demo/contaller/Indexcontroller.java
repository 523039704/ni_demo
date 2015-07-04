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
		String se = getPara("se");
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
			setSessionAttr("userid", role.getLong("id"));
			setSessionAttr("name", username);
			if(se.equals("1"))
			{
				renderJson("{\"statusCode\":\"200\",\"message\":\"登陆已成功\",\"tabid\":\"table, table-fixed\",\"closeCurrent\":true}");
			}else{
			redirect("/");
			} 
			}
		else {
			renderJsp("/login.jsp");
		}
		}else {
			renderJsp("/login.jsp");
		}
	}

	
	public void changepassword()
	{
		String uid = getSession().getAttribute("userid").toString();
		String oldpassword = getPara("oldpassword");
		String newpassword2 = getPara("newpassword2");
		if(Userinfo.dao.oldpassword(uid,oldpassword))
		{
			if(Userinfo.dao.changerpassword(uid, newpassword2)){
				getSession().invalidate();
				renderJson("{\"statusCode\":\"200\",\"message\":\"请退出，重新登录！！\",\"tabid\":\"table, table-fixed\",\"closeCurrent\":true,\"forward\":\"/login_timeout.jsp\"}");
			}
			
			
		}else
		{
			
			renderJson("{\"statusCode\":\"300\",\"message\":\"密码错误，请重新输入！！\",\"tabid\":\"table, table-fixed\",\"closeCurrent\":true}");
		
			
		}
	}	
	
	public void logout() {
		getSession().invalidate();
		redirect("/");
	}

	
	
	
	
	
	
}
