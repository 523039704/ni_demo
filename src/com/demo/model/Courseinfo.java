package com.demo.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class Courseinfo extends Model<Courseinfo> {
	public static Courseinfo dao = new Courseinfo();

	public Page<Courseinfo> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *",
				"from course where 1=1 ");
	}

	public boolean update(String id, String name, String createdatetime,
			String coursedatetime, String price, String peoples,
			String service, String summary) {
		return Courseinfo.dao.findById(id).set("name", name)
				.set("createdatetime", createdatetime).set("coursedatetime", coursedatetime).set("price", price)
				.set("peoples", peoples).set("service", service).set("summary", summary).update();
	}

	
	public boolean  insert(String name, String createdatetime,
			String coursedatetime, String price, String peoples,
			String service, String summary)
	{
		return Courseinfo.dao.set("name", name)
				.set("createdatetime", createdatetime).set("coursedatetime", coursedatetime).set("price", price)
				.set("peoples", peoples).set("service", service).set("summary", summary).save();
	}
}
