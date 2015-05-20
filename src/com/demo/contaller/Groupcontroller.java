package com.demo.contaller;

import java.util.List;

import com.demo.model.Groupinfo;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

public class Groupcontroller extends Controller {

	public void index() {
		Page<Groupinfo> pager=Groupinfo.dao.paginate(getParaToInt("pageCurrent", 1),
				getParaToInt("pageSize", 20));
				List<Groupinfo> articlesList = pager.getList();
		setAttr("group", articlesList);
		setAttr("pager", pager);
		render("/sys/group.jsp");
	}
	public void ope() {
		String id = getPara("id");
		String name = getPara("name");
		System.out.println(id);
		System.out.println(name);
		if (Groupinfo.dao.ids(id)) {//保存
			Groupinfo.dao.insert(id, name);
			renderJson("{\"statusCode\":\"200\",\"message\":\"\u64cd\u4f5c\u6210\u529f\",\"tabid\":\"table, table-fixed\",\"closeCurrent\":true,\"forward\":\"/group\"}");
		}else
		{//更新
				Groupinfo.dao.update(id, name);
				renderJson("{\"statusCode\":\"200\",\"message\":\"\u64cd\u4f5c\u6210\u529f\",\"tabid\":\"table, table-fixed\",\"closeCurrent\":true,\"forward\":\"/group\"}");
		}
	}
	public void delete() {
		if (Groupinfo.dao.findById(getPara("id")).delete()) {
			renderJson("{\"statusCode\":\"200\",\"message\":\"\u64cd\u4f5c\u6210\u529f\",\"tabid\":\"table, table-fixed\",\"closeCurrent\":true,   \"forward\":\"/group\"}");
		}
	}	
	
}
