package com.demo.contaller;

import java.io.File;
import java.util.List;

import com.basic.util.DateUtil;
import com.demo.innterceptor.BasiceInterceptor;
import com.demo.model.Courseinfo;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.upload.UploadFile;
@Before(BasiceInterceptor.class)
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
			renderJson("{\"statusCode\":\"200\",\"message\":\"\u64cd\u4f5c\u6210\u529f\",\"tabid\":\"table, table-fixed\",\"closeCurrent\":true,\"forward\":\"/course\"}");
		}
	}

	public void update() {
		String id = getPara("id");

		String name = getPara("name");
		String createdatetime = getPara("createdatetime");
		String coursedatetime = getPara("coursedatetime");
		String price = getPara("price");
		String peoples = getPara("peoples");
		 String admin=getPara("admin");
		 String filiale=getPara("filiale");
		 String agent=getPara("agent");
		 String business=getPara("business");
		String summary = getPara("summary");

		if (Courseinfo.dao.update(id, name, createdatetime, coursedatetime,
				price, peoples,admin,filiale,agent,business, summary)) {
			
			renderJson("{\"statusCode\":\"200\",\"message\":\"\u64cd\u4f5c\u6210\u529f\",\"tabid\":\"table, table-fixed\",\"closeCurrent\":true, \"forward\":\"/course\"}");
		}
	}

	public void insert() {
		String name = getPara("name");
		String createdatetime = getPara("createdatetime");
		String coursedatetime = getPara("coursedatetime");
		String price = getPara("price");
		String peoples = getPara("peoples");
		 String admin=getPara("admin");
		 String filiale=getPara("filiale");
		 String agent=getPara("agent");
		 String business=getPara("business");
		String summary = getPara("summary");
		String id = getCookie("id");
		 System.out.println(business);
		// --------------------------------
		if(Courseinfo.dao.insert(id,name, createdatetime, coursedatetime, price, peoples,summary,admin,filiale,agent,business))
		{
		renderJson("{\"statusCode\":\"200\",\"message\":\"\u64cd\u4f5c\u6210\u529f\",\"tabid\":\"table, table-fixed\",\"closeCurrent\":true, \"forward\":\"/course\"}");
		}
	}
	public void course_img() {
		String path = "C:/virtualhost/weixin/ROOT/uploading/course/";
		 UploadFile file = getFile("custom.pic", path, 200 * 1024 * 1024,"UTF-8");
		 String oldfilename=file.getFileName();
		 String newfilename=DateUtil.makeTimestamp()+"."+oldfilename.split("\\.")[1];
		 File dest=new File(path+newfilename);
		 file.getFile().renameTo(dest);
		 String fname = "http://22.ftezu.net/uploading/course/" + newfilename;
		 String reallpath=path+newfilename; 
		 String uid=Courseinfo.dao.insert_img(fname, reallpath);
		 setCookie("id", uid, 100);
		 renderJson("{\"statusCode\":\"200\",\"message\":\"上传成功！\",\"filename\":\""+ fname + "\"}");
	}
}
