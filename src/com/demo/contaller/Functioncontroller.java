package com.demo.contaller;

import java.util.List;

import com.demo.model.Functioninfo;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

public class Functioncontroller extends Controller {

	public void index() {
		Page<Functioninfo> pager=Functioninfo.dao.paginate(getParaToInt("pageCurrent", 1),
				getParaToInt("pageSize", 20));
				List<Functioninfo> articlesList = pager.getList();
		setAttr("function", articlesList);
		setAttr("pager", pager);
		render("/sys/function.jsp");
	}

	public void add() {
		render("/sys/function_ope1.jsp");
	}
	public void edit() {
		setAttr("function", Functioninfo.dao.findById(getPara("id")));
		render("/sys/function_ope.jsp");
	}
	public void insert() {
		String name = getPara("name");
		String path = getPara("path");
		if(Functioninfo.dao.insert(name, path));
		renderJson("{\"statusCode\":\"200\",\"message\":\"\u64cd\u4f5c\u6210\u529f\",\"tabid\":\"table, table-fixed\",\"closeCurrent\":true,\"forward\":\"/function\"}");
		
	}
	public void update() {
		String id = getPara("fuid");
		String name = getPara("name");
		String path = getPara("path");
		if (Functioninfo.dao.update(id,name, path)) {
			renderJson("{\"statusCode\":\"200\",\"message\":\"\u64cd\u4f5c\u6210\u529f\",\"tabid\":\"table, table-fixed\",\"closeCurrent\":true,\"forward\":\"/function\"}");
		}
	}
	
	public void delete() {
		if (Functioninfo.dao.findById(getPara("id")).delete()) {
			renderJson("{\"statusCode\":\"200\",\"message\":\"\u64cd\u4f5c\u6210\u529f\",\"tabid\":\"table, table-fixed\",\"closeCurrent\":true,   \"forward\":\"/function\"}");
		}
	}
}
