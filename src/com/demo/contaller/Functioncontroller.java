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
		render("/sys/function_ope.jsp");
	}

	public void insert() {
		String name = getPara("name");
		String path = getPara("path");
		if(Functioninfo.dao.insert(name, path));
		redirect("/function");
	}
}
