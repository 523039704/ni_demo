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
		renderJson("{\"statusCode\":\"200\",\"message\":\"\u64cd\u4f5c\u6210\u529f\",\"tabid\":\"table, table-fixed\",\"closeCurrent\":true}"); 
		}
	public void edit()
	{
		setAttr("id", getPara("rid"));	
		setAttr("role", Roleinfo.dao.findById(getPara("rid")));	
		
		render("/sys/role_ope.jsp");
	} 
	
	
	public void update()
	{
		
		String sid=getPara("sid");	
		String social=getPara("social");	
		String serve=getPara("serve");	
		if(Roleinfo.dao.update_serve(sid, social, serve))
		{
			renderJson("{\"statusCode\":\"200\",\"message\":\"\u64cd\u4f5c\u6210\u529f\",\"tabid\":\"table, table-fixed\",\"closeCurrent\":true,\"forward\":\"/role\"}");	
		}
		
	}
	
}
