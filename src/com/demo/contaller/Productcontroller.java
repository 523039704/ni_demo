package com.demo.contaller;

import java.util.ArrayList;
import java.util.List;
import com.basic.util.DateUtil;
import com.demo.model.Productinfo;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.upload.UploadFile;

public class Productcontroller extends Controller {

	public void index() {
		String address = getPara("address");
		List<Object> param = new ArrayList<Object>();
		StringBuffer where = new StringBuffer();
		if (address != null && address.length() > 0) {
			where.append("   and addressid=?");
			param.add(address);
			setAttr("address", address);
		} else {
			setAttr("address", "-1");
		}
		where.append(" order by id  ");
		Page<Productinfo> pager = Productinfo.dao.paginate(
				getParaToInt("pageCurrent", 1), getParaToInt("pageSize", 20),
				where.toString(), param.toArray());
		List<Productinfo> articlesList = pager.getList();
		setAttr("product", articlesList);
		setAttr("pager", pager);
		render("/sys/product.jsp");
	}

	public void add() {
		setAttr("sid", "1");
		render("/sys/product_ope.jsp");
	}

	public void edit() {
		setAttr("sid", getPara("sid"));
		setAttr("product", Productinfo.dao.findById(getPara("id")));
		render("/sys/product_ope.jsp");
	}

	public void delete() {
		if (Productinfo.dao.findById(getPara("id")).delete()) {
			renderJson("{\"statusCode\":\"200\",\"message\":\"\u64cd\u4f5c\u6210\u529f\",\"tabid\":\"table, table-fixed\",\"closeCurrent\":true,\"forward\":\"/product\"}");
		}
	}

	public void update() {
		String id = getPara("id");
		String name = getPara("name");
		String begindate = getPara("begindate");
		String enddate = getPara("enddate");
		String datetime = getPara("datetime");
		String strdate = getPara("strdate");
		String overdate = DateUtil.getDateStringBySeparator(DateUtil.getNowDateByAdd(strdate, datetime));
		String price = getPara("price");
		String address = getPara("address");
		String upe = getPara("upe");
		String information = getPara("information");
		String income = getPara("income");
		String admin = getPara("admin");
		String filiale = getPara("filiale");
		String agent = getPara("agent");
		String business = getPara("business");
		if (Productinfo.dao.update(id, name, begindate, enddate, datetime,
				price, address, upe, information, income, admin, filiale,
				agent, business, strdate, overdate)) {
			renderJson("{\"statusCode\":\"200\",\"message\":\"\u64cd\u4f5c\u6210\u529f\",\"tabid\":\"table, table-fixed\",\"closeCurrent\":true, \"forward\":\"/product\"}");
		}
	}

	public void insert() {
		String name = getPara("name");
		String begindate = getPara("begindate");
		String enddate = getPara("enddate");
		String datetime = getPara("datetime");
		String strdate = getPara("strdate");
		String overdate = DateUtil.getDateStringBySeparator(DateUtil.getNowDateByAdd(strdate, datetime));
		String price = getPara("price");
		String address = getPara("address");
		String upe = getPara("upe");
		String information = getPara("information");
		String income = getPara("income");
		String admin = getPara("admin");
		String filiale = getPara("filiale");
		String agent = getPara("agent");
		String business = getPara("business");
		if (Productinfo.dao.insert(name, begindate, enddate, datetime, price,
				address, upe, information, income, admin, filiale, agent,
				business, strdate, overdate)) {
			renderJson("{\"statusCode\":\"200\",\"message\":\"\u64cd\u4f5c\u6210\u529f\",\"tabid\":\"table, table-fixed\",\"closeCurrent\":true, \"forward\":\"/product\"}");
		}
	}

	public void product_img() {
		String path = "C:/virtualhost/weixin/ROOT/uploading/product/";
		UploadFile file = getFile("custom.pic", path, 200 * 1024 * 1024,"UTF-8");
		String fname = "http://22.ftezu.net/uploading/product/" + file.getFileName();
		setAttr("seepath", fname);
		setAttr("path", path + fname);
		// Shopinfo.dao.update_img(id,"http://localhost/"+fname,path+fname);
		renderJson("{\"statusCode\":\"200\",\"message\":\"上传成功！\",\"filename\":\""
				+ fname + "\"}");
	}
}
