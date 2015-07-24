package com.demo.contaller;

import java.util.List;

import com.demo.model.Subscribeinfo;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

public class Subscribecontroller extends Controller {

	
	
	public void index()
	{
		Page<Subscribeinfo> pager = Subscribeinfo.dao.paginate(	getParaToInt("pageCurrent", 1), getParaToInt("pageSize", 20));
		List<Subscribeinfo> articlesList = pager.getList();
		setAttr("subscribe", articlesList);
		setAttr("pager", pager);
		render("/sys/subscribe.jsp");
	}
	
	
	public void update()
	{
		String id=getPara("id");
		String uid=getSession().getAttribute("userid").toString();
		if(Subscribeinfo.dao.s_update(id, uid))
		{
			renderJson("{\"statusCode\":\"200\",\"message\":\"\u64cd\u4f5c\u6210\u529f\",\"tabid\":\"table, table-fixed\",\"closeCurrent\":true,   \"forward\":\"/subscribe\"}");	
		}
	}
	
}
