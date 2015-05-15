package com.demo.contaller;

import java.util.List;

import com.demo.model.Functioninfo;
import com.demo.model.Roleinfo;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

public class Rolecontroller extends Controller {

	public void index() {
		Page<Roleinfo> pager =Roleinfo.dao.paginate(getParaToInt("pageCurrent", 1),
				getParaToInt("pageSize", 20));
		List<Roleinfo> articlesList = pager.getList();
		setAttr("role", articlesList);
		setAttr("pager", pager);
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
