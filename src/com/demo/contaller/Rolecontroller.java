package com.demo.contaller;

import com.demo.model.Functioninfo;
import com.demo.model.Roleinfo;
import com.jfinal.core.Controller;

public class Rolecontroller extends Controller {

	public void index() {
		setAttr("role", Roleinfo.dao.paginate(getParaToInt(0, 1), 10));
		render("/sys/role.jsp");
	}

	public void authority() {
		setAttr("auts", Roleinfo.dao.authority(getPara("id")));
		System.out.println(Roleinfo.dao.authority(getPara("id")));
		setAttr("authority", Functioninfo.dao.find("select * from function  "));
		
		setAttr("ids", getPara("id"));
		setAttr("names", getPara("name"));
		render("/sys/authority_ope.jsp");
	}

	public void add() {
		String id=getPara("ids");
		String[] hour = getParaValues("authorityid");
		StringBuffer authorityid=new StringBuffer();
		for(int a=0;a<hour.length;a++)
		{
			authorityid.append(hour[a]).append(",");
		}
		Roleinfo.dao.update(id, authorityid.toString());
		redirect("/role");
	}

}
