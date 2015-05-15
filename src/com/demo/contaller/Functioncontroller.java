package com.demo.contaller;

import com.demo.model.Functioninfo;
import com.jfinal.core.Controller;

public class Functioncontroller extends Controller {

	public void index() {
		setAttr("function", Functioninfo.dao.paginate(getParaToInt(0, 1), 10));
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
