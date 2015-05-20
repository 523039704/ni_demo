package com.demo.contaller;

import java.util.List;

import com.demo.model.Courseinfo;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

public class Coursecontroller extends Controller {
	public void index() {
		Page<Courseinfo> pager = Courseinfo.dao.paginate(
				getParaToInt("pageCurrent", 1), getParaToInt("pageSize", 20));
		List<Courseinfo> articlesList = pager.getList();
		setAttr("course", articlesList);
		setAttr("pager", pager);
		render("/sys/course.jsp");
	}

	public void add() {
		setAttr("sid","1");
		render("/sys/course_ope.jsp");
	}

	public void edit() {
		setAttr("sid",getPara("sid"));
		setAttr("course", Courseinfo.dao.findById(getPara("id")));
		render("/sys/course_ope.jsp");
	}

	public void delete() {
		if (Courseinfo.dao.findById(getPara("id")).delete()) {
			renderJson("{\"statusCode\":\"200\",\"message\":\"\u64cd\u4f5c\u6210\u529f\",\"tabid\":\"table, table-fixed\",\"closeCurrent\":true,\"forward\":\"/product\"}");
		}
	}

	public void update() {
		String id = getPara("id");

		String name = getPara("name");
		String createdatetime = getPara("createdatetime");
		String coursedatetime = getPara("coursedatetime");
		String price = getPara("price");
		String peoples = getPara("peoples");
		String service = getPara("service");
		String summary = getPara("summary");

		if (Courseinfo.dao.update(id, name, createdatetime, coursedatetime,
				price, peoples, service, summary)) {
			
			renderJson("{\"statusCode\":\"200\",\"message\":\"\u64cd\u4f5c\u6210\u529f\",\"tabid\":\"table, table-fixed\",\"closeCurrent\":true, \"forward\":\"/course\"}");
		}
	}

	public void insert() {
		String name = getPara("name");
		String createdatetime = getPara("createdatetime");
		String coursedatetime = getPara("coursedatetime");
		String price = getPara("price");
		String peoples = getPara("peoples");
		String service = getPara("service");
		String summary = getPara("summary");
		// --------------------------------
		if(Courseinfo.dao.insert(name, createdatetime, coursedatetime, price, peoples, service, summary))
		{
		renderJson("{\"statusCode\":\"200\",\"message\":\"\u64cd\u4f5c\u6210\u529f\",\"tabid\":\"table, table-fixed\",\"closeCurrent\":true, \"forward\":\"/course\"}");
		}
	}

}
