package com.demo.contaller;

import java.util.List;

import com.demo.model.Rangeinfo;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

public class Rangecontroller extends Controller {

	public void index() {
		Page<Rangeinfo> pager = Rangeinfo.dao.paginate(
				getParaToInt("pageCurrent", 1), getParaToInt("pageSize", 20));
		List<Rangeinfo> articlesList = pager.getList();
		setAttr("range", articlesList);
		setAttr("pager", pager);
		render("/sys/range.jsp");
	}

	public void add() {
		render("/sys/range_ope.jsp");
	}

	public void edit() {
		setAttr("range", Rangeinfo.dao.findById(getPara("id")));
		render("/sys/range_ope.jsp");
	}

	public void insert() {
		String min = getPara("min");
		String max = getPara("max");
		String income = getPara("income");
		if (Rangeinfo.dao.insert(min, max, income)) {
			renderJson("{\"statusCode\":\"200\",\"message\":\"\u64cd\u4f5c\u6210\u529f\",\"tabid\":\"table, table-fixed\",\"closeCurrent\":true,\"forward\":\"/range\"}");
		}
	}
	
	public void update() {
		String id = getPara("id");
		String min = getPara("min");
		String max = getPara("max");
		String income = getPara("income");
		if (Rangeinfo.dao.update(id,min, max, income)) {
			renderJson("{\"statusCode\":\"200\",\"message\":\"\u64cd\u4f5c\u6210\u529f\",\"tabid\":\"table, table-fixed\",\"closeCurrent\":true,\"forward\":\"/range\"}");
		}
	}
	
	public void delete() {
		if (Rangeinfo.dao.findById(getPara("id")).delete()) {
			renderJson("{\"statusCode\":\"200\",\"message\":\"\u64cd\u4f5c\u6210\u529f\",\"tabid\":\"table, table-fixed\",\"closeCurrent\":true,   \"forward\":\"/range\"}");
		}
	}
}
