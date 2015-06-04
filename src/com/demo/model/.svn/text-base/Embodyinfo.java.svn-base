package com.demo.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class Embodyinfo extends Model<Embodyinfo> {
	public static Embodyinfo dao = new Embodyinfo();

	public Page<Embodyinfo> paginate(int pageNumber, int pageSize, String where,
			Object[] objects) {
		return paginate(pageNumber, pageSize, "select *", "from `embody` where 1=1 "+ where, objects);
	}

	public boolean add(String uid, String role, String fid, String price,
			String id) {
		return Embodyinfo.dao.set("uid", uid).set("role", role).set("fid", fid)
				.set("price", price).set("status", "-1").set("rid", id)
				.remove("id").save();
	}

	public boolean see_id(String id, String uid) {
		boolean messager = false;
		if (Embodyinfo.dao.findFirst("select * from `embody` where rid='" + id	+ "'  and uid='" + uid + "'") == null) {
			messager = true;
		}
		return messager;
	}

}
